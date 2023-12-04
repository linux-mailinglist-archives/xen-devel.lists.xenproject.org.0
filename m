Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22758802B5C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 06:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646502.1008815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA1eq-0002HC-Q3; Mon, 04 Dec 2023 05:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646502.1008815; Mon, 04 Dec 2023 05:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA1eq-0002Ef-Lm; Mon, 04 Dec 2023 05:38:16 +0000
Received: by outflank-mailman (input) for mailman id 646502;
 Mon, 04 Dec 2023 05:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5cgf=HP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rA1eo-0002EW-QR
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 05:38:15 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc11760-9267-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 06:38:12 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 05:38:07 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 05:38:06 +0000
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
X-Inumbo-ID: 4fc11760-9267-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jid3Qlpwx8EfBnEp/yJAmVtPKThOQj0ouyG/u2X4qA7L35yHxdyHFuJRD/Jhq6qF1CyO2xANfLCs347CuyrlHqVyAFvIbI48boE3GO9OBw4XLpgFX27X+DIEaMj+iefZ2g5HWWcf0/53nr6fS+53elNUBZ0fE+OOAQwrlKNCjrtFqkj6bHIiy5eXsNw8pIiocMg08Bt4O/uiOonORm6XmkdMkxAI68FVJAMMhowqiajq1r42bw9/V34tW/J2/mN+LOSGPqW0SltxbtOao7MmodmMZtUlpMY2emAUlVPbDHNMvMqUsGe9S3f+RTq3BYazOmDwIhXygNz65HwN9ZV0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+jHOA5crJQE/M3R4WqciUpK6ckU/ukqoKfvEV+sg+4=;
 b=nVPx2iV2mZcFTMpzZNVntpbBjJNPjnjTFcvHHqibHaOW5ajUCGoXOXCffy7ZQbOAriaCO4Dwc65I71mpT3PhyfItAkFGCtps4OgTqVTYD8Gl04z+EGsk7/n7c1hzR0bJ/gmW7Jihofn4uwIudpc7JExnWCl6n7AEVdOVn+K+T143vkXqrZkuZNUi0H4SuU508VUaOH6XfYwcyq2JmVCUHc0VQszS05tOpCJiMUXmLpgrBDR2WbQhGuK4r9H7eM0u+0FHMm0s+ubThI/8qrcraQ1Exwsw+Pvf5bpKEryPxJCvLqUKtqR0GHj5FOXink0yYPxP9lT3N8dNMt8vglBpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+jHOA5crJQE/M3R4WqciUpK6ckU/ukqoKfvEV+sg+4=;
 b=1yW5OW0Yekj4tIhsOw9Kx+lgiW4lmyS07lP+oEwyZ/GM/XzA98dI5cSBQ5N8gOuU9jdE5wPK7PSlkDGw66LxkR5yY2JGRSwkBn/4Q/+bJpOYTE6KBEHdEPviMbKoyGHVtGuNMAMRy+y4LC6RaQUgoWSbGsxUUaUAKDyP1N8k5WA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Thread-Topic: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Thread-Index:
 AQHaHsLpM7vOINXdREip1dGZpT1r3bCPz92AgAJv+QCAAAbDAIAAZb6AgAEdpwCAAGLbgIAFAhuA
Date: Mon, 4 Dec 2023 05:38:06 +0000
Message-ID:
 <BL1PR12MB5849CEDE0F018E0DB86D8E2BE786A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com> <ZWX4R9UEE6oXiqaz@macbook>
 <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
 <ZWheuUjLxShoQ_qn@macbook>
 <alpine.DEB.2.22.394.2311301907370.110490@ubuntu-linux-20-04-desktop>
 <ZWmhRb6Ne4vgplzM@macbook>
