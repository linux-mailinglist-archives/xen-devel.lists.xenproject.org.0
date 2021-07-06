Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00A3BC6EC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150778.278747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f31-0006Dq-6B; Tue, 06 Jul 2021 06:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150778.278747; Tue, 06 Jul 2021 06:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0f31-0006BE-2t; Tue, 06 Jul 2021 06:59:11 +0000
Received: by outflank-mailman (input) for mailman id 150778;
 Tue, 06 Jul 2021 06:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0f2y-0006B1-Vm
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:59:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b4efadb-ecdb-4082-ac68-70d5bc32b68b;
 Tue, 06 Jul 2021 06:59:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-noFJCHZbPB2xmb2elYlJoQ-2; Tue, 06 Jul 2021 08:59:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 6 Jul
 2021 06:59:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:59:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0080.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 06:58:59 +0000
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
X-Inumbo-ID: 9b4efadb-ecdb-4082-ac68-70d5bc32b68b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625554747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLXTQjO7Tf97umbRk4vNIydaS6aSK8qS6UAOWogW5T4=;
	b=H7sHeC2H5bxruOfWxQefR+y+/5QSCZQQbBSJ3jwPrtDS6U4zBk4EoJUsoZrFirjrPXu4WT
	4R2Jcedyzm56vlGkekrTe1wIaA4KeLDj45KGLaI6i7OkgbN3y83BGd8ec1tyAqnBFrvvB7
	BoMfw+yVfz9tgN/Q45DluG9UVDZm8K0=
X-MC-Unique: noFJCHZbPB2xmb2elYlJoQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGAehSPspoVHBKbkF3+dCtFMvukK3HyLvTPznbbTy9caoZzYde4KW+ZbPdLy19to93QGau/w6upka2L/RcBEWHMr+VRKkmioxhfRt5bdpXEyavM9r+S1w6yMyY7nOTgu/zAtsH1AxPDOr+2HAGo1Z/HTX9JaLck1wtAyn1rjFtXifzQPZnkzda2sNRHuThVrwj1w5eZPBt2tVZo61z0Cek7q5BB4mP0Lnc9QXjzTST5YcepvF/XF3TPScO5Ws6Zk6Y/hxZ2B8htejQc/QhKM5OXpQ3XlSiORUSdU4ksRRTyXZnWF8dfeiaqymhP27d+CXjhyHn9H9+dvjy6FSNt+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLXTQjO7Tf97umbRk4vNIydaS6aSK8qS6UAOWogW5T4=;
 b=F7x/BostAGyv/9ThBKkeIN6X4kouwheFbeau6tSiyjn4nvKUWzGOjUX0S/LL77Rm9y+hfTBBh4RxhwFVBHOTLowqKfFadpwbo7hkDYtM4tepypax9B4f8OrZ1fcqqkifd/bkuFxQh5Sbsuq5jigk3WFcJhOJgELB0/sAnUzheoR/ZS+80eLecpfqMtNYTaNPNevUYCEHHjYc79tqIXJHe76vsEjYPj1mAH8SkoQy/qRHZt21Wnq3dGQHwsylO7WMh8ipF3ac1v428foBljwIOECJTacUk8moJyA9qI8pP8oZSEX51DInywOveo2NPnH+8Pr+IjxGMmz2/GFarJY1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
To: Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
 <20210705192612.5cf50887.olaf@aepfle.de>
 <f70be58d-99f0-0631-2b01-436e3e94e5ee@suse.com>
 <20210706084628.360a7f2a.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4463e5c-48f8-8d46-e959-22c9e3710637@suse.com>
