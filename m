Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96646A1DD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239411.414943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHLU-0005ER-Eg; Mon, 06 Dec 2021 17:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239411.414943; Mon, 06 Dec 2021 17:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHLU-0005Ce-B4; Mon, 06 Dec 2021 17:00:08 +0000
Received: by outflank-mailman (input) for mailman id 239411;
 Mon, 06 Dec 2021 17:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muHLT-0005CY-8S
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:00:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6309c0d-56b5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:00:06 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-7HpNBHdIPs-NjBLYRWiIww-1; Mon, 06 Dec 2021 18:00:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 17:00:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 17:00:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0106.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20 via Frontend Transport; Mon, 6 Dec 2021 17:00:02 +0000
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
X-Inumbo-ID: f6309c0d-56b5-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638810006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ro03WXeRgue+HJrGelJsql20dtKmvllsT2bxUS+wI1M=;
	b=cTJL7IdATZRbLsd1xZ5biCsrCsaTPlkkf/DHEb6iox/W5Iz08fzn4HOFrrDSqfPTxjg2oB
	BLMouY+3Hbv2TTrCFi+Ri6bjivdF8wI75lsrVsyZeZgMV1flQYJ0rKKRAYUBuRqx0z14Qb
	NM7+BNXko+NldbZTzQzFqLeyoiwKvF0=
X-MC-Unique: 7HpNBHdIPs-NjBLYRWiIww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeJJ+BWQRZE+sjP94ElvuX1fcURn9lFUigDgurBHURTZrOGW2z+6VTDkhZT9m/9HnHSAHWhcqBCCem9KYreDDe/wDbBbjfCXhPWqmi6W1oe8rMpLcQDYl0c0sMofxGlcNVudG1dct0VCiTP3PwUE+g5eQ9x4VdF3brNYEM+u2t08sYu7akkMGk74KBiapNBcQAXlCXY+2ORThHHwiJcxvTm/bufyoYpL3Wg84FsBbAvKGEXztKT1mXV+YL30FotdcEeFiO/5ddIz7d+pWhrvyZlD/S6DXTHZ7uIV4SVZbke97CL59NFO3OtSDpTTe/+A7pXLHFBrtUo56iust447SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro03WXeRgue+HJrGelJsql20dtKmvllsT2bxUS+wI1M=;
 b=Isge1wsacaziFZFqG7Pd4787XJps58ec+V334Sbejd/IWv4TVzpvKuOu829jQMxlXiSlheGzsfR41tTAdLuUT+Wwz9qAvdASVf3R0udNYjS/RrK/g9OOzuvcLidzfNKwYSkrFtt/RgbXPuaBYiy2IQidqB9Qyo/MjdullflSHGVhJ7tdFJdAn4ktoLP76vITi6HsY2cpMRTAemA4JND814Xi6N8Xa8vfECnC6obkTULcQirjHY86UXDFw944XjLwBd48bG+kDgYKiLx5yxn2trimEasRTFkOiDW29qSL9133jWzg6Ewx/5u6aTsyGuvESTuYXZjucYDNKaQZczxdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc884bbf-a16f-2fad-9a3d-b1b95fb0a7b6@suse.com>