In-Reply-To: <ZWmhRb6Ne4vgplzM@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5111.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN2PR12MB4341:EE_
x-ms-office365-filtering-correlation-id: 2da88765-61e4-445b-ea82-08dbf48b3128
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o4+Tihki9OQKeOCz9MHdpsAz0btzcrGG3EEiJ36lkFy0mdl5ceK7AKSgbPjPSqEgTYI+v/RJ3czbzG6AnmWihAnoYER7SEhab+zCUV/NYQV2TMxTOnsP2X07UsnwUQSrUDA/NRR/nAkJCl46KJkBErGlcPX+Ztc3wVtnK1Jiwt7k9NOMvFLizmbZwuYwheIzXu/zXhwUX4vrLfOZtZmBkFpVlN1OW1/hEkYLsoSD5q3CCPBbetXRE3wHimWisqlzuiw+bfA/RNJpIdFh7EEltzgtfT0fETsCLgHsRKmEtJ4KaMow6K5BGc2a9LRMvrVIVQ+LTynb9FM4U6srGEf7OSRezd4FTb3iFeafQSYFniwo91usJSe3Fri+fssmjDyECFqE8ic/moXB3ImgkvdFrina4Twa6wfgPOPSEkNdmDkTgzD/hMxOOP/V0HdZdAWE9zy+U+RKQ8LdbehEGVpGG476JsC/ylWHe4K/FrN9kjL2/Yw1DgMe+avgZHbQ8PlMONndE+LNVmgAqS+WSPVZE241/HnuEWPl4T82lLKVhGo0QiWcUgSwyAWi8PUm2E/E2OdeQB07P2QaCQyq83bdcDZvQDr8gGhzWhIo2svr+G50IJOG/zHeXFXgBdf8FzEh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66556008)(66446008)(64756008)(54906003)(316002)(8936002)(8676002)(4326008)(66946007)(66476007)(52536014)(478600001)(110136005)(76116006)(41300700001)(5660300002)(2906002)(33656002)(122000001)(38100700002)(26005)(7696005)(6506007)(71200400001)(9686003)(53546011)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTB4eEt1UU5zd0dhMXB1RHB4VGl0dkJlakRIZjNTd3g3bzBCMXNkdFNDTlhr?=
 =?utf-8?B?QTRGbzVBVnZqTTc1TUs4SmlvejdoajhzYi9ubWprNnVSaFFPRzRqTUh4L092?=
 =?utf-8?B?eDNrc0lCcVB1SE5wc0VyMlBqcUZIaU9pWlNhNml5RHdhYm9mMmtLTExrZThV?=
 =?utf-8?B?U0Z6cFZzNm43UFpCMGRSamtrUGtVbE9KSzVMTVRiUCtSbkJjSzFSdEhtL2t3?=
 =?utf-8?B?UG1JRDQrU3BXeUxjeDdJOEhRQWN3VjZtUnZEQnJnKzVaaVlmUUxmQzljWkxQ?=
 =?utf-8?B?bHRqdm9nV0xoZHE2VHpJcDQrOHhXdE1sTzhEejV1N2g5cE5iV1UvT00vTnZM?=
 =?utf-8?B?NGlRdEpHUDF3VXJkdHNPV3ZkQ3lTVUQwUU1RbmtWM2IzNzYxbUlCNFVkT1Z5?=
 =?utf-8?B?bHMyZnY3bk0rTGRPaFo5YWs5cDZjdkR6MkwzenY3OTl0QUpha09JblB0SG85?=
 =?utf-8?B?Q0xvS3Z2a0FGd3BkMkRaMkJteUhtOUVnNnovMHZXdlRoSCtNU1Nxc2FHdUlS?=
 =?utf-8?B?OFU0NHpiSlFRRklBKzB5SkJ3MVVGR2J0M2hBZ0txVUFPSFU1ZWpqaGp6MkJv?=
 =?utf-8?B?SWJCcFkvcG85NVkxUXg4ODZjUlA0S1BzaHVncGROU0ovZ3BnOU5nTmlFZEpI?=
 =?utf-8?B?eHpJRnN0ZlI1bE5iLzltTVZQSTFUMUxpZk5xSGl2cVhmRUp2b3NJOW1sYjFT?=
 =?utf-8?B?RTVNbm9vT3Awb01sNFJuRmE5UmpCbTRXSHJyekJKc2NXYTUycG1STURhOVN6?=
 =?utf-8?B?SGE3b2FZanpkQVluWS9sTjNGMWlETWl6SmIrYVpWK0o3UnI0dC9RUm1aa0VG?=
 =?utf-8?B?VTVITkNrV0JDWmtBaG9sTFhOWFJGTnhmdGg1SjV0ZW5pWDZPZEJ4b0lCeTJy?=
 =?utf-8?B?QUhUSDNnR0Q1UXBVTUFCaXc0ekVJbDE5aHVnNVhic1pyZnMwYnFWWW5ibmRu?=
 =?utf-8?B?elJmYy9uUHh3K1lROWFZSitKcDVXOHA4K1JLV21XUHZVNkZhM0NaMDNqRi9w?=
 =?utf-8?B?M2NURmpoZkdNaGFNYTJmdCtXcVhSRWVOQ0VESXhCN2pIenRnVkFQcXljUVNo?=
 =?utf-8?B?VkpQQkxqQldQczNpY1dHSGJuZVZXOFpwQS9KTTVUSVVWQUhRU0RPT3kycHJh?=
 =?utf-8?B?Q0VRZ2Y0RWRDSnVaMEYrdEhUaUQzWEhkZmgzT3QxV2RDbitCZS8yVDBtZWk3?=
 =?utf-8?B?UmlGcGpLZWxoRXora0pRbTFMajJIV3VDOWJuZnJtQlRFOEpPVzJYOG1NMmsy?=
 =?utf-8?B?WG92aU83Mis4MFM2c3VtVUJKMlBoS3hlZkozYU1xT2c1V25oeGROT3ppb3My?=
 =?utf-8?B?L0JBR2JlTUJvNk1RVkhSYm5ZSk16Mk4vdHJGSGZiZWcxcFpWRzFidDhtcGR5?=
 =?utf-8?B?RzNOU2tzWVZLQnpkOFZ3UTdpQmQydENGTERjYXBxc0xqT2p0cXZRNXJwYzlQ?=
 =?utf-8?B?R1lQODZuVUU3RmNNZFA3RmVndUlmUjBOdmEvVkdnTkFrVVlaWTlzSThlWG84?=
 =?utf-8?B?MWNHQlI0NjhyZTVFZ3JicCswTG1lM2FLbG9xNkNHR215WHYxSkh5MXNiNW8x?=
 =?utf-8?B?S1B5MnE1OWZjci9XdXo1bTJTU2k2anhpQ3ZKNHVTREJuclpVS1hac2VPV2x2?=
 =?utf-8?B?TmV1ZVZJNHRXSlpuTVNmU2d5VE9wT2dwRkNpVXNiL0QvZHBIK2Z2SndGK09Z?=
 =?utf-8?B?RFB6YUFxZFBGTnM0YjJYd0NobWxCMS9UQUtacDhkSlVKOVZtQS9VSXBiTkJZ?=
 =?utf-8?B?aGlPWXFDU2hrcE9TRyszVjBlV0xKMERJM3BqM2lOV0wwR2Y2R0tseEliVmY1?=
 =?utf-8?B?MmhRM00ySTlXdU5IcHZrejlTV3BjSUFycUZyOG9SeUIrb3hScjdRQjFkRXJX?=
 =?utf-8?B?cS9JSktxRldzNkpUcjJFeE9RRXY1d3ExZTBNTTZyTjJWYUNHTXh1MDJIMVVZ?=
 =?utf-8?B?RWpzbkZya3dQUFVPd1dwWnc3V2dBSUxFK1FzdkhiNDl1T2F2YkNjZHlZTUlC?=
 =?utf-8?B?SGZQSHNCNTFWdE5EZXVVdWVTVHVVVjhlQUF5eW5STW4yVGMwZnc1WC9vSzFo?=
 =?utf-8?B?TmNFblhjMWN4OWNjTVVlT21vWmxTdVVFMlNlRGNGcmtwYjBnVjM1MHpLc3Bv?=
 =?utf-8?Q?AyA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBDA34E66990694B9D022FB05F60D3D6@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da88765-61e4-445b-ea82-08dbf48b3128
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 05:38:06.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCIgUU3QzN8Cc8F9TGm+Yt+XR52GpljkTlL40Ok/oOf4EuY8dUC1GA6CMp38KUt/BCO22kmf7k7ITH724+K55w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341

