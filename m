Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D344028B1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180997.327935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa87-000793-NR; Tue, 07 Sep 2021 12:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180997.327935; Tue, 07 Sep 2021 12:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa87-00076v-Jc; Tue, 07 Sep 2021 12:23:11 +0000
Received: by outflank-mailman (input) for mailman id 180997;
 Tue, 07 Sep 2021 12:23:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNa86-00076p-Kl
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:23:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dce6d494-7b8c-4768-bfd0-12b0b54173a5;
 Tue, 07 Sep 2021 12:23:09 +0000 (UTC)
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
X-Inumbo-ID: dce6d494-7b8c-4768-bfd0-12b0b54173a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631017389;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5SRy+GkaKSYNYkCp7c5Yrir90YVimONIfq6a0GmK36Y=;
  b=O3exGyuvoVxoIpeL+Y8IkZzVYAPaDz33DOqNotY5f01VOfClb8T7fiMK
   O9rggdneKS/4Hqt9sb4fx/Moyw2IPS2/Bi3flYFVy51Bhm+tIlXA61eTf
   xgBrMdW6gnpdBRx7Bh85HREhG3dn3Q0HJNRpfykI/eqgQvkjA6anMj5Bu
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jgCqq3dw9YpX5Uz6TmLwID2hGPT3wGsY+Pt9XkCfIKmBQxY58vc/UY1hXkCel8SlXLI+jyvYjr
 fDbl43hkqy8WusXCZv1e8B2uWDyAbKJY2xovtQa/iShlEybzgKCgbfOZl1lvVoDmhtcc5Ol7Dw
 4RS3dfKc73sbZnzxjmNGapy9gLedzhKh8v8j6w/ZAgFN8ivoII0DV/PCaN07HpT/Q3DyV+krS1
 toxYM7aL2XCogcS4mzA9iYmhhkABxUkUws9ItiHWlq9CWzUGJSP2CFIVM4y1+yVkbHTFaGtJdq
 2aHIxuc+i8PIxfecMaP6rIBZ
X-SBRS: 5.1
X-MesageID: 52134917
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cl9QIq4XmHu+TJSn5gPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="52134917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbrTKVl9PF8CCdv0X86WEEyyYY2eoAwUGvtPdhggnbJcDTWb60btkCZJjq+/Hm5N0tPU6+F67ML7X3iZ+kTCA1A8WSz1zXFiyN0C9Nwp+gviBh3sh2KiLHwnN1CP6FRVKUYYl580W+rAkry7DJecJa7+0H9KtiedWZe92eCu4uGtC95ZK1YLAptv4TmBiJKEWWVMBC39yE25xvLy/9dhaW4kBtuqpwpXG2Xxgo+iPHoAzS39BHkW1wvn48jisU5BzYVCT9JTd9PrOM/2MyO/4/oXwfvXSlRZKF5fjYQFm91j6P+HbPr/HrdU5JYSR5NLmIOuuYjX+wRnsFncPZ/2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/89I8PoBYdPweDDXpJU0m/Tu0Qc273nHKnykOHY2riw=;
 b=N0p9uIBL7STgRCbOjYw/pHLAtSpUvn6pbcTopk8jytCsOGy9eaR06igKBPy49OcC4BOGi4v8s9+BzFSfQQO+hH5R+ZBHdVfsucUDWlTS/uM3wVZpoQ0a0N9JiiV9xJ1eaaLtv3plBYoinR22Oo36082Jcg3+n7PJ/Xm0fDQQqWruxff0Z2jN8GKcyOx8+R3yJkaXJZjr0NR040I64rq9Lc26qYiZP87q6MxjyioT8/k3SGPvKIianSC99Gg7Srcw/6q29mrqaSpy1w6jQFsWSA6PQrmAcx9NCFNBSKZrfdRXZoMMAGAVynR/roUSWBhxCjZILOMDAKwMlnzyTeVefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/89I8PoBYdPweDDXpJU0m/Tu0Qc273nHKnykOHY2riw=;
 b=H4grYPRDrmf51qPqwBOf2Y4BH4XzlxHARHZh2pDAn2zYey4Flcvba5JmljPW3HejUTkd2MZIi2EBUhUwASW8Cxp2kSu75ll7pUCEuRgxMwzJ3L+nigF1xPecsaB93b1ZUa3KcXY6OwZcCriSka5yrP6vCKdypmIB02avs/3pW/Q=