Date: Mon, 6 Dec 2021 18:00:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 09/47] build: rework test/livepatch/Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-10-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0106.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67eb10b6-0f35-423f-f6b6-08d9b8d9d8de
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776D0E9665AE357D5FC3177B36D9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+T/0FTeosV8oPHsb3z9ITEcHUnPBedX7lKdmYWcGwdbVMMTokMljFtuN6h+FChNSd/bFnnktW8JUxYc958hsV2tgzaq0RFu1yxjjFArbMLcPRaLbDAisk0/LN1dOGQ3j6hlehX5ECmSpL6mtIMxa9dO3uJ6TFuQbGWju+nhvq6j7YNBf1SbRqFAWZaElVYBPVHXH22dnUfV3WlWSr8j5PkyeyWnOdrEOIbJl0iyX2aQjyUvHK2cA4v0wHoj0GEzTNHkwXhLTahNIU5hW6DiCQ8XjfHAqDI7WZokxSIJ48RdkKByiFqbR+mxbCRi/c8ZmP8qCcZcN9jVFsbX89UlSbP127nxLgQoyvKWdxnUZs8Vig1a0tNiYZ9m6OAE8fmU97umxJVc4/vmHDpm1zp6QHT2ydR+BehOIMFwsWFDpLEdDnjQriWMDA0/zGHQ8ACPsSvUArmnz76OFC8hCdJObuvlIGAPdR/JyBL3Wnk/GFegZPVPxbdQVVavnEdtPzLfrSo7f2+B2gFhyj5hLy3U9p6jw8VKB+3Qj8Oq8cHPxVlfhaAd3eXMwyHdALDb1iQMzY4JFDqycdrkMN2i8sR0d/TxzhXw0Y9MrVrO/OKhnE0sIyngB4zzP7ywV96+6iXXBJIh4SYEYE49Pp9D99au7bkEcZQHgJrQjJrXdbpTnJnW6aDPj9o2Fjx3s064PKaDzOLfnsbp0eMC3lof0881NlbUJ8LhPKpGnD7NE5w+INE+3DnE4j21MzHu6ZPmx3WRt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(16576012)(508600001)(316002)(31686004)(186003)(8676002)(66556008)(66476007)(6486002)(36756003)(8936002)(83380400001)(66946007)(31696002)(6916009)(956004)(2616005)(54906003)(86362001)(2906002)(53546011)(38100700002)(7416002)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1V4ZzdlYVFIVVhlTFc0aWVad3pYNEpjeTdkbjBYY3Nna3RxMDVJM2d5by82?=
 =?utf-8?B?RWxOTXI3QnN6dzJuQXJ1YVdDWld5TVgzMTkvWG1qakZ4aDVRelRhS1hrektX?=
 =?utf-8?B?TGpTTCtldXhady8vbmVRNGNwTUp2ZGZHUkt3US9qaHRMSFozYnpkUlpQUDJz?=
 =?utf-8?B?REpQK1ZXdXloejhMTDZ0YkE5U2h0NEVBaXNCcXoyR0owRnpQdlNUbzgvQ0dx?=
 =?utf-8?B?UVFhRXVrajYrRGZPR1VycjJMeXBWd3FyMWN4dFV2RGgrZ2lrMVpBY2c2K05h?=
 =?utf-8?B?MTBSdlhkNUtSKzJQMWluQ2l6eU1WWUk1aUpCZm8zWURhc0ZLZEhSRW9lcXJo?=
 =?utf-8?B?T1R6alBwOVJMV3doN2tJSS9CbFQyKytzTU5uRm1McUpyVWRoVTRMeURhTHBO?=
 =?utf-8?B?Um0rR2JaeDUwdmZKbFJEOEJENzlVU2RVNDFNMlk5cGx4ZVpaWnBEZGxCb0FT?=
 =?utf-8?B?aTluQW5GSnpsT2VDNzZLTVk2dXZUd3lFQlhhTUZhN0VhTzdEK3dnRWJXSitu?=
 =?utf-8?B?Vzd0My85cDlzN1BjZHFvUnhVSndTcWZnREV5Wk1QZHpaaXFGQWpCSzN5VnlB?=
 =?utf-8?B?b2ZxeEFCb2F1K2gvMlB3Zis2aU16NmxZQy9obUdhNU9FV1ltTDdvTm9WZnRE?=
 =?utf-8?B?NDl3b1djcUhYOW1sK0RDY0pmOG8yeTFuWXRUbHMvR21OdnNnRGx1cTZkVmNQ?=
 =?utf-8?B?eTFGeE9QMCtnVGpGOFBtT2VJSm5tVkFyeHFxQU9nOVcwMVJ2YzF1dGczVUFl?=
 =?utf-8?B?VEFWOWI3MkV5clVOVVM5Qi9FbndKbXQyektaTTErMXdTUXJYamY1NDVWc0k0?=
 =?utf-8?B?YkVBbmxlS25zd2d4SWRsYkl0OHJ4NGQ2SFBNQk01YnR2RDVJdkp3dzlCSEcw?=
 =?utf-8?B?N0d1V0d4TGZHSmVudXpDQi9uemNwck5xQXNFZFpnZW9iWi9lM29lNzhIbEM2?=
 =?utf-8?B?ZXk1b2R3Rjg5NHoxY1lOU2V4U0hHZHEwZzRoYnM2dnRpM0lmVURFMTdPVmxu?=
 =?utf-8?B?aHhuYVAzVnJoZWkrVHZ6NUgvZ2pFTlhBMko5bmdsKzNoMk40L2szUWYzN21M?=
 =?utf-8?B?Y295YUFJOTZ6UlZ0emZpY0pNQlFTc2lLcDR6T0FOMGcwMno1Z3VBWXEvWC81?=
 =?utf-8?B?Nk85SG9IY2dHUGtEOEY1OEVuUlplancrVkV6THRTUTM5eVNWYVEwVWI2bHhR?=
 =?utf-8?B?V3poRG13ajZjekMxUi95Q1g2aUVITWR6VEUycU92dVZyUnd4cFpZVEVwMm5I?=
 =?utf-8?B?aDJlV1owZjJTbEJyT2JJMkNyWWluS1B4ZWlrdWh6R3RvcWFWd25wSmcyQXdM?=
 =?utf-8?B?SFIwQmxsZ0VwZUxMVHVBUzhhNnE5Yzdwckd2Q2l0V2w2MWgvRzFFbmEyT0g2?=
 =?utf-8?B?WmVPTnpQalJGOVNiMEZGbG45UWdXYXdnTzRlNzZKNU5FYW0vM1I0TzJBTW4r?=
 =?utf-8?B?Sk9PbkdNcnVTdE5sc3UrMng1K1BNSTFvYjBvNHVpSzZKdmxFZjlISWlFbXFL?=
 =?utf-8?B?djIrNzRSMCtCNzZKR0QvcmVpKy9TWFZHQWVpQkFpeHEzMFJFVDFGTk14UDhV?=
 =?utf-8?B?SDVPeThPbmdqeTFicjFwY3dvVE5JWjdBWDkwUHI0OTRtSXFvdW5tbVp2dTNn?=
 =?utf-8?B?OVdtak1qSTh2UXpRd3JTQ0docTRuUGVwQ1pBdzNtdHh2NDRIV1B3clhtSzdB?=
 =?utf-8?B?ZHRKV1hsazhTOWN3VDBMb3dhbmJaQnV1NFpWQ2JxVWoyVUhoQyttWld0UHpV?=
 =?utf-8?B?Q04wZ2o2UTVKMDI4eUZmaGpQalJqYXZTTitJUm9LcjE4SHRZUU1sQnR2SEVa?=
 =?utf-8?B?dkZETUJPd2dNLzAxUkNpd3VqZko0dFZHOGNXbkZYNXUwQWlsUnBBZGhxUFdC?=
 =?utf-8?B?S3pmdU5QS0NGOUxlM2NxQmRadm9sd3Q1ZjVZckg2U1N4VWN5WHQxWmVSckpu?=
 =?utf-8?B?T3ZOYWduTWw1aWJXNlJrVGlqOXk2KzgydFc0SFJhblRLMzhnZ0ZuODl0WkNN?=
 =?utf-8?B?SVRDMDlSZjEwYW9mSjlwOTVYOU5ma0xoQ1ZTdnR2SlJIaitYWFdZVG8yS2Vq?=
 =?utf-8?B?MExUM0xjRldOekRXTjgvdWs3Qyt4anJVblNNVko3YU1DN3dNL29xTEtUTTk0?=
 =?utf-8?B?VS9kZXBTb2NEWHZ2dnZueWNrNDBld09lVU5vSm9BMS90VDBmdk1tMDZFZVB3?=
 =?utf-8?Q?n0IwiAwc5vBrLC0lFXyI5YU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67eb10b6-0f35-423f-f6b6-08d9b8d9d8de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 17:00:03.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVYRwIHim1wBjlCfbnrY9aPdxLrfHrSLEBpNu3Ca2Dkic5mXWiCjdtX5s0XqHx3/sME/8HgXccl4EOg/MOiCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 25.11.2021 14:39, Anthony PERARD wrote:
