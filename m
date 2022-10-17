Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713C6010C8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 16:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424429.671834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQnl-0004ny-9g; Mon, 17 Oct 2022 14:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424429.671834; Mon, 17 Oct 2022 14:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQnl-0004lI-6k; Mon, 17 Oct 2022 14:09:09 +0000
Received: by outflank-mailman (input) for mailman id 424429;
 Mon, 17 Oct 2022 14:09:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OxM8=2S=amd.com=JESHWANTHKUMAR.NK@srs-se1.protection.inumbo.net>)
 id 1okQnj-0004lC-0p
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 14:09:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c82c40-4e25-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 16:09:05 +0200 (CEST)
Received: from DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 14:09:01 +0000
Received: from DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::e64f:1647:9309:e3f7]) by DM6PR12MB4564.namprd12.prod.outlook.com
 ([fe80::e64f:1647:9309:e3f7%9]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 14:09:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 41c82c40-4e25-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBYx0odbknFAAH3fgsHA96NmUaVcQFn2dTTVXrv05ON/A+Z7XMoXnXUDw/m/XZIm5nsQEDPB6GRJ5BqBrV16kCKM32gz8tGCPGYjAwQkTCdqSRV2yjqG8Zf90r7yTve2HNquSNSKAX9b04maxRE1S0yNkMVMpc1f3bOkrN1cZXHMCojAuF10i4g76xKDmsweAW0tKMllxi7ixEZuPN7WlOOpDcUwAgkvaeQeoI6hIfjjY0jrkla2yf5jYAWKfu25QsJ5rGbNZ6qxl8nGR9KN+36rRCFK4qcnm8F1osg+OwxPuHfYQW4cSNPYuvHIrnmdd2M+c7KPJBQCYw3EunckOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HPPNHf2pilwiFiyaraxvdFEuOe9FSEUTnUIubE2b8o=;
 b=K7UTMuOjByyugTOcmeMnOK9HMNiu9ZmRLIJgX+SoeKdHHfs/MNUql2wlP/+GyBQAOqzR+VwGiEwkDI23gN9+UHo3nAnBIJs75CGF/GbLazLq8t3ugG4JYSNk1ac3h0tH7wJHbzk6CGiAXobAuY/4jLtFC2PrOyc2mYcn2NTA6056H4Icy5a4l6+XC/Ulv9rfMeOYPfpPgEiqBBO12LGPOjzncVXkVnBav1yPOv9yqEW1MCPjMruUfdkvj6nM6Ucbm2xG7mxjtu6R2qYdHDWS4GQSYA1kw5rx4XUo9qO/ut1ADtnI/XRUWkxhyEaz+TWqn0W1skKFUUM5xaMki69pHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HPPNHf2pilwiFiyaraxvdFEuOe9FSEUTnUIubE2b8o=;
 b=OmhnLrXzCq7QtZC7ElfKrlURUUZ8zY9eecsVF7QYfJxMh7O3iuoPB5BiZ8WQuI4WA44IzZvqqIO4F4Osht1WFXuAN2u/8CgGnVKYpV0tCrcZ263xw1gxvxyZ1DhqUnQ/Ddc3FGk656xL2MM5RbsSZmjX89CWKnVzQKKYVZD2kx0=
From: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Thomas, Rijo-john"
	<Rijo-john.Thomas@amd.com>, "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
	"SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>
Subject: RE: privcmd.c not calling set_phys_to_machine
Thread-Topic: privcmd.c not calling set_phys_to_machine
Thread-Index: AQHY4BCJ7DwxaYBeYEW9c+uqhEENDa4SLiEAgABq0VA=
Date: Mon, 17 Oct 2022 14:09:01 +0000
Message-ID:
 <DM6PR12MB45642B7AC946ACAA9A010762E6299@DM6PR12MB4564.namprd12.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>
 <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
In-Reply-To: <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-10-17T13:29:52Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=0c274a3c-e8a0-48b9-9b7c-17bd7c41fc03;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-10-17T14:08:56Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 adaf20a8-6c47-4db1-a700-9eb96fb013d5
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4564:EE_|DS0PR12MB6488:EE_
x-ms-office365-filtering-correlation-id: 9099566b-1324-4965-2ddb-08dab0492485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wPDPAUQr7axnToSY3B3Vtg4upMGAkXX8eq8Y2KzrZRkz7H8iTCSAKxuvLI+q0pzfXkv0ZExWxWV7SJBRZpV7x2vvMqPVN4ZpgK77BiqXZ0QroVs7vCvWRJbwxO/K9ldSJlEnGzTMKvnhk7jv5qPsRkQNcmpfDYU9WiReT2eMHGOpd8WxUE4ihTB5nNjS5HMsCMe0yQqGB9wtq5EHwfQwZqEslyv5SYF0xszWLZ1QZblByk9fnK0eQw95WkOdMShueEmgwpleTUJmJQmhJDagBpzUJ91oDvJH4/QP16YzEkDv00dsbYJq23ZSjT7OboY+WNboEm4nhUqElV0y8l7CW1z04XOVe0M/EdTYGss+9lVXNUsL3hN1N44+1K1bTi0YwMWm/TbHaNJekPnXWujZVY2aHQ5+ozOA9QCrqOIwhszxn9pQzYJoCboRRMlftb2G0ijeFA9AUm/0K47DRlOGZu7Pd+sx0KaUxwegLEi7EtTi5+EKOyfNyEYWeF39DojL6thHO7YwrBUJmOVf0OFdh0Tkjk//YVwkjy69bwEwu+ImT27QPWN9agVZtVfoMXrD/o1LP0hM93yq41d5JHaRCjCkco+LaAOxkBaU4065gjrBcimdyix+Ckfo8YIJkYjZVMfPamw+N9GaysRF58QPhxYUwD3dGjb3wMXLgOYV980a7ST1+ShwVKH1FNR1cjlOc383rclfYItw1EOXcOyBYfQdikx6/adybTLL3tJQBuGS8pfhuusNayfQoEl2c0/17g3ND1Urun1j8ero9FG4L7Msg/kkXMgzYsZReB3XoTc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4564.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(38070700005)(478600001)(71200400001)(122000001)(966005)(38100700002)(4326008)(186003)(33656002)(316002)(66946007)(66476007)(64756008)(66446008)(66556008)(110136005)(54906003)(8676002)(76116006)(6506007)(5660300002)(7696005)(53546011)(26005)(41300700001)(9686003)(52536014)(8936002)(55016003)(86362001)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTEyMjE4UEpnTHc5K3RaVlZlS0tCRk02cEpsRmtydFFEalQ5czhhcmVleExj?=
 =?utf-8?B?NStEVmFzck9EWm9PTlVkaFo2Z0JOdVhjZGdrYi9PWXJKc3FZOVQyRnVnSlRS?=
 =?utf-8?B?ekRwajZOdldGQWx1dE9vZSt1QXRaaVFUcUpmWGtReFJDUnFzelo1aGFHRXpt?=
 =?utf-8?B?NHdnMU5xU3dsUHZmUllkdkxpeE1oKzhLWFhaM2tESDVDTkdTSlpSSXdrTHI4?=
 =?utf-8?B?VXovcmF5QlJwOXdISmJzZ1FvL21KNDhvZWZHU3NsM3N0SkdsUDlhUTAxSG5t?=
 =?utf-8?B?dkdRbG9mMWViZExMNTlaTGZlalJUVjFjbDBSQ21rSkN2ekcxUExpeGlSZTkw?=
 =?utf-8?B?bTBKR0ZYMk45NnArdVdFVmFaQXJBTkJGaHZNelZqazk2OUJweThVc0dxeXky?=
 =?utf-8?B?RS9jVHVCM0VRNlR2ZzF0Y1hlOXpjRjh1eG43UWluTmJFU052SVNLRGh0bGZ3?=
 =?utf-8?B?MjVpSm1raGpRVWVLUGp3cXJCeGhZUENRQ0NvREJDMmxWS3hYYzVEN3gxWnps?=
 =?utf-8?B?NEVxby9abnB3QzFMOGhCcWlQbExRVFNaV1kvditJQXUyS05XNms4Nkwxa09o?=
 =?utf-8?B?TGpOcmlaZk9tb1NUOXVWWkljR09CT0I4Y0NKeVZSOFZHcm1BUmdnaks5WC9J?=
 =?utf-8?B?TFN0bGVvZEJZU280R0pIQlJmQm10MVJWVENMZ29CRlY3U2NCVzEzZ05IVlJB?=
 =?utf-8?B?eEdBaVl5MDNUd2VRdmdwdTRRYzV0dG0vakFhQ0JobWhLbGRjVGhFSmFxN2xG?=
 =?utf-8?B?SFBnTis4NzBPT1RPOHRtMURJNk85L3ZyZWVZZXZuNnNoZGxRV2F5dE50SkdW?=
 =?utf-8?B?Y2J0OGRqcENINzBDQ2JrbkdCeDhCOWlLdXpUaTVlNjdramp5cGlleXlRSnZj?=
 =?utf-8?B?dWZQaDRyWWsvZnBtL3FpNnp2MjdpeGNPUExoVU9IY1l1ektlNGhxeUlQMHd1?=
 =?utf-8?B?R1BLWUNBdWZEWi9nYUpVTXhiRGhPTWZ6ZFRjNktpd3ZzVEhaSXdMT256NEVR?=
 =?utf-8?B?WUFGTTJyenBqQmhmYVpZVFRpU0ZOU1VkTk85OENJUFloampOdm8rdENEMkky?=
 =?utf-8?B?QVJZMDNyOVdEVGsreFAxY29DMDVCSkZ4WUQ3b3NtSkt4a2tpZllmZkpNNGZl?=
 =?utf-8?B?YUtBMzYyb2gvVGhVemtheUMrRTY5THpDZ1VOaFhPdWpwUUxTMEEwSEpSakFY?=
 =?utf-8?B?NnlZWlhpR2VoRUd3eDI1ZE1vTU53U1lXZHVqTVFnRzVQL1F6OWpQaXFOcG5Q?=
 =?utf-8?B?T1NjU1ZyWUFSbklKa0J1WFkyUkplNEFFcHZNOC9DWmMzbElpRVo0RlJlUUNh?=
 =?utf-8?B?UWsrOGphcUdwNEh4M3pHc0xid1hjaHJaVXdISGQ3MnQxcmlic2pZWEtLVDcw?=
 =?utf-8?B?ZFVLVExRakJiYm9LQm9MQTJBdUZGaGtibzRpbmFYejNpWjNoemc3NzBMOEt4?=
 =?utf-8?B?NkxSeHRwTkVtMmczdzFQVVFoZ3lORzJVdnFmUkxQcTdxV3VudWtoMC9CSmkx?=
 =?utf-8?B?QVhpYzRuejNIWHV0OGZkMHkzcEZLVkJYbVFmWG03MmQzenVwMUk2MnB3WUVw?=
 =?utf-8?B?NEU3OVlQR2pacXFuMjdKTFFmZURhUitqc2I4MW9GTFl6UlZtODljRjRQNHd4?=
 =?utf-8?B?bko4VlJNY1lOOEFjT1RRTVRlZ1hjQUQ3L0Q3RmZOSUlybUtEVjBBWHZqbDZM?=
 =?utf-8?B?LzZBMTZGKzhrZ3pkZjVsNDF3RWdCS0NmeSt3ditPT0J6VjNnYWhGNnpCVnN3?=
 =?utf-8?B?UGlYZnI2NDd4ajZBaFFnb08rZlRnelEwZUZRZ3BlelVGWUcxUE9PTnY2RThq?=
 =?utf-8?B?NU56VlgvOGRUTmQvVkVFMDZjRXZ1R2p2N2MzTkUrUmNwdVI3SHhEbXF5Rlpo?=
 =?utf-8?B?N01YVGN4ekFxWDFuU21UeFhJT1htcmxnYzZTcjNDdnNJMlkyK2ZZSVFReE1y?=
 =?utf-8?B?a0kvUkNJZ3F2QmJpZ2hETmxoZVVLRG03NFgxczdvdTJabVZ2M2FsZFNUS3VW?=
 =?utf-8?B?M3dBb21kNnRwL0ZaQThUWGhPTE5ZSkQwWmpuYVNJR2xtYnFROVhBV3JLOWI3?=
 =?utf-8?B?dnFBa21JZU1OYk9Ba2ZRd3dlaXQ4ZldURUxKMUxCbEtYRWZKNEdUTWx3VWJF?=
 =?utf-8?Q?ERQF9HNpLrTrY96hxpuIMiwxW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9099566b-1324-4965-2ddb-08dab0492485
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 14:09:01.7999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yXHUIZbEAnLDFs9KlOB6ihnJxnKqezxJkXb2F0FpBXyIlntTZR6twKQwJy1sw7UxtFUQI+9bW54mGKfYtzjSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIEp1ZXJnZW4sDQoNCj4+IEkn
bSByYXRoZXIgc3VyZSAiQU1EIFRFRSBkcml2ZXIgZ2V0IHRoZSBsaXN0IG9mIHBhZ2VzIGNvcnJl
c3BvbmRpbmcgdG8gdGhlIHZpcnR1YWwgYWRkcmVzcyIgaXMgdGhlIHByb2JsZW0uIFRoZSBQVEVz
IHNob3VsZCBoYXZlIHRoZSAic3BlY2lhbCIgZmxhZyBzZXQsIG1lYW5pbmcgdGhhdCB0aGVyZSBp
cyBubyBzdHJ1Y3QgcGFnZSBhc3NvY2lhdGVkIHdpdGggdGhpcyB2aXJ0dWFsIGFyZWEuDQoNClll
cywgeW91IGFyZSByaWdodCwgVG9kYXkgSSBoYXZlIG9ic2VydmVkIHRoYXQgcGFnZXMgcmV0dXJu
aW5nIGZyb20gInBpbl91c2VyX3BhZ2VzX2Zhc3QoKSAtIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjE2L3NvdXJjZS9kcml2ZXJzL3RlZS90ZWVfc2htLmMjTDE5NiIgaXMgemVy
by4gIChzaG0tPnBhZ2VzWzBdIGlzIHplcm8sIHdoZW4gc2htLT5udW1fcGFnZXMgaXMgMSkuDQoN
Cg0KUmVnYXJkcywNCkplc2h3YW50aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KU2VudDogTW9uZGF5LCBPY3RvYmVy
IDE3LCAyMDIyIDEyOjM4IFBNDQpUbzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20NCkNjOiBqYmV1bGljaEBzdXNl
LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBOSywgSkVTSFdBTlRIS1VNQVIg
KEpFU0hXQU5USCBLVU1BUikgPEpFU0hXQU5USEtVTUFSLk5LQGFtZC5jb20+DQpTdWJqZWN0OiBS
ZTogcHJpdmNtZC5jIG5vdCBjYWxsaW5nIHNldF9waHlzX3RvX21hY2hpbmUNCg0KT24gMTQuMTAu
MjIgMjM6MDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gSGkgSnVlcmdlbiBhbmQgYWxs
LA0KPiANCj4gSSBhbSB3cml0aW5nIGFnYWluIHRvIGFzayBhIHF1ZXN0aW9uIGFib3V0IHByaXZj
bWQuYyBpbiBQViBkb20wIHg4Ni4NCj4gVGhpcyBpcyByZWxhdGVkIHRvIHRoZSBwcmV2aW91cyBw
aW5fdXNlcl9wYWdlc19mYXN0IGlzc3VlOg0KPiANCj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVu
LWRldmVsJm09MTY2MjY4OTE0NzI3NjMwDQo+IGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZl
bCZtPTE2NjMyMjM4NTkxMjA1Mg0KPiANCj4gDQo+IEluIHN1bW1hcnkgdGhpcyBpcyB0aGUgc2l0
dWF0aW9uOg0KPiANCj4gMS4gZG9tVSAoSFZNKSBrZXJuZWwgc3BhY2U6DQo+ICAgICAgYS4gcGFn
ZXMgYWxsb2NhdGlvbiB3aXRoIGdldF9mcmVlX3BhZ2VzKCkNCj4gICAgICBiLiBnZXQgZG1hX2hh
bmRsZSBieSBjYWxsaW5nIGRtYV9tYXBfcGFnZSgpIG9uIHRoZSBwYWdlcyBhbGxvY2F0ZWQgaW4g
KDEuYSkNCj4gICAgICBjLiBzZW5kIGRtYV9oYW5kbGUgdG8gZG9tMCAoUFYpIHVzaW5nIHZpcnRp
byBxdWV1ZQ0KPiANCj4gMi4gZG9tMCB1c2Vyc3BhY2UgKFFFTVUpOg0KPiAgICAgICAgICBhLiBy
ZWFkIGRtYV9oYW5kbGUgZnJvbSB2aXJ0aW8gcXVldWUNCj4gICAgICAgICAgYi4gbWFwIGRtYV9o
YW5kbGUgdXNpbmcgUUVNVSBkbWFfbWVtb3J5X21hcCgpLCB3aGljaCBjYWxscw0KPiAgICAgICAg
ICAgICB4ZW5mb3JlaWdubWVtb3J5X21hcDIsIHdoaWNoIGlzIElPQ1RMX1BSSVZDTURfTU1BUEJB
VENIX1YyLA0KPiAgICAgICAgICAgICB3aGljaCBlbmRzIHVwIGNhbGxpbmcgZHJpdmVycy94ZW4v
cHJpdmNtZC5jOnByaXZjbWRfaW9jdGxfbW1hcF9iYXRjaA0KPiAgICAgICAgICAgICBbdGhpcyBp
cyB2ZXJpZmllZCB0byB3b3JrIGNvcnJlY3RseSwgdGhlIG1hcHBpbmcgd29ya3NdDQo+ICAgICAg
ICAgIGMuIG9wZW4gL2Rldi90ZWUgbm9kZSBhbmQgbWFrZSBhbiBpb2N0bCBjYWxsIHRvIHJlZ2lz
dGVyIHRoZQ0KPiAgICAgICAgICAgICB2aXJ0dWFsIGFkZHJlc3MgKGZyb20gc3RlcCAyLmIpIHdp
dGggVEVFLg0KPiANCj4gMy4gZG9tMCBrZXJuZWwgc3BhY2U6DQo+ICAgICAgICAgIGEuIEFNRCBU
RUUgZHJpdmVyIGdldCB0aGUgdmlydHVhbCBhZGRyZXNzIHBhc3NlZCBieSB1c2Vyc3BhY2UNCj4g
ICAgICAgICAgYi4gQU1EIFRFRSBkcml2ZXIgZ2V0IHRoZSBsaXN0IG9mIHBhZ2VzIGNvcnJlc3Bv
bmRpbmcgdG8gdGhlDQo+ICAgICAgICAgICAgIHZpcnR1YWwgYWRkcmVzcyAoMy5hKSBhbmQgY2Fs
bHMgZG1hX21hcF9wYWdlKCkgb24gdGhlbQ0KDQpJJ20gcmF0aGVyIHN1cmUgIkFNRCBURUUgZHJp
dmVyIGdldCB0aGUgbGlzdCBvZiBwYWdlcyBjb3JyZXNwb25kaW5nIHRvIHRoZSB2aXJ0dWFsIGFk
ZHJlc3MiIGlzIHRoZSBwcm9ibGVtLiBUaGUgUFRFcyBzaG91bGQgaGF2ZSB0aGUgInNwZWNpYWwi
IGZsYWcgc2V0LCBtZWFuaW5nIHRoYXQgdGhlcmUgaXMgbm8gc3RydWN0IHBhZ2UgYXNzb2NpYXRl
ZCB3aXRoIHRoaXMgdmlydHVhbCBhcmVhLg0KDQo+IFRoZSBsYXN0IHN0ZXAgKDMuYikgbWlzYmVo
YXZlcyBhcyBkZXZfYWRkciBhdCB0aGUgYmVnaW5uaW5nIG9mIA0KPiB4ZW5fc3dpb3RsYl9tYXBf
cGFnZSAod2hpY2ggaW1wbGVtZW50cyBkbWFfbWFwX3BhZ2UoKSBpbiBkb20pKSBpcyAwLg0KPiAN
Cj4gICAgZG1hX2FkZHJfdCBkZXZfYWRkciA9IHhlbl9waHlzX3RvX2RtYShkZXYsIHBoeXMpOw0K
PiAgICAvKiBkZXZfYWRkciBoZXJlIGlzIHplcm8gKi8NCj4gDQo+IA0KPiBDb3VsZCBpdCBiZSB0
aGF0IHRoZSBvcmlnaW5hbCBtYXBwaW5nIG9mIHRoZSBmb3JlaWduIHBhZ2VzIGluIERvbTAsIA0K
PiBkb25lIGJ5IHN0ZXAgMi5iLCBpcyBub3QgY29tcGxldGU/IExvb2tpbmcgaW50byANCj4gcHJp
dmNtZF9pb2N0bF9tbWFwX2JhdGNoLCBmb3IgUFYgZ3Vlc3RzLCBpdCBpcyBjYWxsaW5nIG1tYXBf
YmF0Y2hfZm46DQo+IA0KPiAJQlVHX09OKHRyYXZlcnNlX3BhZ2VzX2Jsb2NrKG0ubnVtLCBzaXpl
b2YoeGVuX3Bmbl90KSwNCj4gCQkJCSAgICAmcGFnZWxpc3QsIG1tYXBfYmF0Y2hfZm4sICZzdGF0
ZSkpOw0KPiANCj4gbW1hcF9iYXRjaF9mbiBjYWxscyB4ZW5fcmVtYXBfZG9tYWluX2dmbl9hcnJh
eSwgd2hpY2ggY2FsbHMgDQo+IHhlbl9yZW1hcF9wZm4uDQo+IA0KPiB4ZW5fcmVtYXBfcGZuIG9u
bHkgY2hhbmdlcyB0aGUgVkEtPlBBIG1hcHBpbmcgYW5kIGRvZXMgbm90aGluZyBlbHNlLg0KPiBT
cGVjaWZpY2FsbHksIG5vYm9keSBzZWVtcyB0byBjYWxsIHNldF9waHlzX3RvX21hY2hpbmUgaW4g
dGhpcyBjb2RlIA0KPiBwYXRoLiBJc24ndCBzZXRfcGh5c190b19tYWNoaW5lIHJlcXVpcmVkPw0K
DQpOb3QgZm9yIHNwZWNpYWwgbWVtb3J5IHBhZ2VzLg0KDQo+IERvbid0IHdlIG5lZWQgYSBjYWxs
IHRvIHNldF9waHlzX3RvX21hY2hpbmUgc28gdGhhdCB0aGUgbmV4dCB0aW1lIGEgDQo+IGRyaXZl
ciB0cmllcyB0byBjYWxsOg0KPiANCj4gICAgLyogYWRkcmVzcyBpcyB0aGUgdmlydHVhbCBhZGRy
ZXNzIHBhc3NlZCBieSBRRU1VIHVzZXJzcGFjZSAqLw0KPiAgICBkbWFfbWFwX3BhZ2UodmlydF90
b19wYWdlKGFkZHJlc3MpKQ0KPiANCj4gaXQgd2lsbCBiZWhhdmUgY29ycmVjdGx5PyBPciBhbSBJ
IG1pc3Npbmcgc29tZXRoaW5nPw0KPiANCj4gDQo+IEhvdyBpcyB4ZW5fcGh5c190b19kbWEgZXhw
ZWN0ZWQgdG8gd29yayBjb3JyZWN0bHkgZm9yOg0KPiANCj4gICAgLyogYWRkcmVzcyBpcyB0aGUg
dmlydHVhbCBhZGRyZXNzIHBhc3NlZCBieSBRRU1VIHVzZXJzcGFjZSBhbmQgbWFwcGVkDQo+ICAg
ICAqIGluIDIuYiAqLw0KPiAgICBwaHlzX2FkZHIgPSB2aXJ0X3RvX3BoeXMoYWRkcmVzcyk7DQo+
ICAgIHhlbl9waHlzX3RvX2RtYShkZXYsIHBoeXNfYWRkcik7DQo+IA0KPiANCj4gTXkgZ3Vlc3Mg
d291bGQgYmUgdGhhdCB3ZSBuZWVkIHRvIGFkZDoNCj4gDQo+ICAgIHNldF9waHlzX3RvX21hY2hp
bmUocGZuLCBGT1JFSUdOX0ZSQU1FKG1mbikpOw0KPiANCj4gaW4gbW1hcF9iYXRjaF9mbiBvciB4
ZW5fcmVtYXBfcGZuPw0KDQpJIHRoaW5rIHRoaXMgbWlnaHQgYmUgYSBsaXR0bGUgYml0IG1vcmUg
Y29tcGxpY2F0ZWQuDQoNClRoaXMgY291bGQgd29yaywgaWYgdGhlcmUgaXMgcmVhbGx5IGEgc3Ry
dWN0IHBhZ2UgYXZhaWxhYmxlIGZvciB0aGUgUEZOLg0KT1RPSCB0aGlzIG1pZ2h0IGJlIG5vdCB0
aGUgY2FzZSBxdWl0ZSBvZnRlbiwgYXMgd2UgYXJlIHVzaW5nIHpvbmUgZGV2aWNlIG1lbW9yeSBm
b3IgZm9yZWlnbiBtYXBwaW5ncyBwZXIgZGVmYXVsdCBmb3Igc29tZSB0aW1lIG5vdy4NCg0KU29s
dmluZyB0aGlzIG1pZ2h0IHJlcXVpcmUgc29tZXRoaW5nIGxpa2UgZG1hX21hcF9wZm4oKSBpbnN0
ZWFkIG9mIGRtYV9tYXBfcGFnZSgpLCB3aGljaCBzb3VuZHMgYSBsaXR0bGUgYml0IGxpa2UgZG1h
X2RpcmVjdF9tbWFwKCkuDQoNCg0KSnVlcmdlbg0K

