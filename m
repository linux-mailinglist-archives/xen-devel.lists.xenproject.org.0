Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A3B372B83
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122455.230972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvZg-0006l1-5g; Tue, 04 May 2021 13:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122455.230972; Tue, 04 May 2021 13:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvZg-0006ke-27; Tue, 04 May 2021 13:58:56 +0000
Received: by outflank-mailman (input) for mailman id 122455;
 Tue, 04 May 2021 13:58:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldvZe-0006kL-GQ
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:58:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f7020ea-6f57-46fa-9b49-1cc430135b6b;
 Tue, 04 May 2021 13:58:52 +0000 (UTC)
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
X-Inumbo-ID: 7f7020ea-6f57-46fa-9b49-1cc430135b6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620136732;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aZL1la4bbrFmxd//wXy67zwagwSlJbJ2J+P2+Z6HU/A=;
  b=E0U3gFUos5yCZSDaEXWW/mmB2iBe6QJNHuwrkX0nSMG4cjIIF/IRnHZR
   uayhCwuYDQKlgHOy0eeneg2s8ETX42RPV6ugpLiCcxSgFhXTVvAwBKdu7
   VOQXdFDQwVC2tI5y3WcZCUQrQgLVfczxvbm1LDppjOSELvcT1vWF94Aq1
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6MVjAA1YjfkEVLoVZyEvwLF1/HezSNNZ60kKdMOgMuFDUNXWNy90+6ync6TAHxbiMdwcStVP1L
 Y2320ZlqA5MfmazoXhT+4UQqjcBWWywzaSBczfzLYZDc/BlmU+GbrcsMPBLlpyGcE0xvclSY9N
 hNcHtMeA/46rLk5rOu+gZHDZMjy1ASTp5XxRdB8X15FKWsDhEdVuANarLR+TbCxubWxJ8Jd4KW
 F3+R4TSyNaUHyPN9rTMA/Wes6AmALW6XkPIviYsojSXaMgJMFEIQDe5GvWSps3lWJN+YIzf8n1
 MMo=
X-SBRS: 5.1
X-MesageID: 43035984
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gW+9EaqVKmjiPdUozaBuJqAaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43035984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOO+Kex2856NLz7hnem5QL1CObNFQkCGIGBQn+g8iB7CVuZr6VzaSTK+X09SGJgnurT0EUC74mBSoUk70ko4vbFW3UMAYiVY31r9N4+dQueuo46iRfpyXEkj8dYB4EH7tST1B7NEtgAURyw+4CeChnH5GA+0X9dXHxL9Glo9NMq22+Ka0eO73WMTnhIiuxZjsA9oOnrXG34UpFL+p5pFBPeHhL2CMkcT1xWNNYnCNGDHuWi2nN1dUSgPKDYg0jtdcwLzKBcw/tMyH+/H9pczGOWkhyB3ChGeG14MmrNjFT7A1+1mzxvNXs6lNIpmwWX22qSFNozjad7rr7beg8QMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHlfehM1RcCCAc87CiUpFZzXbYw4x2gaPLuBEf2UEn8=;
 b=VZMd9h0mVS3ZFocgQuMhyEe6PBgAXMKp80uSdN1nYHqUr6Kn97h7BK8MxmEHWNwKoRSr2ShFE5RWyutpSU38MrhdwkujYl8l5YzPduRSLDhq78Ivx8FBYHxPsah0g9dfB7MIBhsaFLe8+qG89jBW8SDbCPn2NY8gqpY1b/dAbxkj5Ss+r6zhn9w+F6w1Xo928EmOrnmD4zdLhBgqWe8bkbL9yEGsKSmNZeEK0dLl8X1d2tlFOOjCPevEKtAzmlRqvztVk2Cp8LG9gTcTSpj5/pj1rqOv+eFbH62bUuV+289+zHIfR8yWoWT0T05FI/6DpcqvC8oAL7nraAgg+eNFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHlfehM1RcCCAc87CiUpFZzXbYw4x2gaPLuBEf2UEn8=;
 b=DYUkqv5iRpo5ZPmzS+GnDK3AAd3bLDdKde59jRgvKxez/xR8/hfaC2PvrM/zr8sqZu9BwVJNjDojejrVObfAytxE5X9/XHga8T5qAtYfnUt0KHuwvhhg1RXTxGV1iu4WLeRkQKQqr/P+2aDPh6HwGaEOaXd8Kz8fEJqZXRNHGiY=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-5-andrew.cooper3@citrix.com>
 <17501fdd-b9f0-3493-7d0d-8c5333fafa45@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/cpuid: Simplify recalculate_xstate()