T24gMjAyMy8xMi8xIDE3OjAzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUsIE5v
diAzMCwgMjAyMyBhdCAwNzowOToxMlBNIC0wODAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
DQo+PiBPbiBUaHUsIDMwIE5vdiAyMDIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9u
IFdlZCwgTm92IDI5LCAyMDIzIGF0IDA4OjAyOjQwUE0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGlu
aSB3cm90ZToNCj4+Pj4gbiBXZWQsIDI5IE5vdiAyMDIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+Pj4+PiBPbiBUdWUsIDI4IE5vdiAyMDIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4+Pj4+IE9uIEZyaSwgTm92IDI0LCAyMDIzIGF0IDA2OjQxOjM2UE0gKzA4MDAsIEppcWlhbiBD
aGVuIHdyb3RlOg0KPj4+Pj4+PiBJbiBQVkggZG9tMCwgaXQgdXNlcyB0aGUgbGludXggbG9jYWwg
aW50ZXJydXB0IG1lY2hhbmlzbSwNCj4+Pj4+Pj4gd2hlbiBpdCBhbGxvY3MgaXJxIGZvciBhIGdz
aSwgaXQgaXMgZHluYW1pYywgYW5kIGZvbGxvdw0KPj4+Pj4+PiB0aGUgcHJpbmNpcGxlIG9mIGFw
cGx5aW5nIGZpcnN0LCBkaXN0cmlidXRpbmcgZmlyc3QuIEFuZA0KPj4+Pj4+PiBpZiB5b3UgZGVi
dWcgdGhlIGtlcm5lbCBjb2RlcywgeW91IHdpbGwgZmluZCB0aGUgaXJxDQo+Pj4+Pj4+IG51bWJl
ciBpcyBhbGxvY2VkIGZyb20gc21hbGwgdG8gbGFyZ2UsIGJ1dCB0aGUgYXBwbHlpbmcNCj4+Pj4+
Pj4gZ3NpIG51bWJlciBpcyBub3QsIG1heSBnc2kgMzggY29tZXMgYmVmb3JlIGdzaSAyOCwgdGhh
dA0KPj4+Pj4+PiBjYXVzZXMgdGhlIGlycSBudW1iZXIgaXMgbm90IGVxdWFsIHdpdGggdGhlIGdz
aSBudW1iZXIuDQo+Pj4+Pj4+IEFuZCB3aGVuIHdlIHBhc3N0aHJvdWdoIGEgZGV2aWNlLCBRRU1V
IHdpbGwgdXNlIGl0cyBnc2kNCj4+Pj4+Pj4gbnVtYmVyIHRvIGRvIG1hcHBpbmcgYWN0aW9ucywg
c2VlIHhlbl9wdF9yZWFsaXplLT4NCj4+Pj4+Pj4geGNfcGh5c2Rldl9tYXBfcGlycSwgYnV0IHRo
ZSBnc2kgbnVtYmVyIGlzIGdvdCBmcm9tIGZpbGUNCj4+Pj4+Pj4gL3N5cy9idXMvcGNpL2Rldmlj
ZXMveHh4eDp4eDp4eC54L2lycSBpbiBjdXJyZW50IGNvZGUsDQo+Pj4+Pj4+IHNvIGl0IHdpbGwg
ZmFpbCB3aGVuIG1hcHBpbmcuDQo+Pj4+Pj4+IEFuZCBpbiBjdXJyZW50IGNvZGVzLCB0aGVyZSBp
cyBubyBtZXRob2QgdG8gdHJhbnNsYXRlDQo+Pj4+Pj4+IGlycSB0byBnc2kgZm9yIHVzZXJzcGFj
ZS4NCj4+Pj4+Pg0KPj4+Pj4+IEkgdGhpbmsgaXQgd291bGQgYmUgY2xlYW5lciB0byBqdXN0IGlu
dHJvZHVjZSBhIG5ldyBzeXNmcyBub2RlIHRoYXQNCj4+Pj4+PiBjb250YWlucyB0aGUgZ3NpIGlm
IGEgZGV2aWNlIGlzIHVzaW5nIG9uZSAobXVjaCBsaWtlIHRoZSBpcnEgc3lzZnMNCj4+Pj4+PiBu
b2RlKT8NCj4+Pj4+Pg0KPj4+Pj4+IFN1Y2ggaW9jdGwgdG8gdHJhbnNsYXRlIGZyb20gSVJRIHRv
IEdTSSBoYXMgbm90aGluZyB0byBkbyB3aXRoIFhlbiwgc28NCj4+Pj4+PiBwbGFjaW5nIGl0IGlu
IHByaXZjbWQgZG9lcyBzZWVtIHF1aXRlIHN0cmFuZ2UgdG8gbWUuICBJIHVuZGVyc3RhbmQNCj4+
Pj4+PiB0aGF0IGZvciBwYXNzdGhyb3VnaCB3ZSBuZWVkIHRoZSBHU0ksIGJ1dCBzdWNoIHRyYW5z
bGF0aW9uIGxheWVyIGZyb20NCj4+Pj4+PiBJUlEgdG8gR1NJIGlzIGFsbCBMaW51eCBpbnRlcm5h
bCwgYW5kIGl0IHdvdWxkIGJlIG11Y2ggc2ltcGxlciB0byBqdXN0DQo+Pj4+Pj4gZXhwb3NlIHRo
ZSBHU0kgaW4gc3lzZnMgSU1PLg0KPj4+Pj4NCj4+Pj4+IE1heWJlIHNvbWV0aGluZyB0byBhZGQg
dG8gZHJpdmVycy94ZW4vc3lzLWh5cGVydmlzb3IuYyBpbiBMaW51eC4NCj4+Pj4+IEp1ZXJnZW4g
d2hhdCBkbyB5b3UgdGhpbms/DQo+Pj4+DQo+Pj4+IExldCBtZSBhbHNvIGFkZCB0aGF0IHByaXZj
bWQuYyBpcyBhbHJlYWR5IGEgTGludXggc3BlY2lmaWMgaW50ZXJmYWNlLg0KPj4+PiBBbHRob3Vn
aCBpdCB3YXMgYm9ybiB0byBiZSBhIFhlbiBoeXBlcmNhbGwgInByb3h5IiBpbiByZWFsaXR5IHRv
ZGF5IHdlDQo+Pj4+IGhhdmUgYSBmZXcgcHJpdmNtZCBpb2N0bHMgdGhhdCBkb24ndCB0cmFuc2xh
dGUgaW50byBoeXBlcmNhbGxzLiBTbyBJDQo+Pj4+IGRvbid0IHRoaW5rIHRoYXQgYWRkaW5nIElP
Q1RMX1BSSVZDTURfR1NJX0ZST01fSVJRIHdvdWxkIGJlIGEgcHJvYmxlbS4NCj4+Pg0KPj4+IE1h
eWJlIG5vdCBhbGwgaW9jdGxzIHRyYW5zbGF0ZSB0byBoeXBlcmNhbGxzIChJIGd1ZXNzIHlvdSBh
cmUNCj4+PiByZWZlcnJpbmcgdG8gdGhlIElPQ1RMX1BSSVZDTURfUkVTVFJJQ1QgaW9jdGwpLCBi
dXQgdGhleSBhcmUgc3BlY2lmaWMNCj4+PiBYZW4gYWN0aW9ucy4gIEdldHRpbmcgdGhlIEdTSSB1
c2VkIGJ5IGEgZGV2aWNlIGhhcyBub3RoaW5nIGRvIHRvIHdpdGgNCj4+PiBYZW4uDQo+Pj4NCj4+
PiBJTU8gZHJpdmVycy94ZW4vc3lzLWh5cGVydmlzb3IuYyBpcyBhbHNvIG5vdCBhcHByb3ByaWF0
ZSwgYnV0IEknbSBub3QNCj4+PiB0aGUgbWFpbnRhaW5lciBvZiBhbnkgb2YgdGhvc2UgY29tcG9u
ZW50cy4NCj4+Pg0KPj4+IFRoZXJlJ3Mgbm90aGluZyBYZW4gc3BlY2lmaWMgYWJvdXQgZmV0Y2hp
bmcgdGhlIEdTSSBhc3NvY2lhdGVkIHdpdGggYQ0KPj4+IFBDSSBkZXZpY2UuICBUaGUgZmFjdCB0
aGF0IFhlbiBuZWVkcyBpdCBmb3IgcGFzc3Rocm91Z2ggaXMganVzdCBhIHJlZA0KPj4+IGhlcnJp
bmcsIGZ1cnRoZXIgY2FzZXMgd2hlcmUgdGhlIEdTSSBpcyBuZWVkZWQgbWlnaHQgYXJpc2Ugb3V0
c2lkZSBvZg0KPj4+IFhlbiwgYW5kIGhlbmNlIHN1Y2ggbm9kZSB3b3VsZCBiZXR0ZXIgYmUgcGxh
Y2VkIGluIGEgZ2VuZXJpYw0KPj4+IGxvY2F0aW9uLiAgVGhlIHJpZ2h0IGxvY2F0aW9uIHNob3Vs
ZCBiZSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vZ3NpLg0KPj4NCj4+IFRoYXQgbWlnaHQg
YmUgdHJ1ZSBidXQgL3N5cy9idXMvcGNpL2RldmljZXMvPHNiZGY+L2dzaSBpcyBhIG5vbi1YZW4N
Cj4+IGdlbmVyaWMgaW50ZXJmYWNlIGFuZCB0aGUgbWFpbnRhaW5lcnMgb2YgdGhhdCBwb3J0aW9u
IG9mIExpbnV4IGNvZGUNCj4+IG1pZ2h0IGhhdmUgYSBkaWZmZXJlbnQgb3Bpbmlvbi4gV2UnbGwg
aGF2ZSB0byBzZWUuDQo+IA0KPiBSaWdodCwgYnV0IGJlZm9yZSByZXNvcnRpbmcgdG8gaW1wbGVt
ZW50IGEgWGVuIHNwZWNpZmljIHdvcmthcm91bmQNCj4gbGV0J3MgYXR0ZW1wdCB0byBkbyBpdCB0
aGUgcHJvcGVyIHdheSA6KS4NCj4gDQo+IEkgY2Fubm90IHNlZSB3aHkgZXhwb3NpbmcgdGhlIGdz
aSBvbiBzeXNmcyBsaWtlIHRoYXQgd291bGQgYmUgYW4NCj4gaXNzdWUuICBUaGVyZSdzIGEgbG90
IG9mIHJlc291cmNlIGluZm9ybWF0aW9uIGV4cG9zZWQgb24gc3lzZnMNCj4gYWxyZWFkeSwgYW5k
IGl0J3MgYSB0cml2aWFsIG5vZGUgdG8gaW1wbGVtZW50Lg0KVGhhbmtzIGZvciBib3RoIG9mIHlv
dScgcyBzdWdnZXN0aW9ucy4gQXQgcHJlc2VudCwgaXQgc2VlbXMgdGhlIHJlc3VsdCBvZiBkaXNj
dXNzaW9uIGlzIHRoYXQgaXQgbmVlZHMgdG8gYWRkIGEgZ3NpIHN5c2ZzLiBJIHdpbGwgbW9kaWZ5
IGl0IGluIHRoZSBuZXh0IHZlcnNpb24gYW5kIHRoZW4gYWRkIHRoZSBjb3JyZXNwb25kaW5nIG1h
aW50YWluZXIgdG8gdGhlIHJldmlldyBsaXN0Lg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

