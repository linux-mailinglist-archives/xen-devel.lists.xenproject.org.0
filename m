Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAE32F023
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93897.177364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDOF-0004ao-U4; Fri, 05 Mar 2021 16:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93897.177364; Fri, 05 Mar 2021 16:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDOF-0004aP-QR; Fri, 05 Mar 2021 16:33:23 +0000
Received: by outflank-mailman (input) for mailman id 93897;
 Fri, 05 Mar 2021 16:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIDOD-0004aI-Tj
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:33:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04bb71ca-854a-4d91-918b-0474c3336357;
 Fri, 05 Mar 2021 16:33:20 +0000 (UTC)
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
X-Inumbo-ID: 04bb71ca-854a-4d91-918b-0474c3336357
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614962000;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3KcCIxfmPJW8Z5moBG/o9/B6agiYtOl0+NMH+LNA6sY=;
  b=E1QkbNnXspm6T+3GQrqM4/IX7erfkyxrZlNT+iTPsu6mLpA5PXkZCk1f
   BHH/kkoJ9t8neXR4U1B50BkuhSSL2tMAt/Gc1O1Negavg5beC7N/FEya1
   tZc5f4O+YEXk4xzQmr/KhNxXJ9kU3rkEZqgj39insYCUCIBjexUTLVMnc
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V7UPt24OrqGRsTTWsI4AM9znFChnlbvllxDaOEwwFwBule7ChCKZuhhEvnDiok5cMwnjm4PRyu
 nHXBhEESnHOO4hS6IYoIfhGzdLWbd0RQVaAFgsfow8ZmlApO0z/6TAlYMncSDTcJpUVBcLJi7S
 b8qNglAHMDq1DaRPAHG1mYXWMGLDjcbu/YZz+Am3/BL7CHAtkQmsd1Y91sAOqIysytut5FzNHz
 lPHrJxqQF9xSSF18XUVixwvdeC2CDP7AdFJTP+j+1L/tEuB6KnRpZwWLNDKfb5odYnLqwv4uud
 zpU=
X-SBRS: 5.2
X-MesageID: 38566661
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="38566661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhfvXk8uikwcHhASUbkg6ZuL1B5YHhb7xeUFGosMX49Sh16cLbtxRpfRCWFAYP8v49M/eELKvUQdJwDQCvA3gXeDPWGqQQoU5GZlNA5q9+gb7yuDHNcuPNG1gUvHExFxXjLf1p0E9/uKq0IWOMZKCPkn9lC5ocOFviByFBrxWbkmR1eYMkVbf1OgonIP2wSmvOmmFqUQdpnUVUhcYWby5JFCRZGETqBq2gpaUvHkTiq9EHUX4U1C4otS0cltqYOTSEROXXwiqFtpyg9xxCtEJeDjJf7sztNk1A8F5XbXk7YtnoG+BtqH8LM30jHn86K7Zrdke7yWo+jfyoYMZ/0ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJlnwKq9Bt5dEneSDOUnS+rOw4mZ/hf1iYSBu0DysHE=;
 b=Klg0NpWWyNRjCZnNqi2lQstUzYhqbTxop4f7D7ALI6awwPKjeWCSx8ve2lPdEhnsPUDeD5m4E4KecvgR/wD8jtFiR2NPCBsOWSRY8SSMBKSA5fEjD2W4qMRXDgPvjHsh4Ll2o1eRDcNAE0wds2Gxg3jlVu9mubiCakk1wuv1rimVI84ulDpVr6ElvRhjYOm08vN6mTGYQYEH8jpYalHkXB/hUgwPEVWoZpZkiA6tUZbHBnyeS7csDQLKxwVhOhf2lVBN1ZHtJzD7ege9xgVQhy4pPWfBlj5aB6TDQT+NDHBuVfjGIVHlnOR8s+Jkp0mVVTJaMuzJR9Zvby5GooAG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJlnwKq9Bt5dEneSDOUnS+rOw4mZ/hf1iYSBu0DysHE=;
 b=j5HngWWjgrZxaaOIOLUJU2Ub6CQbiABCq14ryrWtsNHAIESHVzhFGTU2AuJBOCiuAbrnulm2XJABfvui6LMP6vlkqXhKeFDthujGGD5VotHgeRpZJYykaS3PYhNaGbaVmPAn0lg2geR1ydDVkfnMjU1burVgTbsXfwP9r5QyFfM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2][4.15?] x86/shadow: encode full GFN in magic MMIO
 entries