Message-ID: <3f9ae28f-2fb7-0f4f-511b-93ba74ec3aeb@citrix.com>
Date: Tue, 4 May 2021 14:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <17501fdd-b9f0-3493-7d0d-8c5333fafa45@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0201.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95fcebb9-f397-4408-fa00-08d90f04bdc4
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55347B4880C344CE03549DFEBA5A9@SJ0PR03MB5534.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QAoOQGFN7Gc8gL53+YsXXab0pMub0oycg86h69YdXageDliYKnCpol1kXk6JJWhyI98KzG4nqxFtVbYUCRPp263/8dMLF4212qUAtOAVvnArPaBgn53Z5a3Uckwn0nHTEWlFXg+EyNfg23wEJUOqnYyiRMGN60HS3bqhVzZd+Aj/w350BO3CmUsFNX3QqMWf3uxFocRQ7vnjZvRLZDlc2kNimU97sDHdNr9HWU4xgotCH2vPh+SIozL13n20RSyl/bAVeOz8I4SVvn7e11K3xU1i3K3WLjnDoYsHsba8VJMO7UkWjw+OmjPUma88vYBk+7jKlc4eLpQ5J9/JF9xZi8Z00PNPT1absUsYcsgi8zkF8hb3fjJzWRwQ+mBCCCWNhEuHnoj6wBF9DWTRJpBvPC8n2ePzFCg8RZf1CcuCHhq/vKCXWXZbql535FhSfXLV1k+BM7OEVVz81WKA3MFU9d0DsMx9nR50yiy+Wk/GvVVh6Gz8HQa3IRm0f5ASLbhg0w6HuF0POeqcscAhqL3DMK5IbTmtpMAvCzWUSQ6SdaATgtcCd6oGgiA7xVWjn9Q0s9YETZOpZJIEVDUJ80Gzl0M/R6O8rGOB9IFzQpgL0sShRUBHJeOKv9XQWwlFPn+Q3TnT38ZW7/YHFqMMhMTeLLmUGK6/7Gh1akRc14gz6tw8EHNf2nKuIWaZLF0m9Ud
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(38100700002)(83380400001)(26005)(2906002)(8676002)(86362001)(478600001)(36756003)(956004)(2616005)(6916009)(54906003)(31696002)(5660300002)(186003)(6486002)(66946007)(66476007)(66556008)(6666004)(16576012)(31686004)(316002)(8936002)(4326008)(16526019)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2RZWS9oTHM0ZFNzYjhNanA5UFFhOVU1bG5Hak0yUXJtY0ozUWJtcmlTS1Jr?=
 =?utf-8?B?TVNndC9LU2Rnc3IvMzZINVlZTzQ4OHhhZUpCMGc3bmh0dnl5RHVYNE1OSkZB?=
 =?utf-8?B?RitvTnVNMDNIWjlleVhPOVJkejMrTURBV2I5bTlXL0ZwT2JMQkVEMWpFZ3Vh?=
 =?utf-8?B?dTd4K3ZQQjQvZnpsN0VFMmxMSTNTb1V2c0JHYTJuSENIeXNta3BkNHZaUWIx?=
 =?utf-8?B?dG5YKzc4VFJNcVlDeVB2RWVPS3QyMGd0cXcxN3lSNFlRdTBSK3UrQU1TWGh1?=
 =?utf-8?B?dFczM21zQWhEZzdNTnVra0tmazhlbk5tRlAzVVlZR2lvbC83ZFI1TnU3RFpx?=
 =?utf-8?B?b2x5NlMxZkVvanp1bTVzQTN1S292dEJTVUNGYjFLQ1lWQlRqTzBjQ3NiSldX?=
 =?utf-8?B?S3UyRmltWnFMSDhhK1VIdmExRTRTVmNlUzNYc1Nsdkc5cHEzNmpHTFRTR1hj?=
 =?utf-8?B?MS9zeHR5RlVVdDZlQXFPNjJhWTk4U2RJNzdmdFNaWGF2Z3dHOERiR3E5QStZ?=
 =?utf-8?B?Z29JRm1EdUFmWVFMZGZjaEludGNaN0t6eHQvc2hzNHJaRzgyRkprUGd6UG4x?=
 =?utf-8?B?WmU2VUorQklsalROc0FPY2tVaWdSTzZXNFgxUFp6OVI3Y2ZiV2ZpNWVZUFU2?=
 =?utf-8?B?Rkh6WDVKMytZSC8zRnVDT3QyVkREQk9WRnhpVXhva0JmVlAra2pvVXNWNE9m?=
 =?utf-8?B?ZmVjSnlwdmlWZ211S09LZ1c1WjhEZ2x6NC9WR2ZZUGZtdDZaM2VFeWtkUk1D?=
 =?utf-8?B?YklNOTN0R1E2RXk5ZTNDSTBWNDFadEJMcjVLSTVZeGZzWUQyVnB6dk1sS2l4?=
 =?utf-8?B?TzNFOW5PSWMrN2V5TFJ0WWg2MVBHQWs5dVkzY3luZXVPSDhwY2pFdnBISXBK?=
 =?utf-8?B?aVBZWm1hRmNYSGZ6dDcwZDZLSm41VGpHZ3VXZUJMclE2UG9OYUVVbzhlNWFO?=
 =?utf-8?B?U21HOTZoRVhnTEx2Y1Vpd29GRUVxYmlhZEF2bS9WUjRqbThFZE1pNWVhWXZB?=
 =?utf-8?B?UVRjNTlBODNPRXNPakpPZXFEZFU2RmU2NVg5cTUyRm04RXNyR00xckx3dk1j?=
 =?utf-8?B?b3JFS0l6ZjhmZk1pa0YxbzdwU2N1QWlJVWtCMUo0QWZsR3VmK1d1dzdTS0FN?=
 =?utf-8?B?TnlUK1dlMVl0OVAybkVkanVhTXVESEJhTGErSzhObnZRdThacC9LcTVQMXdM?=
 =?utf-8?B?THlVNVJxclJQYmpvOEVFd056ZHlBTXpGZ1FaOENwVlM2amFzYitSSE0zOUNU?=
 =?utf-8?B?QlZoL3ExMEFDNVpOOWtUVkhiS0FhakFSdXVMQzlTZnllditYZGJPSk5IeEhx?=
 =?utf-8?B?cGtIZFR1OWI5RENENDhSZ2FzZXBCQjhNQlcrUGJjUUY0dXhyM0M0M1E4dEtC?=
 =?utf-8?B?WmdjVktHaXUxMjVIcUxKUHZFSmJnY3M5WUxoOVp1QUhLbVZjelhEV0VubGJp?=
 =?utf-8?B?UFlXbEw3L0hvOE1mM1ZCb2FWMFY0RVRiNjlqb1d5VDFZdkgrbkVFN01LeVVn?=
 =?utf-8?B?bnRONS9qYUVDZXZPUUdadlMzclJ3YU9FOUVlVjJsMmgvdUtGYkhoL2Q2RFVE?=
 =?utf-8?B?U09vWjRsMmlkMHZoZ1d6Z25pZkRCOVdIQThjTjFtTUwzUG5uNStCd3JzM3FD?=
 =?utf-8?B?czh0V1pLQUlKR0xPdThNbWVvY2NYbzBYNkpEdHZYa2JpMndWVy9HN01nSVUr?=
 =?utf-8?B?dHlDUE1qTXlneTE0K3hFTy9Renl1UGJDUVczQTVURUJQN3drQUtYSGIxK3V5?=
 =?utf-8?Q?0Jq+yyLqbMarUE7wwursCz5caHeKpnzna0TDelS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fcebb9-f397-4408-fa00-08d90f04bdc4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 13:58:48.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i78OzWjweZvroikYv3YgRzcrILd0fNAW46ow0Hh7XrbYDpU3o8Qj7mQHD4mMangYDMTV8DcJy9ZlkdQ62J+d+7TppJmbi0NZj/ycI3JhJW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5534