> This rework the livepatch/Makefile to make it less repetitive and make
> use of the facilities. All the targets to be built are now listed in
> $(extra-y) which will allow Rules.mk to build them without the need of
> a local target in a future patch.
> 
> There are some changes/fixes in this patch:
> - when "xen-syms" is used for a target, it is added to the dependency
>   list of the target, which allow to rebuild the target when xen-syms
>   changes. But if "xen-syms" is missing, make simply fails.
> - modinfo.o wasn't removing it's $@.bin file like the other targets,
>   this is now done.
> - The command to build *.livepatch targets as been fixed to use
>   $(XEN_LDFLAGS) rather than just $(LDFLAGS) which is a fallout from
>   2740d96efdd3 ("xen/build: have the root Makefile generates the
>   CFLAGS")
> 
> make will findout the dependencies of the *.livepatch files and thus
> what to built by "looking" at the objects listed in the *-objs
> variables. The actual dependencies is generated by the new
> "multi-depend" macro.
> 
> "$(targets)" needs to be updated with the objects listed in the
> different *-objs variables to allow make to load the .*.cmd dependency
> files.
> 
> This patch copies the macro "multi_depend" from Linux 5.12, and rename
> it to "multi-depend".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v8:
>     - rename multi_depend to multi-depend
>     - use $() for single-letter make variable
>     - re-indent one line
> 
>  xen/scripts/Kbuild.include  |   9 ++
>  xen/test/livepatch/Makefile | 213 ++++++++++++++----------------------
>  2 files changed, 91 insertions(+), 131 deletions(-)

The tiny non-livepatch part
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