Message-ID: <041aed42-929d-287d-f9e4-c12e5a71ab38@citrix.com>
Date: Fri, 5 Mar 2021 16:32:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ccf12da3-b3df-7be1-1898-992ec994b78f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917ea0b9-574e-466d-330b-08d8dff44a76
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB416655661DEA8F518E9C4D81BA969@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9IRWvsQGwnO+ODpHxHqUMTagS7W7FKnmsMMResMFDhJrRtDvAm5gQKUgG3QIXTrG+SKqEXs5UPpIK3HRFGN3wiu0fUSVWBH0DYxZYGfFkA613zzI22W6B0OKCNejpe2NKnJsPiimmiXheAHOHuTUUPqkM/+pReenbOQvYCk/AOZhQ0aeEAtpQCzjbagHsUbkXggpLXafZhya6Nqof0w6cNGmOfbx80tcU3h/hefwBOcFb7okt5xI8NDq76qhs/9b31BFnAn/eK6TM0sh0BOWA4VCgAphnCYn8LsCpqxx9vt4rxfyMNaOK41TdE2M7VUhdoWpPK7AwIzySYUXbg2/wPoslDYeMxlK8n0WDxeBBNyWXUt7iEU9p6YxxwNOOWLjBtOsUTE/DWjExzHXo2atG5HhFWr67zN6WGkXbKm0d3cOPWPtP+Levrfn/Hc+LU6hD1GeIQR+DK2L1wKmikyx0KY7DgzeB+yNfbpT4ldzKDQBkihrIRnvaoX6uNDM8FvFcOzmBDZ4ryJtvP1FAyeGFNlAWghQICi+5j+bJlLtUZyHNxQehmB+E7sWeFF3uLAVEDgRqB2RTC+xfnK5BKmERKE+zze/hjQe8DpPQwajnKa389DK1WpWLZOZLux84N3K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(16526019)(956004)(31696002)(186003)(478600001)(53546011)(26005)(2616005)(316002)(6486002)(16576012)(6666004)(5660300002)(66476007)(66946007)(66556008)(54906003)(31686004)(110136005)(8936002)(4326008)(2906002)(8676002)(83380400001)(36756003)(86362001)(43740500002)(45980500001)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlRaUUtVYzA4dzhFZG1RRnpZV2lGdGJXWTJnZlJjRk8rRjVWSUg5N01vZzdj?=
 =?utf-8?B?YmJsTVlkYWppK2crYmpwVDlDSm41ZEVWRG1CYzY4bmVzZlluRnFpZDNOdlpD?=
 =?utf-8?B?NURvbnFvRUFOemJWUVNiRXlhaGpWZ2RaN1BCcHlEZTV6M3VWZzZvRUpsSlVa?=
 =?utf-8?B?MG83TnBNSDc0VHA1Y3NXRzJzMWhoOVVRME9SMVFmVEhWZkQybTBqdFlQdEVn?=
 =?utf-8?B?WlEyTEdySGNNa2ZQaWt4eTN2NjZGaytRRHNaWUcyeVl4S1ZGSFFJZXlaeEFD?=
 =?utf-8?B?dVJDNFhqeFl0TTVUNy9LRE1wdm9NYithR2Q1ZVJ2M3B2ekltRjFzeXB0Rno3?=
 =?utf-8?B?UzlCbU1tY1V1bUZOSzB2TmJFS2k0UEpOMkJjZEJTYkgrMGlMNXNtOGJnaFQ1?=
 =?utf-8?B?citPM2l0UkhTUUo5Z0dwQ1RLZ2hUQmVWeDF3c0xWVEs5ZGwrL3ZBaitUUjhq?=
 =?utf-8?B?VjBNMmtPNlZCdkxSdVpKRW52K3dtZEozbC9MMWZwTWRsUk1DazBTdjNZaGl3?=
 =?utf-8?B?Q0lxalFVZ09KbWFIVzNqRHJCcEY5VXFyNTRJbzhnTjhXQ281emJyT0V4YTdl?=
 =?utf-8?B?Njk5K3JBR3MwRTZtalQ2b3d2RkxXUUhCU3huNTlleXlPTWRPUWdJL0VuOE1P?=
 =?utf-8?B?a0lZbVZOaVpXQjU1TW9ubGpWTkFabEdoWHErQUpkK29GZm84bnZRL0ZXUExM?=
 =?utf-8?B?WTBUMy9kOTZBU09yUllCRHM2c1Jwb1lOZlNvb2pCS3NqWDNWWnV0NVNaUlQ0?=
 =?utf-8?B?VU9zTHVoMEpUNGt1R1ZjbVNPS3Q1ZzBacVhGdkhVNGZBTmxrallKc1JqdUhT?=
 =?utf-8?B?elVBSWhIWmxxNHpmWjEyQnllMzNFdmZ1NDlycUNPWGpPVkhZNW4yd1JvZGRM?=
 =?utf-8?B?N3liUlN1THBsWFdzdk1xTnNQOU84NU9ocDFIczd2b3UwZy9zQVg2b0xZOU1q?=
 =?utf-8?B?dVdRTHZiKzJrMkwxOTg2eVJUNk1oVVhLQ0hGLzFPYXFUMzdHdkFwNUlVa1NL?=
 =?utf-8?B?VGRwMzl0M0xIT2pEeXRyWTIzenJJSXRBVUE2a3AxVjFYdEJJSUFrN29wUitM?=
 =?utf-8?B?bGtVd1pjaVkraUNrcnVwNUpONyt0OEo1b25SaHVISUFyZ21jZFdGdTZXUkV5?=
 =?utf-8?B?NUVDOXJZZVhtL2RvTE8zU2FNQWJFN0doY1pac3N2bS9tcHRqVklvNmFIWHhr?=
 =?utf-8?B?MHpYRnd1YTJCRDBHalhFRzJmMWptS0wvYWZySW1vb2tiMDBIY2I3eXNyaUpP?=
 =?utf-8?B?L0srSTRaTHVwNXU0QS9LL0lmeDBQcnQrWW8vSTh0MUhOV3pXZmVDTWV2dnZt?=
 =?utf-8?B?UXVHdmYwTHBXMGY1Vy9wT1BrSGNIb3lMSmFHSVEvTFcxUnFKckNHanNDS3pG?=
 =?utf-8?B?TDA4TDlYK2xMRk51RWo3SnliVGZrZW9DSUsxVS9hM1k4ZlZ4cXFKcjNmU2FQ?=
 =?utf-8?B?bzI5TWxBdEpVN1ZtejZhOS9pdG9HejN0S2JNM1QwTWpNZjZGTTdrTFpEeW9k?=
 =?utf-8?B?TFVJWnNpQk9nMCtYS3g0MGVWbmJNREFLSTZqUWFmYUlKRDcxSU01eGpJOWl0?=
 =?utf-8?B?Z2FqdVNnNjQ1bUpDWEJKaDBPaGs1VDJLZERDUnd4NjBSemU1SW5oY1lLWjJC?=
 =?utf-8?B?bmplUTBwVWRYQjZ6MERkSEZuNnI0cTM4bkpRblZ6eUNSYk40N05QdXlhUzBt?=
 =?utf-8?B?M3Q2aG1mZG5kNm9YVy9ncEhFUDZjVkFGaE5mdmphTWVCZzUrUWhkekczUXBk?=
 =?utf-8?Q?z1rSQdn5XXGIE06+c7TzGC8PFnSaZpIRbWMJMIt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 917ea0b9-574e-466d-330b-08d8dff44a76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 16:32:38.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UkQ+eOi0raOASg/CsrYzL/ZMhswuVo+eaBTw2FNarMO3m8PuQ3OCirbb1IcmuOLo9NVkWCUPPQXEPKJUiftdTbR9NAnOzdLZexO6G2BPz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 05/03/2021 15:37, Jan Beulich wrote:
