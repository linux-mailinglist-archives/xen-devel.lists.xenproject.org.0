Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9604DC849
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291603.495027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqio-0003Jp-T4; Thu, 17 Mar 2022 14:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291603.495027; Thu, 17 Mar 2022 14:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqio-0003Hj-Pw; Thu, 17 Mar 2022 14:03:22 +0000
Received: by outflank-mailman (input) for mailman id 291603;
 Thu, 17 Mar 2022 14:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUqin-0003HX-97
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:03:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00315bf9-a5fb-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:03:20 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-75QynDaaPcWR8mt3aDsfSg-1; Thu, 17 Mar 2022 15:03:18 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4214.eurprd04.prod.outlook.com (2603:10a6:209:41::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 14:03:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 14:03:16 +0000
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
X-Inumbo-ID: 00315bf9-a5fb-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647525799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IidUIM65uQbzncJG4NWU9/gqsTs3GkMdv089SkFiGS4=;
	b=hchEwpgauMfSZNJI4dTYxWGLwDYAA8uB/dNv4Va57bsO1G1HruERfIrvcubHDwW/uxHvTy
	JpY24tEKeSP/0gfGk+9oSU1U/D866hFNjPAXum2jtIcMWTC7LqYeCpmtHIePvpH/i/FZ64
	Uh6q52Oq/FxiuIiYdlpAeRDuAQvmpHs=
X-MC-Unique: 75QynDaaPcWR8mt3aDsfSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcOQm4+9DGNRectS+0fOg9Ig/wvGqqMsqZCylLuir+uoDi4NqtHP7kBF6LObiIDPyykdGn4Tc0onl3XSa2vVUtt2d26yqPN4LP+eCROpSCghvlZEG0oLWvH4AvH4bQNZy+ReiEql7u0xB0UPGFEjxHoCRyy99M2wo5dHVu7sNTRaKdAN/C7S1XSglk5lNf1UknNjmOKqbto8mCl/9DJ3bt0M9glF1X3+Vwz9UVHDha8XQmbYwJ8Jfmq0eUkUxYQ3vZZ343GKm3KDfsr3U2Bv9PfTMUBEA/Nuuo4D4J7UFprQLGV32dFO122MOqSDwIWvsAM9wZV97PCrD54tNaJNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IidUIM65uQbzncJG4NWU9/gqsTs3GkMdv089SkFiGS4=;
 b=bewmQ2B1zh7W58BtRkZyWpB6V5RqCdxm0CCgXpdjVGPdS+KbNJLMTa4idu7Z18nx18sYudyV3deMHFUFDDZxgU8hhqj/eBAi4GuET3L7oaiOrgyBNto+rLeQGSY3gjOkqdMYPfwUVBGcgTi1OedzR5YJzlNoPWCZ8yHAaZNWlHPZXsd4bh/nOuyFdGbNXrsW5BIKTtedHVd8SXRSMkOZ3egXv7mVpCsk5zSnP3DybfucRglM+ho41Yx2082iLt6X0VrDB8Uk69SzW9sZuBaYDfuiz+lSV1Xy3lrCCQ/kE2huyJli4vBxFtiXR/GoHO3QuybyVem7jyraHu13yVcIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <912a5b23-4f9c-b587-ed79-1d577ed6ef6e@suse.com>
Date: Thu, 17 Mar 2022 15:03:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Tian, Kevin" <kevin.tian@intel.com>
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CABfawhmZLyZdSbK0sr4t_WoYx6uYOV2bH89bX4ET0kzeQiY0-A@mail.gmail.com>
 <BN9PR11MB527623CD66F0F606BD0CF5F98C129@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CABfawhnucaqR_RQd_XDKBUP=E_uRG7A6Xbo7dN8qj5wzAjyMZg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnucaqR_RQd_XDKBUP=E_uRG7A6Xbo7dN8qj5wzAjyMZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8918c69c-5923-4718-0a13-08da081ee26c
X-MS-TrafficTypeDiagnostic: AM6PR04MB4214:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4214E974248BBA17A7846D54B3129@AM6PR04MB4214.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7jptoB59lZ7ug9TjBRTiwWQUrVuirLgIkbk0Xil5rgAE2NHtT8R/ChQK8i5Js2GISD4mT+Ywm9L0h+UTJXkkJkUqjXV86dJxEvRljPtUJ4najXa63P1klU0YfcYOZxBJopZ3zcA/HzdtZFJijwInDPHXNnfZlgDmfmI1qBbahqNbfIoTlUpptpI8D0JB9pKUD+rrCPVfYux2Cw/Fmve45zPXGtFXAkpvPI2HVqNMhEgbtWeFUo5gf83+mxD2GyIU3tdno4GiSRWaupTrJGfyvxTOtcdpa+nfUVUXR88E6SQ28dzPRklSPqD/5cWO12YrScnY0HNzGUUlYNq9slQid6jNo7wnPFhhARG9G6t2ygV/UTj+RHa0XsylVgp1A/aKoqTiKUzvGrzg2zhWDIQqrwQNdmc1FeQSjngZ2+BcffbTcOZ01U/92OQHp7q9WZFYyh/74K3g1FnrayGCpg2EWkMu5/UpefPUX+8pFtZ9C0slFHJSazoxbCeNOYTGoLCLkGKm7jm0cygleUEAxiszKO2+VWzmjhFpAUlZlSpA+CpPCBGQGFHEmZmvT4cstH7rAhJmYfmvVqVeei3h0JdIQePETNibFPz28bStO9DtYEx5ceu6iUDTd/WjW4X9xpH1+0nKoTzpK05qZMQkWCB+Z/e8NU+ySnV+LYGZXJExm+fP3p2MGpNqNFxzIXg2Tc6ORV+CB15BbtEYyok2o2Sk9Jd/XudPRZS2XykhMSaZz3ro09K6mPaBZalsDZrXubUJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(54906003)(6486002)(31686004)(316002)(6512007)(6506007)(53546011)(36756003)(2616005)(6916009)(66946007)(8676002)(186003)(4326008)(66556008)(26005)(66476007)(31696002)(86362001)(8936002)(38100700002)(2906002)(4744005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU5mOXlwSmFZZW1PSnVSdGpOVlhhNk5rSDlsL0pSZWdZN3RjbWRTSlgvN0ZV?=
 =?utf-8?B?MFN2eUUybUxmT3VBTEtlZjBnN0xudyt2ZXFGL0t1N2w3bmtFUlVZN1RvTVZB?=
 =?utf-8?B?UmxIYmZFK3IwanZDdCttaXVNZGJ1Yzl6ZnI2dGFObjhnTzRjQXQ1STFuVzFY?=
 =?utf-8?B?SDdhRENtT0xtTlNxalhtOXhpVmwrK2xzUTBXeWFaa1lia3JjcG8xOGkwTVJJ?=
 =?utf-8?B?Sk5sRHFUa1NldEo3ek9CMmJhc01GRUcycExDcjNXWDNxV2FBYm5XbGdodHdO?=
 =?utf-8?B?bGRGSHdQMWR0U2s1aUVBNlkyUzdPc2lpQk9NZkc0MW51bFlZRlM5cHlEakx5?=
 =?utf-8?B?NmNIZ3lLUUIyYU5xUDVmdFFwaTJHQ2tIZjJldGZIZzFxOTN4cklzaDA4N2NP?=
 =?utf-8?B?UHVEWlJZckZIVzNKV0JSYU9qTkVyTDRYZlZib3podHEwWXliSzg3alk3WWgz?=
 =?utf-8?B?ZG8zSldPUkRZSUFHNTFXNVFJTzlYSXh2N2dVRGwvWjh3TzU1S1p0UVFxY0FZ?=
 =?utf-8?B?bENLbTJmemF0bXJNTzZBYXBLL1FDN0drV0UxUi93UEw1VW5tbnVZeWU0NS9p?=
 =?utf-8?B?aTNya3ZqZTU0bEV5S1d2Zmp1cHNNVDQ0UVRDYlgyVjZKc1N2TVRYQXdHbGtp?=
 =?utf-8?B?NmkrWERkUUNPOE1qbUtmeE13UHNNZWM5NTFFbVZaWXpvS20vUnUrRU51TW56?=
 =?utf-8?B?S0ZseUpQR0NQMXhBSjhhUzlSeFNLcjRTZ2htbGVtWVNKb0lOeXB4MlRuSVpO?=
 =?utf-8?B?QW9ubXJFUXJORWxCRUp4bDN3ZHVydHZZTFlrZnJQU0VPcHZyMElGMUZXR0pU?=
 =?utf-8?B?angwbzQvdnh2QWNZZHVLOGpGMkZWVGRpOVFUWFFoS0FsUEVuenFpSWVGcDRj?=
 =?utf-8?B?NjdTbXJRUmhjaHU0TEFPZjIrZGxUUGZYWlV1cE4zL3FoNCszVHdRSG1NcmN2?=
 =?utf-8?B?R1VRMmRzeGpBMG1KU2x0U3gwb3JQTUd3eG9UU3hiNXNML3ZVSUxua2NST2Ns?=
 =?utf-8?B?UzNPZk1hdHBJZElqL3czM0Q1SHRJL3RnKzE5Z0orQnF2QTZJR3lTZnRTeU1Q?=
 =?utf-8?B?Y2wrOEluMnkySXFtU3dyd1ppZDgwa211QnE0VjZ0ZSs2ZG9JSjVMWmtGR1hJ?=
 =?utf-8?B?VlVXaHEvQktHOTZnaWJvcWNITTFWKzVkSGxFd2M4Z3psUzVzREFmTnMzZ204?=
 =?utf-8?B?VFhUWXpVc0tOc1E0VnROK1B2VjRMODFUQUt2RDhTZG0wYjdLSHZmemNwMFE2?=
 =?utf-8?B?NDZMTW9VNHA3VU1ndFZEdWNVaGxMSWpac292cUhDZ1dNSHBIZ0RDdW9qZGpP?=
 =?utf-8?B?cWZWa0loM1I3ck14RDhCN1laUEV0ZWpuUVRodjY5MnVTQ1AxT3NZZzNtZGRV?=
 =?utf-8?B?c1hlVHFrSURzR0llczZxSHJOU3RpbEdLSU95TW83eE00UHo5TVpnZWM5Tk1L?=
 =?utf-8?B?ZmJsVHZaN0c3SDNyK0xheXNlNUJ4RXRwZ3RBd0M3bE01N2ZESGhLcnFVa0t5?=
 =?utf-8?B?ME9uK0JzcStpNWhWWmRTVHB3VklPZ2F6Nld2QURVUUY0QkNEZ0FhQlZkNXJy?=
 =?utf-8?B?d3p1NWFkb1BrVmNpVnk1d0J4dUNvL3pHc0RGeWdiMVJiV1RUMWhaZVJQbVpj?=
 =?utf-8?B?aGEzTDVpRm55UHpkNytDbFI5NnBmMFlIS3ZKa0ZHN0J0L3JMd3hoVmtiV3k5?=
 =?utf-8?B?eHVlRFA1Mm9iajBRQTRVaFMwY3pnckZhWHhqRjZ0UkNDWnZJeGJidEJHQ1dz?=
 =?utf-8?B?bzdrbHB5Q0xsQ0ZLdjhMcWZLZmh5Q1RaQ1dXRTNVcGZlNXhCSDBIcWowbFFy?=
 =?utf-8?B?S2pDYnJnRG9vL1YxZEdSTmNDd3lHdmdhK3I1TGxtcTc5aW12RzIzV0dOWUcr?=
 =?utf-8?B?elYvUkoyTXJlSzE0aDFqb0FjRURsaTBqcFB2TTZ3bGZGcDV3TXBRcDJwNnVR?=
 =?utf-8?Q?c9YzjiXxDjMW1LucE5siNfAnkZznnD00?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8918c69c-5923-4718-0a13-08da081ee26c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:03:16.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzhwYmYIGIGHbhdwSANVpBMKAtBWoG95c05aUa2AS8G5xp9qhhfPGKTq3Z8YyzHHLnZzq6ukVW4ZLLT8aX6R1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4214

On 17.03.2022 12:06, Tamas K Lengyel wrote:
> Another question I would be interested to hear from the maintainers is in
> regards to the hvm context compat macros. Right now they differentiate
> between hvm hw cpu struct versions based on size. So since this patch
> doesn't change the size how is that supposed to work? Or if there are more
> then two versions of the struct? The compat version never changes?

struct hvm_hw_cpu_compat is indeed not meant to ever change. It needed
introducing because the msr_tsc_aux field was added in the middle of
the struct, instead of at the end. Going forward, as was done with the
"flags" field already, additions should only be at the end. Exceptions
are when padding fields are assigned a purpose (like you do), which is
why they need checking that they're zero when they're introduced.

Jan


