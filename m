Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44721324FFB
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89713.169231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFG8R-0005s9-Iw; Thu, 25 Feb 2021 12:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89713.169231; Thu, 25 Feb 2021 12:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFG8R-0005rk-FZ; Thu, 25 Feb 2021 12:52:51 +0000
Received: by outflank-mailman (input) for mailman id 89713;
 Thu, 25 Feb 2021 12:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFG8P-0005rY-Mf
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:52:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8762f0ec-6212-4a7c-8d96-0c4f99d072ce;
 Thu, 25 Feb 2021 12:52:48 +0000 (UTC)
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
X-Inumbo-ID: 8762f0ec-6212-4a7c-8d96-0c4f99d072ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614257568;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Hs2asnct3TXgHebZpLXqg1Ns4/LLys/oILo8qHy7pg=;
  b=FubBz7k6AExqZ9RIKUWvtmopu3BZIrZ/u145FQMJRm1pt8crEE4StRLd
   MqSa8Ne7ZGVj8R2YPFHytQdMZwTszWepJCz2Ro8pSsBLrjD/B40Dbo+zm
   SKAiC2jgIvuWdMk2apgavAcycbZbFP5X3jDLXMc6eC6Ye7pDOJAqSCbaf
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7DRmsr11YTOSgorGKcPHhc6/WaXY+k5t7zPqCww2OeSOVanaETxKl2tb3OaZB9LJFOa5Lbqg4s
 +HSc9wdQaAh20qu7li57pRIjxUVyTc9rQAN62usxkaMNEZTCxOhungt81NHJUnYvpCNo5bxuuD
 aqt5km11enX7fJ1cXyQDJGvcD6Qrd+l6beB1zeWNo+r+ZK6Ye7oo6bRAi/aJUnYUR5S/mVYvTm
 Dn2KpTOrOzryq5DYSB1So2cpVHEz2wa/H4cwB/Z3fBEmlwrRbLP1hgnG81CPyOMPmbqYXfRNNb
 068=
X-SBRS: 5.2
X-MesageID: 38199715
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,205,1610427600"; 
   d="scan'208";a="38199715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCweisxKdLCd4LgMKgSWnWI7XuiVN3rHbPJQEoRPUgBW0mcyvN36oOVp8STNtq++XWzx7z/erYJeJX77+BPMD1/CUJHB/xZMl/fQkEv97tJkxK2cRS/+qjHa6yq96sE3PvPae5fikulMETqJR7+ehJ6bDcGWgaMnhmVA9P8mguS4Ac08gwX0JGtRED2lxzW2slFrndtYBQyg7IF0g9yAKDfzkdxu3DgKW08GsA5z2bA1b2/bvS7jEsnZG4rnrFrNGMztBkK/q6QejlO/Mj9bOD3EuMQD4SS8tkzrBNin/pHfDXZLT54w2AmYrV6WKj0Jl6dYFYpNqGubTSTZ7jowJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhPANmBnHkkjRf1uO7PE2gOVdJwy8J+ccpi+jZLnQg4=;
 b=mnjNZgIiUUs2R0jNpqI1kXrqxTkHfqYelawnrhXB0fLGy7/mBc5+reDXFQ4Yd8YyM0XVG5QHXpYmEFmjypGuGg2hTNoc9+i5XLGXLttBAvOmwbfcsYNWIONX9w2o0yPQR60NB8ljIqIlWA1XsjWmOdBOIHDm4nXS8LkevLNo31h9krVNaMhFdcF54cXyr654LNL+c2pppspMMri5ABj9EfhhbS6xA39cQ7I3420ezu8/n8gelDRwHtcBymT1A++/gdK5NWXU03p1TG9KQt5PFg8WKhG8imn/Wp9N4+sfXxm/e5THFIuhmkJqV9vSPlPbRzyS45Hkd+LQRH/KAJo7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhPANmBnHkkjRf1uO7PE2gOVdJwy8J+ccpi+jZLnQg4=;
 b=BtoKCHYG/QnlSLip+gcG+chN/EAWZhERLoqp+BivLBYHk6Y8VhINZiaYHsbTawyBnsV+7YPShntM4EAjkxIZc+IlI3WeHGbDhcJ3532NBmAejS3ZoiyFLomzmOc8KsogxTq0BzIbmtKZJL+x5UV95qpBU7VsvUTwicSFRF70CRg=