X-OriginatorOrg: citrix.com

On 04/05/2021 13:43, Jan Beulich wrote:
> On 03.05.2021 17:39, Andrew Cooper wrote:
>> Make use of the new xstate_uncompressed_size() helper rather than mainta=
ining
>> the running calculation while accumulating feature components.
>>
>> The rest of the CPUID data can come direct from the raw cpuid policy.  A=
ll
>> per-component data forms an ABI through the behaviour of the X{SAVE,RSTO=
R}*
>> instructions, and are constant.
>>
>> Use for_each_set_bit() rather than opencoding a slightly awkward version=
 of
>> it.  Mask the attributes in ecx down based on the visible features.  Thi=
s
>> isn't actually necessary for any components or attributes defined at the=
 time
>> of writing (up to AMX), but is added out of an abundance of caution.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> Using min() in for_each_set_bit() leads to awful code generation, as it
>> prohibits the optimiations for spotting that the bitmap is <=3D BITS_PER=
_LONG.
>> As p->xstate is long enough already, use a BUILD_BUG_ON() instead.
>> ---
>>  xen/arch/x86/cpuid.c | 52 +++++++++++++++++----------------------------=
-------
>>  1 file changed, 17 insertions(+), 35 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index 752bf244ea..c7f8388e5d 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -154,8 +154,7 @@ static void sanitise_featureset(uint32_t *fs)
>>  static void recalculate_xstate(struct cpuid_policy *p)
>>  {
>>      uint64_t xstates =3D XSTATE_FP_SSE;
>> -    uint32_t xstate_size =3D XSTATE_AREA_MIN_SIZE;
>> -    unsigned int i, Da1 =3D p->xstate.Da1;
>> +    unsigned int i, ecx_bits =3D 0, Da1 =3D p->xstate.Da1;
>> =20
>>      /*
>>       * The Da1 leaf is the only piece of information preserved in the c=
ommon
>> @@ -167,61 +166,44 @@ static void recalculate_xstate(struct cpuid_policy=
 *p)
>>          return;
>> =20
>>      if ( p->basic.avx )
>> -    {
>>          xstates |=3D X86_XCR0_YMM;
>> -        xstate_size =3D max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_YMM_POS] +
>> -                          xstate_sizes[X86_XCR0_YMM_POS]);
>> -    }
>> =20
>>      if ( p->feat.mpx )
>> -    {
>>          xstates |=3D X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>> -        xstate_size =3D max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
>> -                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
>> -    }
>> =20
>>      if ( p->feat.avx512f )
>> -    {
>>          xstates |=3D X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
>> -        xstate_size =3D max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
>> -                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
>> -    }
>> =20
>>      if ( p->feat.pku )
>> -    {
>>          xstates |=3D X86_XCR0_PKRU;
>> -        xstate_size =3D max(xstate_size,
>> -                          xstate_offsets[X86_XCR0_PKRU_POS] +
>> -                          xstate_sizes[X86_XCR0_PKRU_POS]);
>> -    }
>> =20
>> -    p->xstate.max_size  =3D  xstate_size;
>> +    /* Subleaf 0 */
>> +    p->xstate.max_size =3D
>> +        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
>>      p->xstate.xcr0_low  =3D  xstates & ~XSTATE_XSAVES_ONLY;
>>      p->xstate.xcr0_high =3D (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
>> =20
>> +    /* Subleaf 1 */
>>      p->xstate.Da1 =3D Da1;
>>      if ( p->xstate.xsaves )
>>      {
>> +        ecx_bits |=3D 3; /* Align64, XSS */
> Align64 is also needed for p->xstate.xsavec afaict. I'm not really
> convinced to tie one to the other either. I would rather think this
> is a per-state-component attribute independent of other features.
> Those state components could in turn have a dependency (like XSS
> ones on XSAVES).

There is no such thing as a system with xsavec !=3D xsaves (although there
does appear to be one line of AMD CPU with xsaves and not xgetbv1).

Through some (likely unintentional) coupling of data in CPUID, the
compressed dynamic size (CPUID.0xd[1].ebx) is required for xsavec, and
is strictly defined as XCR0|XSS, which forces xsaves into the mix.

In fact, an error with the spec is that userspace can calculate the
kernel's choice of MSR_XSS using CPUID data alone - there is not
currently an ambiguous combination of sizes of supervisor state
components.=C2=A0 This fact also makes XSAVEC suboptimal even for userspace
to use, because it is forced to allocate larger-than-necessary buffers.

In principle, we could ignore the coupling and support xsavec without
xsaves, but given that XSAVES is strictly more useful than XSAVEC, I'm
not sure it is worth trying to support.

>
> I'm also not happy at all to see you use a literal 3 here. We have
> a struct for this, after all.
>
>>          p->xstate.xss_low   =3D  xstates & XSTATE_XSAVES_ONLY;
>>          p->xstate.xss_high  =3D (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>      }
>> -    else
>> -        xstates &=3D ~XSTATE_XSAVES_ONLY;
>> =20
>> -    for ( i =3D 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
>> +    /* Subleafs 2+ */
>> +    xstates &=3D ~XSTATE_FP_SSE;
>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>> +    for_each_set_bit ( i, &xstates, 63 )
>>      {
>> -        uint64_t curr_xstate =3D 1ul << i;
>> -
>> -        if ( !(xstates & curr_xstate) )
>> -            continue;
>> -
>> -        p->xstate.comp[i].size   =3D xstate_sizes[i];
>> -        p->xstate.comp[i].offset =3D xstate_offsets[i];
>> -        p->xstate.comp[i].xss    =3D curr_xstate & XSTATE_XSAVES_ONLY;
>> -        p->xstate.comp[i].align  =3D curr_xstate & xstate_align;
>> +        /*
>> +         * Pass through size (eax) and offset (ebx) directly.  Visbilit=
y of
>> +         * attributes in ecx limited by visible features in Da1.
>> +         */
>> +        p->xstate.raw[i].a =3D raw_cpuid_policy.xstate.raw[i].a;
>> +        p->xstate.raw[i].b =3D raw_cpuid_policy.xstate.raw[i].b;
>> +        p->xstate.raw[i].c =3D raw_cpuid_policy.xstate.raw[i].c & ecx_b=
its;
> To me, going to raw[].{a,b,c,d} looks like a backwards move, to be
> honest. Both this and the literal 3 above make it harder to locate
> all the places that need changing if a new bit (like xfd) is to be
> added. It would be better if grep-ing for an existing field name
> (say "xss") would easily turn up all involved places.

It's specifically to reduce the number of areas needing editing when a
new state, and therefore the number of opportunities to screw things up.

As said in the commit message, I'm not even convinced that the ecx_bits
mask is necessary, as new attributes only come in with new behaviours of
new state components.

If we choose to skip the ecx masking, then this loop body becomes even
more simple.=C2=A0 Just p->xstate.raw[i] =3D raw_cpuid_policy.xstate.raw[i]=
.

Even if Intel do break with tradition, and retrofit new attributes into
existing subleafs, leaking them to guests won't cause anything to
explode (the bits are still reserved after all), and we can fix anything
necessary at that point.

~Andrew