Date: Tue, 6 Jul 2021 08:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706084628.360a7f2a.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0080.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 668a642c-ad40-492a-6e03-08d9404b8889
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54698DD4F305DDF5D2D61F05B31B9@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ivj4OQRYRXrNRW828IR7XxMKs3omzBSh2SC5DhdFOr2qS+4SgGn1WWMwQqlZFfeInTI0mgjOk52jy9Iq1c1euLTOK/i+JAYjmNufkRZ4+B9/rc4fuxdOJrcZXh/DqDs1nl0m/hBdCkYuVo1OMqT0n15iUg3DiI4SBtGXpLgnVGVCLFegxUSZ2NR3ZedBE+x63XcuvXYqjPqLOPt03rj9r9MCjcYf8+JEOa3GDNpH0mGYFqG88Z2TwakyWReiZ61QM5zHw59vhejxZrRNlcKFtrHZML4ila56EWpI3QoAgCXgUhrE0Iv3C9WwBQ0aq/0rparC7iKzENHlXvq1NwxF4QbI94hNqR57lIZMw4+EOEddRprk4oy6ZzfIplBY4dWgRQhBPCVxXlLV/dCdbw5MHwVni3lYa5WJ4GM/JYPvmzt0RkUbA+ukVsPJwICIT7gcZfCcvRMvtZSiSvn5UoohpiHqJe50g34JMKAukYpOdHZlZmnv2Ezdmzgia4vhpJCQKCnJyI5sYFeqSrZ6ONzMMvOcvOs6xwiTl0ovyjcCJRNb28Fd40pd8WmK55UWqpdz3xst+Nu3VAetEHoQ5z+s9rRTBBTkPRy2BaoSsAf/RJF2EMGEqxpI27FOuTlHA6SwhnZg/geGvK60gtiSfEG/HVVBYGJteVtTz32PJaagz7E7GbK4iiDU88MdRQAuxtYTazBT2dyMwqe7/JpI91hAybSTRSv/BD9ml2pV6lJTtHLOyBveeVhy1TCpsjXSPfd/yB2TbhPJbl5VuXAy4r/3Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39850400004)(376002)(346002)(6486002)(316002)(186003)(83380400001)(16526019)(36756003)(2616005)(4744005)(2906002)(66946007)(86362001)(26005)(6916009)(66476007)(53546011)(956004)(5660300002)(66556008)(31696002)(478600001)(8676002)(38100700002)(31686004)(4326008)(54906003)(16576012)(8936002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJFZ2xRcmhSdU9QZUJMRWQzQ0g5NzI0OEtqNzV3L2J5bU9ud0h1cWdmQU1t?=
 =?utf-8?B?eDJBOXgvd1Y0QUJkNmcyNFdrYjJxdUlzMFNEcUUwY0R2eUhpS0xldzM4L2dV?=
 =?utf-8?B?MUs2OVFjN1UrWDFSNjIvTmMxZlFuRmdXTnh2d05nMFJyNGY4ZlVjYnd3U0xT?=
 =?utf-8?B?SlY1S0p0dGdYOURIYUlHR1Y4L0w1TzgwczR1ejdub1VZWEZzOUJHNTBLd1B6?=
 =?utf-8?B?MExNbWZWYXo5SjBLcSswRzFUTzl4TlZOc1RtZmNTSE1xbXlmMWR4d1dxWXhr?=
 =?utf-8?B?R2VzdW5oeWVQTDVDdG5hV2I5U3JoR1IrTWw4SHdkVU5FNmRoczNZbHZUNDQ5?=
 =?utf-8?B?MHBVbDZDWHlPaHRaV1JCVVJYM0tRT1k1VXRZcmZ5ckRxcm9PdTlLTFd3ZjhE?=
 =?utf-8?B?QnBVTnZ5Nm91akRibWNKSDVJL2VDTmZvcVZBMHVWM2t4OVlORVFFcnVlOFUr?=
 =?utf-8?B?VVNoVEFwdXNITXFyNS9BeDRVOUUwWE9rNGtmek0wZUNkY0V3b1gyNmdJbkdp?=
 =?utf-8?B?dnZZTkVPVjRobFNOYjBWWGtUT3FYblltUk1VeEJmS1lIN1ZwL1ZYWEVzc2J5?=
 =?utf-8?B?NEc1WWwzRS9hcjlVK3pqQm0rcUtNbGdwbWV1Rmd4ODUvRG1kQk1scUw4YlUw?=
 =?utf-8?B?WW9waDBmd0g0U0gvRVlZZDJsejZUenRISE54VS9hZExrOVFxanRkWHN6ZGRG?=
 =?utf-8?B?dzJjSG81UHlXaVBKWXYxTjNpbmkyUnAzSzdYdkU5L1NlTkFlVmt6QUhXMmRn?=
 =?utf-8?B?Z3U2RFpkVGVLU2FUazhFSHJJVW5rdTdZeDhiTUNWS0xJbFd2b0ZqeGsyakd1?=
 =?utf-8?B?Y2dOMmk0MGpSc0F4b0lsVVdjbkZMYTJpWUk2ZGZCQU1RQnozR1gyVWFDcVM5?=
 =?utf-8?B?UDhibEtUZVVJU2cvQm1ZejE2bHNVVGhpRFNzbU9FVlhVR2xjRGdzYmg4VVpF?=
 =?utf-8?B?Tm9wcGhJUmtKZVlNci91U3lyeUdCbGNUMmtRWjI4cWt6cFByZHRaTkFOcmor?=
 =?utf-8?B?dExWeUJxS0lOT2tlNzlvc2VIaGt0cXdXRHI2YzZhcFBzTk44cnhYOHZmSXJB?=
 =?utf-8?B?RGpicWpuSjRFZFFxck1udmFTTFIwaGpqSzRNMW9meGowYzBkcjRKV1JXdHNr?=
 =?utf-8?B?REFUZTkwd011Q25XOXFkRlpPTisvRVcraGg4bHRkUWNsVkhTRStHZG0rUGhV?=
 =?utf-8?B?QXpHUnhFSTN6MTJyUkI0QnNkamVBTHZwN1NCUldaN05ZRUZsOW9IWVhzWVZi?=
 =?utf-8?B?QVh6RlFJNFlOcUdvNjhGSUQwM3c2MFZiYytKKzIxUFVQY2lUVHlFQWhReHNp?=
 =?utf-8?B?WS8zL2RNbXRKZkk3N0RtbEY4MGtNaEsyWGNuK0N2YzhMRk5lanpkTHdESVVz?=
 =?utf-8?B?NlV3VVZMSEhZemhvTm5JTFN2TEtEb0krMU5IN1ZUdGVlKzFJNE5rVXNlUzZ1?=
 =?utf-8?B?QzA3S3ZWRnF0Y2ZoUzk1S3IwY2JrVGlBT0tPaWo2OE5Jc1kxejZ4dHNMMCsw?=
 =?utf-8?B?ZTg2ZlByQWV1SkRMNVdmbUl4cTIrZHFzYlpQM3lzVjZlcGgyTmRoNW00dk52?=
 =?utf-8?B?M0NVd2kyaEs0MllXYWU2WG5BenlaSG1iNWVubS9SUXhId1Jucis2dFQ5ODV3?=
 =?utf-8?B?NTFWeTZQL2M5ZUdOdkhzUld2QXlsRkdyRmYxa205ak1qWVNFN0gxM1RyVm1i?=
 =?utf-8?B?VmZLTDlsVkdGb0lyQklEdFJQbDFhUHU1UFUrSWpjajBEZ0RQRzNpWUpFWFI5?=
 =?utf-8?Q?U/LL2Gf5c3ZaKY8qlKXqvCER+IxRaPtEl4V66uz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668a642c-ad40-492a-6e03-08d9404b8889
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:59:00.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiylMZwwtNgYb2D2LFLoPq0bts6cQHfroXGOFQS4nUfx+rzDQCHdVRDIoDwj37fgdP8/Uqex+HXvMxN3quxpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 06.07.2021 08:46, Olaf Hering wrote:
> Am Tue, 6 Jul 2021 08:39:21 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> the size may change in the course of migration
> 
> How can the p2m_size change? This upper limit is queried once, then
> all loops take this as loop counter.

Well, that's part of the current limitation. The size would need re-querying
before every iteration (or at the very least before the last one, after the
domain has been paused).

Jan