> Since we don't need to encode all of the PTE flags, we have enough bits
> in the shadow entry to store the full GFN. Don't use literal numbers -
> instead derive the involved values. Or, where derivation would become
> too ugly, sanity-check the result (invoking #error to identify failure).
>
> This then allows dropping from sh_l1e_mmio() again the guarding against
> too large GFNs.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder if the respective check in sh_audit_l1_table() is actually
> useful to retain with these changes.
>
> --- a/xen/arch/x86/mm/shadow/types.h
> +++ b/xen/arch/x86/mm/shadow/types.h
> @@ -283,9 +283,17 @@ shadow_put_page_from_l1e(shadow_l1e_t sl
>   * This is only feasible for PAE and 64bit Xen: 32-bit non-PAE PTEs don'=
t
>   * have reserved bits that we can use for this.  And even there it can o=
nly
>   * be used if we can be certain the processor doesn't use all 52 address=
 bits.
> + *
> + * For the MMIO encoding (see below) we need the bottom 4 bits for
> + * identifying the kind of entry and a full GFN's worth of bits to encod=
e
> + * the originating frame number.  Set all remaining bits to trigger
> + * reserved bit faults, if (see above) the hardware permits triggering s=
uch.
>   */
> =20
> -#define SH_L1E_MAGIC 0xffffffff00000001ULL
> +#define SH_L1E_MAGIC_NR_META_BITS 4
> +#define SH_L1E_MAGIC_MASK ((~0ULL << (PADDR_BITS - PAGE_SHIFT + \
> +                                      SH_L1E_MAGIC_NR_META_BITS)) | \
> +                           _PAGE_PRESENT)
> =20
>  static inline bool sh_have_pte_rsvd_bits(void)
>  {
> @@ -294,7 +302,8 @@ static inline bool sh_have_pte_rsvd_bits
> =20
>  static inline bool sh_l1e_is_magic(shadow_l1e_t sl1e)
>  {
> -    return (sl1e.l1 & SH_L1E_MAGIC) =3D=3D SH_L1E_MAGIC;
> +    BUILD_BUG_ON(!(PADDR_MASK & SH_L1E_MAGIC_MASK));
> +    return (sl1e.l1 & SH_L1E_MAGIC_MASK) =3D=3D SH_L1E_MAGIC_MASK;
>  }
> =20
>  /* Guest not present: a single magic value */
> @@ -320,20 +329,26 @@ static inline bool sh_l1e_is_gnp(shadow_
> =20
>  /*
>   * MMIO: an invalid PTE that contains the GFN of the equivalent guest l1=
e.
> - * We store 28 bits of GFN in bits 4:32 of the entry.
> + * We store the GFN in bits 4:43 of the entry.
>   * The present bit is set, and the U/S and R/W bits are taken from the g=
uest.
>   * Bit 3 is always 0, to differentiate from gnp above.
>   */
> -#define SH_L1E_MMIO_MAGIC       0xffffffff00000001ULL
> -#define SH_L1E_MMIO_MAGIC_MASK  0xffffffff00000009ULL
> -#define SH_L1E_MMIO_GFN_MASK    0x00000000fffffff0ULL
> +#define SH_L1E_MMIO_MAGIC       SH_L1E_MAGIC_MASK
> +#define SH_L1E_MMIO_MAGIC_BIT   ((_PAGE_PRESENT | _PAGE_RW | _PAGE_USER)=
 + 1)
> +#if SH_L1E_MMIO_MAGIC_BIT & (SH_L1E_MMIO_MAGIC_BIT - 1)
> +# error SH_L1E_MMIO_MAGIC_BIT needs to be a power of 2
> +#endif
> +#if SH_L1E_MMIO_MAGIC_BIT >> SH_L1E_MAGIC_NR_META_BITS
> +# error SH_L1E_MMIO_MAGIC_BIT and SH_L1E_MAGIC_NR_META_BITS are out of s=
ync
> +#endif
> +#define SH_L1E_MMIO_MAGIC_MASK  (SH_L1E_MAGIC_MASK | SH_L1E_MMIO_MAGIC_B=
IT)
> +#define SH_L1E_MMIO_GFN_MASK    ~(SH_L1E_MMIO_MAGIC_MASK | _PAGE_RW | _P=
AGE_USER)

In practice, it is 4:36, because we have to limit shadow guests to 32
bits of gfn for XSA-173 (width of the superpage backpointer IIRC).

Also, this property is important for L1TF.=C2=A0 The more guest-controllabl=
e
bits we permit in here, the greater the chance of being vulnerable to
L1TF on massive machines.

(I'm a little concerned that I can't spot an L1TF comment which has been
made stale by these changes...=C2=A0 Probably the fault of whichever numpty
prepared the L1TF patches, because I'm certain we discussed this at the
time)

Going from 32 to 36 bits moves the upper safety barrier from TOP-4G to
TOP-64G but I recall us agreed that that was ok, especially as the main
safety guestimate is "no RAM in the top quarter of the address space".

However, I don't think we want to accidentally creep beyond bit 36, so
I'd suggest that the easy fix here is just adjusting a nibble in the
MMIO masks.

~Andrew