Subject: Re: [PATCH v3][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e9b9e12-f3b5-971c-caf6-377c7c7c439a@citrix.com>
Date: Thu, 25 Feb 2021 12:52:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd1f68d7-234f-4e94-d01e-08d8d98c3ea5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB43589D12F868625FC78412CEBA9E9@BYAPR03MB4358.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fm32fSAA4LCf7mIdU7/qijhylGDARs2vSTVY8gDk/E3JH6yBesH1EBDIjKnW4QSwkBiNDKMySRjv0QEcFKBkc+KPhvghIub6u3hWRNMZfoqoTjmCIcmryrEMGzqKZ1G4P5D3mVW5xpVhCG3sUnGWpS3Ci4j4Hchf5RAuqCIP1wbzS/2c2SM2RmInt1SElqpWl0z2ZAR+Vqsh2rdDTxdF7Go989IAlhXtysWvdw3Xg1vsXYeOYqP9P/KDT0ikWeBOCgWY9t+b6CsgvlT+EXoAgVgrtYb0dX+OxbHu7tVuPzJZEopB5rtpq2Hlfi3gAJ90w8EqWFY99KH0EqirfhDFygxfGO9x6bioFWhpWIaDvp2OdjEYYECur4l9xE6qDVCEKFqsKt5+cOW7axr9Y/Qlje+bzji3IRHiUbhGxaBPzAshdOShFElEiB5EADT6+ldkNMiXToqaDT0/KfP9T8Nw3jWrlz2lmANqwLc8f0gLOV1ZWM4q88BiucmKamiVRJoka1D8pqtz7LeZ06+AUCCW8voMsCuAE8sf9MbCDBpS0VNTUZmRxP/1pQqhBqXxA7uy5ExTVKsRv5LOCgOsqnVbplVjH6P2Jr9RiyzwGxxvVrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(66476007)(316002)(478600001)(66946007)(6666004)(6486002)(54906003)(186003)(53546011)(66556008)(8676002)(16526019)(31686004)(16576012)(956004)(4326008)(26005)(2906002)(2616005)(110136005)(36756003)(8936002)(86362001)(31696002)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXVwcmNIVnRpbDVkZFdQbkNZV3lkTXdmZGZZbnJVd1RKTERpaXR3TFc0UnNo?=
 =?utf-8?B?Y05oeDJrZlpuOXBWSDhsMUdwK0ViWGluSnJEQnNMTGZJTGR0UEdIQW94T2xX?=
 =?utf-8?B?ZXlvLzllQkJVK1dFNkUxN2IxazYxMDBQeWo2Y3J5Z3VnRlJPL2RMUURVRy9s?=
 =?utf-8?B?L0w1dkRQdHF1bXl5dXRiVmgybmdIT2tVUFdnWmlCeHVPOVVlWXRhdGdCc084?=
 =?utf-8?B?aUV3S1pXWGF3eXZVbFZXT2VlaUVESDJveWtaSWM0NWFxY0tRa05pN3NvUEtH?=
 =?utf-8?B?SmxMcmtKZW1TWlI5WStLK3NhL3hUVkxzL1VTUWJkYlYrbWNjdk85T1ZMTkFY?=
 =?utf-8?B?Q0VRa2Z1b3JpT3I3SFRmVGxWcmt1bkFwTnBybHpKMWhhVDdyUnFFWXNXaWdV?=
 =?utf-8?B?WHo1S2ljR21ub3hyQko2ZExUWTV1clN2VFVycGV1MHNrZTdMbm5PNS9PbGxR?=
 =?utf-8?B?d3BpZm85QnIrZy9NMUM1QXBOb3k5dTdPcUVpb1VVcFk2U1ZJTUMxa1pqUy9k?=
 =?utf-8?B?S2N1d0ZBSTNXQzAva0NVRFNRUm9qWi9Tcm85Wk44ZGY1OXhtcHFTNnRXYXg2?=
 =?utf-8?B?eVA3dUxGNEtFZ0N6d2JLeThoYThIazJmWXRHNUxvRnNneHdqOHhDOTMzZzNR?=
 =?utf-8?B?K2Z2U2Q2V0RyLzNybHJRcytIRW9uQ3lUYXZuYy9jRzNkdXdQWTFsSHlZWHZ4?=
 =?utf-8?B?V1BSaU01V2hadDZTdm41NG5UdkFPTDYzMDhhenA2eWdVamdhZGVrc0twdUE2?=
 =?utf-8?B?ZTY4TklsWFVzNUFOdEJacXVHVU95eFF3L28zeTIyMFdHdmw4RDlDajJYaHk5?=
 =?utf-8?B?b055RFNZMTFvWTJ6UnRld2doN2FNam9qVjZHYzIyUFJXemMrMTVsaDFFYVpO?=
 =?utf-8?B?Y002YWZiNGM1U3grbFFvMENjL3ZHSHphUmtGaERKakhkdVFtbmpnSmNSTE01?=
 =?utf-8?B?Uzl6RTFmc1pmLzRBY0MwcGpRSUw2RVZXS3NXQTRQcEprTzFJek5TTk1HMzBY?=
 =?utf-8?B?N2xIR0hpL3FJSkl4UEIxMUFIak5CVWduYlRIZnp6amRVczFpQnB4eU9PVTYx?=
 =?utf-8?B?ZnpjeTd3UkovRHJIS1VXYk81K0VoVEpKTTVYTVAwWEV3UklmU1ROazM5REZh?=
 =?utf-8?B?cU1VVC9iN1dOeDVpN3lBZ0lYVVhDak80eDZxNWVaWWRLbndaVzZoMmxoU3Ux?=
 =?utf-8?B?Rmtvd1FvTzRpYi9sd0NYZXMyZWRLSkF6VTdYa3pWaERHRU1lSGdOY2grZWRL?=
 =?utf-8?B?dmVjSnMvWkpQRlpLVDRsR1ppUG4vSmFTQXFHamxObWR3RnNaM05DSXlOb3p1?=
 =?utf-8?B?S3lqZWNQMWZuaHdab3lnNVRid3R4VXIvRDYyQ1VOYktHM3lsMm5iaXVxVmgv?=
 =?utf-8?B?M1E5bXk3VUtYRkdlVm9mL3hIb3dKZHZSZXloSURBOEhjZzFBLzJNYVNWU25L?=
 =?utf-8?B?Yy9hZVhkVlh5UHpGN3NkbFFWRjRxMVp3R004bWYvMTFuelpZclV6cUYxVFBF?=
 =?utf-8?B?RGI4MjJpVnBFRmhsZGs4ZjJLNTFETldMQWxjV2xjZEhTTjJiT0ZicFVhVW9x?=
 =?utf-8?B?OHlqVnhvWU1GQ3hSeWZ5MHlscWlDblZGbXpCdzh3VThvcUtzWm9SWmhvbEs1?=
 =?utf-8?B?cVUzL1czdFFNeG40ZW5kaEo2aHpZOGZOdFZSNU9rZW9VL01VYURkakxQRUxx?=
 =?utf-8?B?cVFWZk1mQXdUc1dsbEdPRmxnNXZsYk15S3hGNDJ6YjJnQXFXc2ZGVlFTcllM?=
 =?utf-8?Q?fd0oj/gUjaeLlDUuOLNXBgWGydIUW8rOdKZOaK/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1f68d7-234f-4e94-d01e-08d8d98c3ea5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 12:52:44.3997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IvKPvK3Z/WMIlbMYYRC67yHKFxR9SgRlrUzfZ1sjcv29DV8igdhF15XoSaIhH1o30IUjiEn5tf6qUa9WrQvsd8mPCuZKzQL7EOd3qRTZJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4358
X-OriginatorOrg: citrix.com

On 25/02/2021 09:30, Jan Beulich wrote:
> --- a/xen/include/asm-x86/config.h
> +++ b/xen/include/asm-x86/config.h
> @@ -170,7 +170,11 @@ extern unsigned char boot_edid_info[128]
>   *    Guest-defined use.
>   *  0x00000000f5800000 - 0x00000000ffffffff [168MB,             PML4:0]
>   *    Read-only machine-to-phys translation table (GUEST ACCESSIBLE).
> - *  0x0000000100000000 - 0x00007fffffffffff [128TB-4GB,         PML4:0-255]
> + *  0x0000000100000000 - 0x000001ffffffffff [2TB-4GB,           PML4:0-3]
> + *    Unused / Reserved for future use.
> + *  0x0000020000000000 - 0x0000027fffffffff [512GB, 2^39 bytes, PML4:4]
> + *    Mirror of per-domain mappings (for argument translation area; also HVM).
> + *  0x0000028000000000 - 0x00007fffffffffff [125.5TB,           PML4:5-255]
>   *    Unused / Reserved for future use.
>   */
>  
> @@ -207,6 +211,8 @@ extern unsigned char boot_edid_info[128]
>  #define PERDOMAIN_SLOTS         3
>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>                                   (PERDOMAIN_SLOT_MBYTES << 20))
> +/* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
> +#define PERDOMAIN_ALT_VIRT_START PML4_ADDR(260 % 256)

4.

260 % 256 is pure obfuscation.

~Andrew

