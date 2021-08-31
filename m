Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79813FC7C9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175700.319980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3Pp-0005e6-8d; Tue, 31 Aug 2021 13:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175700.319980; Tue, 31 Aug 2021 13:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3Pp-0005bf-37; Tue, 31 Aug 2021 13:03:01 +0000
Received: by outflank-mailman (input) for mailman id 175700;
 Tue, 31 Aug 2021 13:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL3Po-0005bZ-4o
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:03:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c75f87c5-f6a6-4152-8d4c-193d7b7631ae;
 Tue, 31 Aug 2021 13:02:59 +0000 (UTC)
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
X-Inumbo-ID: c75f87c5-f6a6-4152-8d4c-193d7b7631ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630414978;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9ShPgg7UJdgU1k98y5gKFCsaZjWlXFc+sBPhvZIzyok=;
  b=XRf9I9QtYxnD9YT0MAF+IGvgAcGxdRbeuAcssYWe6TCdeco1a0uaR96R
   qTRPHNAfz25oIDoxbPLDaO77t3DU3esiT7oleev2u1mtX1YwPrG6PdsA3
   n/CxIIE45v0zOx9ICxM+OxxiYBLXDVjhvuwdq25L248uxRR8mM+13ZI7s
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ypViPJkEV8AWID0kPNAw1xV91BFgasGQA4yJ/mZh1mmpIwpsNbsOZ5cjtOs/z+B7jXADhi3ov7
 Z59yxkyEbr/wIo+u4GsXedCDxrY8RFrcoxmpnUcEUOhHAMGHhZ2kRZAnthaadcm2ub+7XgZycP
 BkdPQN/hFjBiqOG46ezbhC3uHId+YZVhzrBgpNtpoWHofdTwcM9DlOCtYLQeRgMBS1uQkW6YG9
 yMqBRxgtElzdOhY+5VTG6ODfHhcMs2HviHVTM4DecT1LNkTNdTZJBuEvL3AtYVz2NuLO19/qz6
 BHspB5hH0bmBRlIHgm/j90Hu
X-SBRS: 5.1
X-MesageID: 53427840
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:csAAJKG8/P/+A/QSpLqFZpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1ENTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMm9yV0qp+lWH/ebcGUjaRny9Mw4/U42uonhrdUlCvg4lLJd1pAZYyHpVIKM0lN
 gtMcxT5fpzp4EtHPpA7Epoe7rANoX3e2O5DIulGyWuKEg2AQO5l3fJ2sRD2AiLQu1E8HJgou
 WMbLtn3VRCMn4GT/f+h6F2zg==
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="53427840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af+/RZt9JWibd+A4agowti3JGF3LqKhKSS/6hwh9Yov1sM00YCESTA4lJPEWpHNl5oSh6cP8T2/CgtIc3ZVLa2pJrqaFV/4CyPl8QfjvbH/L9gnjSnnUY48XKJWNxXLes+rwbsT4NWgnfWo40cPKXRuXMJHVdS8ZUV52kHfqhrbiYqIoh4zGK5nOTiT36/V27caUKwMgpjYbP1vf8dCgC5Z3wJH2Y7iYy6/4CMR5Zi/N5dYsmLPDCXlBeJKkB8eZ9fB1JZ/sh9/KPgXKfYgZNaGhFop+MDoGr4Z/iBzAUrgzvJeLgFiucbyI+n4MzG+35eFMSW0Bd1Goj1xSpiHIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC6FxcV4fWhBGy+WBcSzHx34FejOsk/gvQo5l1SaVX0=;
 b=eBHhQB3N3l6brkDNbJB4YpGaJBsULS0fMDCDJpWL1TQ+KcN4n+pk+K8L/WAZ1QGzD8ZRCDmmPtp1YJOX0P/tnrnwiiZvdgvx9tPCISI9g6LsA1hrSiYN3ZopDXh7sVhVJ/QveQXx/FYuLtVF4NOuAikhhTEYXttTZYXlgDzK1pMTkibyeJSNXes5CRxeGFnpzeHeZBrr2ynpWw0AYql66qM02bq4zNnabKkqeDw5rMtvpQBWw33i7g4vj29BpY2UFKWeYZf61rX38MeMLqWjsaCXTiHm9CMJ11PBg8TfKSBU1JgUfrNQEIhuL2THkztC9RqyqnBBPEls+C4LiSRAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC6FxcV4fWhBGy+WBcSzHx34FejOsk/gvQo5l1SaVX0=;
 b=G6fNzM5ygZ8hO6mIr+sHSuCrCCwJRDx8wdZSgBbD7YNTKxg+gfjMIVCKYuakyxzWfxsl+k5XAMAcjAtOcnBfAmDE42G4gif04F7cMfOvba/sVpNox6F4WGluQ28ILxpm+wGjb3gRhnnRsqvS1CqbcY8VucHswIs4Omn7Ohd5OMc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