Subject: Re: [PATCH] x86/p2m-pt: fix p2m_flags_to_access()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <2ec3fb93-5b91-15d0-4769-adf414af86b9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5fb0ae14-3838-c0b6-3e1c-ef5b44129186@citrix.com>
Date: Tue, 7 Sep 2021 13:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2ec3fb93-5b91-15d0-4769-adf414af86b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd312749-5c94-40c6-f67b-08d971fa3a2e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3494F42D32FB36868DDC5641BAD39@BYAPR03MB3494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8djyJaybhNVSV1A4J0PLX4ua64QGBCA9kfobzAKBGM86WvawdgU20+Pi+71xnaO0+RlC70rR/7yLWFOlxGqPDrEua+8w56jdZPHVUnvxTbM45rmZi9QLo3Gi9JG6pN5v3kSzlRrtE8dBXn8YtNwvl80ANQ5eUkiOYnBhrzlxs505nrsMsuwbZ5B/GBkuahtiG2YBRxIXl2usLQT4kL6iPbXwP5K3G4dql87YaGs7zlWRA1a6seS5S1sWq6NJN/8R4XCE2v00iGID9hQxvaKu9dG0wpbVJQLtMAEhVPbVa10NYhshQWlOoXDzp3CyzXIWX1YHyvAuB76pkVNLUDd9Ja6uwgoaUkbIDik/0WlJvW2+cIF9kT8sW0u+s0OLUwuqmt+13VJPAlIXocl37wjPboQ8oHPfD/kW/1s+WokgmSWOJRbzIiD52TD2d5FierZPOwnq13Gk4mfAqkwZ3q+fmuiTy+dEQNUURhCmQZu/XcprJmtr45rAyYUaEiRWNvk7T1B7WuUleodJrQpbME2JLJ79KKW1NJFvqHMYap7TF414ov+SYEyob9jyU6rWz04haEiqMM2pQo0p0vzf/RFQF4RKHy6fUjJEC8J7puQ9ySnzInfrZ2Gz1dMHrqTS9RGDU4qLBE2eeacYjtZ3Nq4FJwkQ+yqTaW+Ax4lmc5KC1YbRc7qGGaE/1A8QNyS4WoOpn+kmOT9mpbrifh7lxGR9Dx9O8+NuGxVmYdcKistDEjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(107886003)(2906002)(86362001)(36756003)(4326008)(53546011)(316002)(38100700002)(55236004)(54906003)(110136005)(956004)(2616005)(31686004)(6666004)(31696002)(8676002)(66476007)(6486002)(508600001)(66946007)(66556008)(16576012)(186003)(26005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNXbmVYY0VDbEhZUVJmeTZyQ2g0ajlid1RTYnJoNXU4Q0ZaTjhaV2wwYzFw?=
 =?utf-8?B?d1hqUWpRcjRRS05KZDJmb2FqaWhVWEZmMnJicXZiNk9uV1J5YmFpaVZOSUp0?=
 =?utf-8?B?VW51QkN5R040UjJuRTYrcUFXT05VWGZKdHQ4WU5JUXRqaGJGVW9yTEw0U2Jp?=
 =?utf-8?B?V0x2ejR2V29rMGliU2N3NElhYzRkUUk1ZGhpaWV1Q3FBUkxRSjhIa2diMFBq?=
 =?utf-8?B?R0JNSzE3YmhjY1NleFFWclp3VGpsV0REVjlLL1Vac0t6TnJVWHZPUHdhZ2pE?=
 =?utf-8?B?Z2luaVpVSDFXVkhHS2cwdSt3eEdVUGgxSFRsNDF1WEtQODBIZUgralpaNnpV?=
 =?utf-8?B?aU9BQjlWdDlCeVFQSDZIN3l3SHZ4ZEhnc1U0ZFRCNFcyc2lOQTFsQzR6Y0Fw?=
 =?utf-8?B?ODBnWjBlVHZvZ3k0TlVyVUZUSGM2MU9nNnc2TlJ0RUJtWGtadFNaZG45QW9I?=
 =?utf-8?B?dElqdXBZRHF4WjFlcGdLVlhITExtRWpnanBNQ1paVGpXMkY0d3R0YndSQ3dE?=
 =?utf-8?B?cVVzRmFseGxSZ2c1TEZVSkJibThFaXpVMld5T0l2NkMxUUxQVUtLWC9UYmhR?=
 =?utf-8?B?T3RzRlcvTTlNbHlHaHBIRXNWSHpJYS9ScFF4Qm50djNHc044OEJKcEpzcDFH?=
 =?utf-8?B?YlZFVEZFWHIzRnpMZi9sOC9HSXF2bldvcHVzQzZ6Vko2YnB0ZXR5YjlOUGpV?=
 =?utf-8?B?RENoUlFsNUVRUzRLR0NqWnNsbVVYTkFEZFVtREdMR0J4VXVVL1JmMVZabHpl?=
 =?utf-8?B?NVJwSjJudThOUTVXVVJSR2gyUXZEdUgwZ2hPaGYyVHdVbzJTWC9ZQlNIRW5h?=
 =?utf-8?B?ZEkreFd6YkVtenNTNlJWSDZtd2RNOVZVSDhFSU9KY2Z5NjZ1NTVYanJmeWF5?=
 =?utf-8?B?V0hlMVM4Y29sRlU3NnE5TGRQZjNBM256OXpmTXRFdlZKOTU2a1NqRmpERVBI?=
 =?utf-8?B?bU5USWpjb3RlZmJRWGo1VmVnYXRMSG9DZktCTlMwaUNNR3lmay95M1FVcGVu?=
 =?utf-8?B?RGllNXVtRWduNUZSZktqaW43SFAyNVNHakdSdXM5aTdHZU13OFBEYkkwaGhQ?=
 =?utf-8?B?bEtoMXNIZHl6Yk92bGxSN2JFR0FxY0pOK1poOU1nem15Q0RTK3MxV1NlRFVU?=
 =?utf-8?B?MWt2c2w5VjVMNVNoc3FKc1R0N3hIUW5zWE55WVBHWjZlV05aOWg3VHpzV3lm?=
 =?utf-8?B?S3c3d1BjcXV1K3BOVnRWNnZVNi8vYVVJOEJnc2VQdEI2Z0tGZ0k4QytkbnZv?=
 =?utf-8?B?eFlvSVdCNmxrY0NkMXlzaUxrM282RU1TeWs5Z2c0M2cwYVdUT0k5TE43azRX?=
 =?utf-8?B?NWkzanFSVDd0QXczaytsMWIyRGovY2IzU0RnREdScXF6REZVQVVLYWlyVFJl?=
 =?utf-8?B?T2Q1dnIyeVVrblB2emh3MUMrYjRucU5OZGNLcXk0RW9VWUllcFM0WnU5VGVI?=
 =?utf-8?B?VnhBTFNJMFpWNS9YRmEzUXVzSkZHSmJhSnl0T1NBc2xSS1BjbmpjZ1V4M1VN?=
 =?utf-8?B?bXlrVld5Mm81QkdTQXUzOTZwcU1NMlMyKzdFR1Y0aXVIM1U5UlQraWdCMDZt?=
 =?utf-8?B?TTBaTHZuNHJydS9kUUlYYVhlVkRZaTZtZGJqOTFlcW94RnF6V2VMR0tyUFBE?=
 =?utf-8?B?dFdZKy9yOWhwVEsvYmRMeHpjRkx5Y3Mwc0RHRGdJZStNNU1pOGovUkc1Si9s?=
 =?utf-8?B?RG45VmRKUXRaYVEra3hjUmh3enNuVThka3dyZnFKVk1TdEVJR0FmOGIvWkNX?=
 =?utf-8?Q?GlENTxOiqcn19kcMir2EVu+8PDAgxpqi9MU7V2A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd312749-5c94-40c6-f67b-08d971fa3a2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:22:58.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eeY+2sRbbDASCxnzucwgBZCabBEWqIfDzNmjwbC0DzmiFBmXW7JLrfOafQiXfNQE7fHoixs+cJoHE3uBHb9sW3ym8o4lLEdIAovFLEtpD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3494
X-OriginatorOrg: citrix.com

On 02/09/2021 08:01, Jan Beulich wrote:
> The initial if() was inverted, invalidating all output from this
> function. Which in turn means the mirroring of P2M mappings into the
> IOMMU didn't always work as intended: Mappings may have got updated when
> there was no need to. There would not have been too few (un)mappings;
> what saves us is that alongside the flags comparison MFNs also get
> compared, with non-present entries always having an MFN of 0 or
> INVALID_MFN while present entries always have MFNs different from these
> two (0 in the table also meant to cover INVALID_MFN):
>
> OLD					NEW
> P W	access	MFN			P W	access	MFN
> 0 0	r	0			0 0	n	0
> 0 1	rw	0			0 1	n	0
> 1 0	n	non-0			1 0	r	non-0
> 1 1	n	non-0			1 1	rw	non-0
>
> present <-> non-present transitions are fine because the MFNs differ.
> present -> present transitions as well as non-present -> non-present
> ones are potentially causing too many map/unmap operations, but never
> too few, because in that case old (bogus) and new access differ.
>
> Fixes: d1bb6c97c31e ("IOMMU: also pass p2m_access_t to p2m_get_iommu_flags())
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -548,7 +548,7 @@ int p2m_pt_handle_deferred_changes(uint6
>  /* Reconstruct a fake p2m_access_t from stored PTE flags. */
>  static p2m_access_t p2m_flags_to_access(unsigned int flags)
>  {
> -    if ( flags & _PAGE_PRESENT )
> +    if ( !(flags & _PAGE_PRESENT) )
>          return p2m_access_n;
>  
>      /* No need to look at _PAGE_NX for now. */
>


