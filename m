Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149F300A4B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 18:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73013.131640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30bx-0002BE-J8; Fri, 22 Jan 2021 17:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73013.131640; Fri, 22 Jan 2021 17:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30bx-0002Ap-Fg; Fri, 22 Jan 2021 17:52:41 +0000
Received: by outflank-mailman (input) for mailman id 73013;
 Fri, 22 Jan 2021 17:52:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l30bv-0002Ak-Bd
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:52:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c55ac7d-5112-47c5-9894-5a7cbaf468c1;
 Fri, 22 Jan 2021 17:52:37 +0000 (UTC)
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
X-Inumbo-ID: 8c55ac7d-5112-47c5-9894-5a7cbaf468c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611337957;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7v6p6OwMLg0GLkq6eW+z57Eo8aS+6f2yHXsoOo6z5AM=;
  b=OPObfBAhF6Rb47srI9rZu+/1NkxQwmpHBZKLxLpUrWnvsBNu1mYB6mo8
   o4RJa96cSdJi+flmH5q8EkX5KsQQWOrok+LUR02HOUygOuSTrfVKjy2DH
   puH5ocsw7M4YSxhYtvcf3aJbVqYhu1JKHenyVHBBDBIcrtZjv3AKBHjVZ
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E4hhS+96RApxZ4wWnD8uWfZTUhLh4h5rEUP0ihkmd2az25RqOuMCBpkMjcQjPAld2Qw2zlH/3A
 U87aJDYImgIi0rRp+7cE/asjVuikUB3wwL8uSXncgNgr499+ub4dcEGlE79Hf5Y0I+JnAcArVT
 ECApK84mDlX13WmrCgB8S06P5PmNvOIl+ewJmBWAvbAL0PVZG1HghMOVWqzKs2Az9rfla6oTmk
 OaH8TJEIGxp5/Ufq64kOBP4TAO99UTWhbL8nGk+5PQnhM30fHuF3WkzNdAy1qPlIlPed6a4Gsw
 ZqM=
X-SBRS: 5.2
X-MesageID: 36052607
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,367,1602561600"; 
   d="scan'208";a="36052607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzO9A6D1i55ow5cZfQt8P6Kt9fx4Sfw6IF98EcP6hrU/nmir+bCp2qKSiVUwmWjVM+m1eZS9zsQVIEaNuIxsM1xG3x6ty0GICS3wH1EvaJkOlAgYe/iyrAU7tWpLl2WbhMj4vj6A1I4z5+ufnmlPRIN3uv3iDlFMCra5/XiPBBeqpSNoc5EzK4SDpCXgm5uFYR/gzgcmtYaX6lENnKqatWbcSOni8OYKZfxegGofJGEz45yKzDVuhfJR6iizwjshBQlQSOXGknLLRS00ccFdPJiQzF47O8l77bZfHM1FpZBKUdE3XQnCOWVLdGYejA/GKULjPPWFs9o8mFPrWJJRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1YnNv5VUjgyk+xcFOiaiKl9nT+MIFC/Fm3rP2ZzHZI=;
 b=GckoEE18qEwmxUCVDXdyd2mC2Mn99GuKkDNXY3At6MV+6m8Xd2PI3c/C4vRArdFB0aqPjK4oDahlw3CSy6+t12n7ox9U/hgDEJH0HZrcfYKDY2/jMMX+oNaiwhuB9yMONfnrmiCWoobKwJsPGpw7B12P75+cZaVt6OP3xeV/FhX/U0j3fWknAc8lpzSaBvFGKOlojb9jn8OzJHFF9eySuUs8fTR4XN94IEWhZv7smOlV97SWKZ+HZCdaV61CVq7svTZxRvLF90gdl76Kro4ouUT+lr0z+zabZER7biEvn4f0A3gJS08l2FimPNltX05gifsMULhqyCI2z1mijz3wCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1YnNv5VUjgyk+xcFOiaiKl9nT+MIFC/Fm3rP2ZzHZI=;
 b=be66fqgeLGAoMu/rPfaiHHCGn07q7OnA6ZGU8fDmtHnAKoEmKWMPXn9kiUshr/jNgfCF4D4vddtDBJEwzOENoJWObbwtx09nT0H91O7tIXEd0iEGYA6mL9oLQ3q21ih6MXVK/8MEwxElJx3w6Cfu7mL4JsXIOngSf+QwpADwceQ=
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored [and 2 more
 messages]