Message-ID: <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
Date: Tue, 31 Aug 2021 14:02:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4784cef8-dd17-45a7-9dbc-08d96c7fa661
X-MS-TrafficTypeDiagnostic: BYAPR03MB4870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4870725B252EE8D91A5B870FBACC9@BYAPR03MB4870.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ayw52NBEwq/dxpgmorQCJX87uREeUD5kKlcVkgxJ0k2zDIeKQqQ2jx59t+NzD6IK3zUrdT4QnggPnh0JDYiQQ5SXaEI6kqCklt/2zWcbFuF7htxcYD981haznGbCIsATm+jPj8CfUQzMF1s2lYZ+uA81nt7CM8DfhR6PlhqIAH8calIaGDrbWwhAY9SWVL9wVVz7rVio2Z5Kc6h/z6TsWLExIatdRt1IvFWmuBzTC1jwY55+RTj1Wo3SE6LySmmk4UnN6YTJwe6fITsnXszv3Q0dEYWeXvXtDsCa5CLuJTCC5PqerhjDVnVMmbAKcO1Htpb0l5treklkfsNl+GK/KwHQKOULuRyZuZ9Bs2xxGNezVu+SY+YJokApTcqHsLdNNaS4srZw/UujUo0RRH/ItW4asBQnjm3IK3i5yzbhth9nnms5fYPBIIGRQAVF9wItNtWJxT73u8KrtbBTaNTtKbcOzguRnMSUWOEZ5YNOBwPzLTEA8z2LbrLiyhshByCrdgKGP7gxpGXD0WnSoqwCfTabezh19wM11gguP8Uxnj2LGqY9xFfG+8DF9hpwHBbIUu50IA3bAE0FcZpypod+yYMEb/xeIeVS0G+nN9v/uXEea5LFVa6qhQiRUqxTjy6TU0v2coMsgzVYJQSRynVGUTNZm4ltrxsYkN/P7qNFa/dwTxLFtqID2T88bZ0wVIrzmgsOaRUCzYCSNAbG+hR4ZPql9YrxCsTZREuusRhw+uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(478600001)(2616005)(110136005)(107886003)(36756003)(31696002)(66946007)(956004)(316002)(66556008)(31686004)(55236004)(53546011)(186003)(16576012)(26005)(86362001)(66476007)(38100700002)(6486002)(8936002)(8676002)(2906002)(4326008)(54906003)(6666004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNnNXUrYnA5N1k1Q3dmWWhGS3pqdmRwNjV5QTE1MVBQSHJNMmxGcXB2dG0v?=
 =?utf-8?B?M1RCUjIrUWFucUkyTnFmZFc0KzBxZHdSNlcwaThYQ2QrS3d2STdmeUl6cG9a?=
 =?utf-8?B?dG00QTF0M2huOWh5SE1JdUVseUFuREtXb0tSaXcrMVZBNnZKZHNZdXNTbFFr?=
 =?utf-8?B?UHFYSXgrRy9kZFNCYWNRQmpGV2pFc3NvVHNpcW9UNU5qejEzdUZhcTM3NElm?=
 =?utf-8?B?OW5jTkRaektLOHBQYmpuVXR2dW81UVFBQitTZXZaSTNMNmE0VDNmZTNyN2VY?=
 =?utf-8?B?UTBuWXdtY1N4VDFKNzlzRGpaKzA1b3lSOTVMNmtSa1FrbVUydnBFWEhzeWd5?=
 =?utf-8?B?aUFjL3hjQ1RYdy91dUc4TzNDQ2Fpd1AyOUxpc3EyTWtoVjhicEhJMFNTR0lH?=
 =?utf-8?B?dVN2cHNlK3ZzaUtwclQvbWdGcW9ueUpZYkIxaUl3cHRHelZTWTdvQytyM0R0?=
 =?utf-8?B?L1lybjdEbFdmd0toUnRDMTg1Tk13by9HREczdjZzWDNheUpzV2VpOEpDUFBz?=
 =?utf-8?B?Y1pxNjB1Vks2UmhkcGxQQTN3VlpMc3BYUFRLckZrUlJzdmhMZU5ZZmpXSS9B?=
 =?utf-8?B?bGVoVElJL1Frb1cwaGd2QTBVMndBZGd5WjRBZCtISTUxSlZ3N05mOUo1Z1pk?=
 =?utf-8?B?UXpZcU1nL3pYdnlKNEs5WmpWQ0lIZkNCUTNFMjNYbGdNM2lBdS9FMmxCZEhK?=
 =?utf-8?B?dVlGTnEzVE9ZUk5CQmhublhwb0h2K3dLZ0pJMno2V3MwMTREYUl6SGtzOUxu?=
 =?utf-8?B?a3BmMmxnRTZ5WUMwdWR6SXJUNmREN2cva3V2SFBKOFRkVythTHhNTzFvdCtD?=
 =?utf-8?B?UUZoSndmcFNWelFUOHQrOW1PdTRsTFdMS1hCaFQ1bXpqdGpRTGd2RlIydXZv?=
 =?utf-8?B?V25xek5ONGxFMElWVkxaN1ZiSU1POGxNZjEwM3A2Vk1TNlhtc1hKUEcxTEk2?=
 =?utf-8?B?bzJQVEVOUlZKbVpDVWVFZEttMTh0T041ZFNCRnBWWlc5ZFhMbncrS2I0Uyt4?=
 =?utf-8?B?eUJKSzA3K0NDZWFPeDFQZUIzMDA3SUpONjZtWjNMbkRUVU1jYXVKOGg0aklO?=
 =?utf-8?B?eGZrNlprSEZPTmQ3bjJpa045L3pMMGFOei82Ym4zZU8yRGNRUVhoQnhJbmU1?=
 =?utf-8?B?bTR3Y1RaaldmZUtNZGl3Szk3SDE3WFRUSmlxNTZGNXJKSzBRb1JHWWVWRmhi?=
 =?utf-8?B?L0pLYnZKdEdXNTh2cXpPSW5qOHJTWWZKS0NMTHRVd1g4T09MeDU1UzBuVklU?=
 =?utf-8?B?MEszTVNTV253MmRZSDByUmtTR3JFR3VSaUt0V09xczh4ZkRKZXFYUy9zSGVZ?=
 =?utf-8?B?cy9Gd3lCY0ZYTTVYQzA4Rk8wRUFzWGhrR05kQVpNUll0TTFqTTNTcXR4UVBR?=
 =?utf-8?B?eG9aS2VadXE1UEM4UFJGN1lOK1grenk5NjZkVlBUbTBubWZzREtNbmdOYmtj?=
 =?utf-8?B?REc0K2U5NTdrVmFHVEN5SVFwT2hDU3I2QUFnRWN0OUxpOXRQb0gwUDhxUVRR?=
 =?utf-8?B?R1FkTDVvZ0xUWlMwaENiNExISkJTUndsNjgrWEJ5TDU5Qlp0SC9zb3lDZlBG?=
 =?utf-8?B?NENzcE55RFRPc2VMM1Q4WEFJZEhlN0llYkswdEFIcTF0Rm5DcEh6SHFRNmxF?=
 =?utf-8?B?Vm9vSm90WGlvRUhUdU9IOUROTVUvMXNVWmZNaWZ2a1JsSEpnVHBObmhxQi9U?=
 =?utf-8?B?dVRaS25GVnFmTmdRRFZsSVN3UG1tVHJvVGp5cUpWd2JEeU8zZlZlYThXdkxx?=
 =?utf-8?Q?pjMlskZ9qkNIATeDTzw9HjkHrseZoheOjy7IQpy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4784cef8-dd17-45a7-9dbc-08d96c7fa661
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:02:55.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73nDR05w0tpJfiFCd/H/+4aR9FOPjLQLpTEr+8OgRByNfOsJu8QUOZLzorvUwJvMp9Gi4wFQ6umdlgwq83OHaf2l52/kyO1Es7/ncEO8uqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4870
X-OriginatorOrg: citrix.com

On 30/08/2021 14:02, Jan Beulich wrote:
> One of the changes comprising the fixes for XSA-378 disallows replacing
> MMIO mappings by unintended (for this purpose) code paths.

I'd drop the brackets.=C2=A0 All it does is confuse the sentence.

>  This means we
> need to be more careful about the mappings put in place in this range -
> mappings should be created exactly once:
> - iommu_hwdom_init() comes first; it should avoid the first Mb,
> - pvh_populate_p2m() should insert identity mappings only into ranges
>   not populated as RAM,
> - pvh_setup_acpi() should again avoid the first Mb, which was already
>   dealt with at that point.

This really is a mess.=C2=A0 It also seems very fragile.

Why is iommu_hwdom_init() separate in the first place?=C2=A0 It only does
mappings up to 4G in the first place, and with this change, it is now
[1M-4G)

All IOMMU modifications should be as a side effect of regular p2m/guest
physmap operations.=C2=A0 I suppose this is another breakage from the PV si=
de
of things.

> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>          nr_pages =3D PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>                            d->arch.e820[i].size);
> =20
> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). *=
/
> +        if ( pfn < PFN_DOWN(MB(1)) )
> +        {
> +            if ( pfn + nr_pages <=3D PFN_DOWN(MB(1)) )
> +                continue;
> +
> +            /* This shouldn't happen, but is easy to deal with. */

I'm not sure this comment is helpful.

Under PVH, there is nothing special about the 1M boundary, and we can
reasonably have something else here or crossing the boundary.


Preferably with this removed, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>, but only because this is an emergency fix.=C2=
=A0
I really don't think it is an improvement to the logic.

~Andrew