To: Ian Jackson <iwj@xenproject.org>, Edwin Torok <edvin.torok@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?= =?UTF-8?B?w58=?=
	<jgross@suse.com>, Wei Liu <wl@xen.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
 <20210122155603.23402-7-iwj@xenproject.org>
 <8b231075e5ed13412f98881c3b3454d9abf9e871.camel@citrix.com>
 <81f92e66-3a43-dea8-f633-2fcf725c10dc@citrix.com>
 <0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
 <24586.64456.905401.474099@mariner.uk.xensource.com>
 <a436baeb-888e-a213-2a68-6817309a6b2a@citrix.com>
 <24587.3400.673049.196349@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <98d9c63f-030b-6de8-0d29-37d950b0a595@citrix.com>
Date: Fri, 22 Jan 2021 17:52:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <24587.3400.673049.196349@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0191.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d22d641-7e4d-4a3a-0263-08d8befe8009
X-MS-TrafficTypeDiagnostic: BY5PR03MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50628CE14FD4170C666C6D71BAA09@BY5PR03MB5062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IATKUGXtg5bfvhgeLNsh8OfJzmTwUQkQQwAbZB+ZBx8kzdjoqS9djmP7ps83GRAP31rbgKBmZtc4QToEbuQflqzWeER3WWO6OptzIG1uEmwup7Tf7looInyjZbwrWQCz6VpBjesOQTVnA2ygcz3ddSX3rQAB02F/gP9nqHLcELnLD9mPWss4yhva8XbbCyska57jzfQ2b3J3VfO8z+atHI/wC3qjOFNeTWMX3F7xo2KOCcKbe5cryEIWH1yAZrPJNlbeZs+yNi8i0goV3jdG1Ya3fqS6y6OGo6xGuw/zxFGCxg1jMeab6Gy+cer5oIyJRbaCfod7mdV15Ccv4+i0VsFXdPrrVl+0to5l370NXaZWkhEAxnWe/sz4APDjJhcrBKPU3/85HtbdDT6di93Si8SvP/lhWeTbjTqWneUrIexDL4Y4wknWxa/A2+2mBRmhELYvzNcTspSoK1p8wMExdjg4V4yeq51WVeTZk52SRDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(6636002)(4326008)(6666004)(83380400001)(478600001)(31696002)(66946007)(66556008)(66476007)(31686004)(86362001)(2616005)(5660300002)(36756003)(956004)(2906002)(53546011)(16576012)(110136005)(6486002)(54906003)(186003)(8936002)(16526019)(316002)(8676002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUhmNGgzSUtBQW1CNks4TU1OUkFEQVAwMUhxclZRemNZbU1NS1dlalJwL1Er?=
 =?utf-8?B?cXpJNVBNYWlzMTYzeE8vRDR3Rm4rR3FjWk11RU9HSERIRUdWR0hKVFFqRHlP?=
 =?utf-8?B?Y1VFZkRqUWJmWVdDTlpFWndsYXdDekJudEVwcDI5enNlK1VkdzdwSEhaU0ND?=
 =?utf-8?B?akMrUUlXS2pDcUlqWTNLdHZOWHBjdmQ1RDI0L1RCU0JhVFpzUm1KckpPQzhJ?=
 =?utf-8?B?dHU2Y2ZOR1M2ZHQxQWhaNGltd0xPYmpFZ0NuTnJ5czZtS010ZmtyZlpDSlFm?=
 =?utf-8?B?a2RWTElZdDh6MDgrUVpOSGxPZ0FIQWlidmt1R3NMcEViT2VEM3MvZTk3K1Er?=
 =?utf-8?B?NTJJaXJmbGFJWjF0eWxXS3lGT3NSRjBZdnlxUW8rRWtCaERBYytmcXlLQXFk?=
 =?utf-8?B?Yk1LUnQyV1FoQWFOV0VnbmMydi9oMVVtazZoVERtbUMwTDFJaEw0ZUxmYW9T?=
 =?utf-8?B?d3htWU5HbGpwem5nR3M5OGZkaDFrcWVjMUhEZVFBNlpmamV4QmFOdmk0b2ZV?=
 =?utf-8?B?T25PVU1jTndLTk9ZWm1rT1JWandIclVubFRyckJ5SUZUYmxDRDM1eExWczdy?=
 =?utf-8?B?Ry9nSnBMSjh2UGsvNGlGUytHM0lXZTZqMXk1ai83ZW0zeUtOaFZGTythNjJj?=
 =?utf-8?B?UmNudE5QSklPczlnOE1OVXB0NWZ1VkxwYXFubCtOVlRGcm54RS9jOXlyTXRT?=
 =?utf-8?B?WUxBRjNYL0lueTZjY1IyY1p4eU9kMElUTGNESFlBRkdlSTZneWFvdmdDSFRM?=
 =?utf-8?B?UU1iQkptdm82ZnNhNGVsNVpKWE5neW5nV2YxU0ZjaFA2emZUZmhNVVFtSXBC?=
 =?utf-8?B?a2JiNHV3Nkw3Q0Q3YWxaSDFJQlNnWkgwK1oyQXA5NDNBNXg2MXFueDR0TkRU?=
 =?utf-8?B?TGNFZWlaYVlWNm1wd2Y0cXVIV01CVCt6dGsreUo2STROVEJ6dXhBTllIczds?=
 =?utf-8?B?cXZUb1lWK3ZqVGM4WHFGbmVXeXNhVDBrOEpaTGdFOU5wRWpZc0J0M29heFlX?=
 =?utf-8?B?amNWTVJPTVBNemU1RmQzd0FJS3BRZFlnd2tYVytHZUpmZFNsWWZ4NURTWXBm?=
 =?utf-8?B?V3FwdThHNE8zUTY3ckRsU2swcEc1ZHByOENLVUw4Q0YrK3R1Q0V3Smk0V0sx?=
 =?utf-8?B?L3pPUWJlVUljUWl5Y3cyZXZpT003b0hGMCtwb1dBWDFMblh3dldMS1lsN2dM?=
 =?utf-8?B?UGVOU2l1VXdSRnJ4M0RwWGg1T1ZqTE14SmFVT2tMc1U3b1k3dHJ3MHlxTVZh?=
 =?utf-8?B?OE1QVWdxN1FMZmU3aG13c0FqOU9BQytMZTBTVXovWDBXUGNVWklTeTMya2Zr?=
 =?utf-8?Q?xBXElWqS8AT5EKFJVEq529OEkwDwGKrAk2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d22d641-7e4d-4a3a-0263-08d8befe8009
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 17:52:35.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVW8MS7asmAqvs4S5Oz3CiktB0a044WatAw4rxhJ5yBMGAfz4uuipJJ9dVL+6HxHbLGBI0/PjKX05HWHEJ33nAE+M/k+/xq0HS1DpaMlElc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5062
X-OriginatorOrg: citrix.com

On 22/01/2021 17:37, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
>> Or does OSSTest have an explicit "is xenstored running" check after
>> boot, before any further testing occurs?
> No.
>
> If this turns out to ever happen we can improve the pre-checking.  In
> general I let the chips fall where they may, for test failures, and
> improve the checking/logging later.  Otherwise adding new tests
> becomes very time-consuming (and there is also the risk that added
> checks do not align with actual behvaiour).

I'm not objecting to this going in as-is, but I want to at least ensure
we're not heading in blind.

In practice, a lot of what I'm trying to achieve with some of the
extended commentary on the autotests thread is better pre-checking of
this kind of form, although admittedly at a rather lower level than "is
xenstored running".

>
> Now that it's builing, I think it's fairly unlikely that we will
> accidentally stop building one of the xenstoreds.

Well - I ask specifically because there is a thread on xen-devel about
upping the minimum supported version of Ocaml, in order to simplify a
couple of aspects.

This would manifest as oxenstored no longer building on older distros. 
(I've got no idea if the specific suggestion would impact OSSTest this
time.)

For now - lets just fix our testing gap.

~Andrew

