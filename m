Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B264B2393
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 11:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270303.464546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITNE-00017P-AM; Fri, 11 Feb 2022 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270303.464546; Fri, 11 Feb 2022 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITNE-00015Z-6r; Fri, 11 Feb 2022 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 270303;
 Fri, 11 Feb 2022 10:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nITNC-00015T-8K
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 10:41:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3828bfeb-8b27-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 11:41:52 +0100 (CET)
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
X-Inumbo-ID: 3828bfeb-8b27-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644576112;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9SBDqUXRraIhI70rhDQmUt5L2qOlgQOsw4XyafgKXf8=;
  b=K2X3mshZK9BhnOZ+mWFs/awgHmIHRF1040d9P8ozGHhyKY4c+9khJfRy
   xvXy2fY8KNv+MjTOr7P94BYoJY+w+hDPROaejbQ2MZYqtX4jNNJmwjZlY
   MbtwFT20U63wGF2N35NppQiddHkpfa1VhVj0lE3Rxf7/SUDt30Nl2IeEx
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zgDg91yGhUWKo/WSY2E9zXDvXXhrdB9+L0HySU7w7V8jAqTGVpzlfpUNaqSoNJnsbTsZHGNvP+
 XQmS9exfS4IbCm8jSDVGhdAKkUeb2FGmhBrL6Q1n5QBg56OVU9FHcUH+4KVbIdVHOiMRTwhkZJ
 uCNGygwU+BVKuMd9UxNOeiZbpGvPqt3Egx3njfJRVgeMNLBbwxe6Yzdy6iCIgjuAV8OvoVvqAg
 g23cOFwvHqotT+o3MXfm1O3JJFGcpBuGv9SjwKA/13EGg3B0n8vhyozOmVZh7+JEgLaOlpoMT/
 pZxmG//u/XuQy4hoKoM4/Q9P
X-SBRS: 5.1
X-MesageID: 66229629
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RDGVfa3Ti0PxIoHXbvbD5QF2kn2cJEfYwER7XKvMYLTBsI5bp2ABx
 mMdXG2CPffca2T2fowjYYi0p0wPvMSEnYBnS1NopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrdh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhoo1c0
 8tPs4OMawpyeYvPo+5MVzx8DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4EChmZu3JEm8fD2f
 5taRBdVcTb8QRh0HUYUAcwgtdf1iSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWF/VOfoBwaROZyHrZ9zgK2wPvQxiKGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb00qXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawRRGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyL+J90Pv2sjfR8B3iM4ldnBO
 h67VeR5vsE7AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3aZfUlUUFDbGWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ivVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:IhuT9KPJmkHAXMBcT1n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="66229629"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BS6x9Mq0xN/pR+9XGsqYDgX31BvmyMktVGmS8R6nmYY5J/es8qKH8jsqXsmCq5EWL8UvGx7rQp6xoPVSuSeIrN0QSLIMmyhB9XMmNzAX3P8Kg+at8IxirB+rGW+yLgxMTC6dAHjZi2cdyXTINy74XRqXYKAMXKF0ajOGtpYo9Rh0OTdKRHe4Z0+cMVgw2B+RWVrzUqw5nwNgzDOERDdspyzDEsGcOusgwvGZ49BJ8P/coKAhvijTKtY8BdgnVQIKpfDK1iTXOk7Vdj7Dax85uVQTIacVwD6WSRm9eYTkA6kYq6j/E/505NJLFelQKG/O3OmWudEDXqenqfuhHeGGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfSqR2dH8GqQfY9mYwIKStsHGShHmQ34UwiEZAaj4zU=;
 b=J2Oozk3OL2lfNPJPIe02XzFaY8KmOeZd0LFX/HJ6s6h1wOtLPx5OT+yNQjFHDbPzrEur0ub7HH6kcryiORdtof7rPySJADYR1OZPSbvbCHvDgl3cWPcGfBO3RBGW2rcKn/8Ruz6SbHgKEYNjcCn0M1eGPDkQ6LDgvQy2JRR4SIb2mu9kYsM4E/n6eSvtwn9DAFN4QHPw60CQZ02iyqFKJPJFtO6tP0IrLbiXbquSKQ0RIpY2HXo5BK+372NJqqNlHAU0zhyxU/qmXmmX8reb0zbrWolvAIsuj1lA60WxcbrjjIjYTQ6r7nlkS+hJFtkrsfdLiEgjdYsQEvlZ7Fp3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfSqR2dH8GqQfY9mYwIKStsHGShHmQ34UwiEZAaj4zU=;
 b=qn5UXVuMc3R/U2gNv0eysmiuJJA4ika/1RbS4fFgQAbUtRuJWSRBfDV/Qe2jp4kCV1d24ATVviMGl5VYGJAnB9onsBB1XgaWi9Gqc6cPt7qlAgBwm8fQNOHTI/j8JmANZiTKThgFl7Tz5klz8o/lV96scSQrZwQEcDEdv/4/tHE=
Date: Fri, 11 Feb 2022 11:41:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/Intel: skip PLATFORM_INFO reads on family 0xf
Message-ID: <YgY9YKlGZwV0QuwV@Air-de-Roger>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <6f56a75c-cd68-0dad-b1ef-a3421271ee47@suse.com>
 <YgYu+OoAovYmTg8E@Air-de-Roger>
 <b751bc52-7878-e1dc-9769-55328ef1abf7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b751bc52-7878-e1dc-9769-55328ef1abf7@suse.com>
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f6297f3-f8f8-4df4-fb70-08d9ed4b164e
X-MS-TrafficTypeDiagnostic: BN8PR03MB4692:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB46927A5663B0466BA9CD505F8F309@BN8PR03MB4692.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OFQRor/9JICzVIYQaoRg7Bht44rg79hMegTys+eEJ+wv0bdiR1nzP3n8DhSMJV46bqYvI0BX6Npy0QAQAcOLFK+BCgvgPBM8tQ4J4HjLDDTEfn2sMjputpl3Xf1VdqDpXVdleO8G0Uy6HUdVuAL5MWoUCk+FKEiIh85USyhmx1DzQJb6Y4yjJNxPpk0S/OdsUKE3/jvFBVPJs4NEPFXkGa00nbzqm5H4m3hghZ/rG1GVaFjIMKTTxvWvaZvIoELVW9mhynF/Ykbz3zi0YX165mKBN2RIipUEVknaq0ekllld2fxJipaxdoA2j1j8knUV1Iw+835/uPd9VSxDgo5EgoHJqTOnGkLURBAJZp8JU4/oRdoAZUVSr97XKQJeM/gKS0c8yTNWmu26cOr12peCdfHRw50x8UWfpHI9w5g8hSLF+XAcDBNjmU5h+DlKFZfBOa68mdZJogrHAwzpqosjWw47mOezM+AhzdsiMDHrXFV+94n2mCCT21Ioju9GQ/tCZlde4VmMh+bZHcMn65Tt//4Y8fVQDJw2xK0J6S2DnUDNjuMToK2G190JQnd4qa1xnBHad9DrvHCj8lAl6LkT3MdmLg21E+DqpGrZECIvpf74/YKnn1zVfbAiL0Qm5awk/lKfDkC7UVuf9Esc5KZpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(83380400001)(508600001)(6486002)(5660300002)(33716001)(85182001)(2906002)(186003)(8936002)(86362001)(66946007)(4326008)(66556008)(66476007)(316002)(8676002)(54906003)(38100700002)(82960400001)(9686003)(6512007)(6916009)(26005)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExWOXdTZEJiTWZ0WGNaZTY2cyt0VWpjeVVoUGR3Kzdra1Q3aFpreThRUDE0?=
 =?utf-8?B?YUFzU0VFcHVneEQ5Mkg0V1k0ZGRYc0g0ZnY2S05qVTNrSE9BNnNPejF1NFhi?=
 =?utf-8?B?ZWJlT1RPL3gybUVBdFJFYStDZHNqeDZQV2ovcnZVTllOYitYcDFKS2ZEWEtM?=
 =?utf-8?B?UGxLOC9lZ0szNGtsN3dyeFRPT2xVR0JtdndrWmJ3c09CWWxmU2x2NkNvRWVl?=
 =?utf-8?B?emMycUQzYnRuL2RBRW82cWI3c3M1RGNtTzhVbGNUYndPYmdhWTlENjNlSm1k?=
 =?utf-8?B?RzhRT3JFYVIzaWdGVjZ1dGlrMWVqaHllc0FPNERXTzZIenBVVVBMSXN4OTRr?=
 =?utf-8?B?K0ZncERSSmFkTU05U2NSUjdlRkpod1F1Q0N4eEIvd2Y5WGZsaWtsbXhyVVdO?=
 =?utf-8?B?TzBLUHlnOWw3SXZlRThHdkw3TSthT3VXSTU2QVhGYlZiTmV2akRCK0drTERZ?=
 =?utf-8?B?U3VpRXNKbkRheEF0RDZXOEJCVUVBYmV2cDd5emVYWC9TZnR2RDFOa2x5ZExz?=
 =?utf-8?B?WUpZTkpwenV3TFV0a3d5bWM0Wkhock4rY1BPY1QxZnlxeCthN2prakY3SUlH?=
 =?utf-8?B?dWxqYlZqSGhTdm1YcHNrN05FbmNBbTZHU3czOXk4K054dktLQ1NoTlBQZWFw?=
 =?utf-8?B?dm9FR01nbXlOdUl2RFdncGJTK0dMRUJqdGxiemJiZXRGL1BKRlFYd1owVzZ5?=
 =?utf-8?B?MC9uc3liSk5ZK0NFRXlreEdkSUFNSi9oSFc1RzMrc0F0MWFmSUtMZ2F6QVdq?=
 =?utf-8?B?Z0MxNHFHUG1qWXFLUThkckpjdjRINDJyNEdWdlpIcVFuNjBDOXJpamtzUjNI?=
 =?utf-8?B?SG9NMGpXY3dLUE91M2VuY1F1dWN1RFFSZTRZVUdveEdFY1NBcTIwbkd5eFdE?=
 =?utf-8?B?bVdvOGQxenJ1SG9rR3RjYU9yZnpLMnZmVmxpdEZ0Z0ljZXR2SnA4RWpNOFEr?=
 =?utf-8?B?YjB0UjVNS0RzNGJneEErR3E0MmNLRE1sS0QvbUN0VmlJcWN1SjJ1WFk2N1JB?=
 =?utf-8?B?d3JSRVlIcFZkeVJGa1o5NVZ0UXhuVEZ0MEZkb2tCRGRLWDRqNWprNEE4Q3BR?=
 =?utf-8?B?QjduNDQ4UWJndTQ1SlhsTHNFUktFdUxPWSt3RU1RTUN0MHBKNFlsQ05HR1JC?=
 =?utf-8?B?REdGeFZXbnFVcFpyaThSS2RQRWtnelhMY0wvSUM0K2xmdDlTUEk4bjZ4TDZl?=
 =?utf-8?B?c3N1ck1lMm1jeGx2OCt3UnNWa2c5VTNxTnFZRjBFSW01aFBvclZ6MkpYbDJV?=
 =?utf-8?B?QWErc2c3ZGRKV2VnTlNEekdUUnJRcm5NODZmNm1WNlVTZHpnWHR3NWw0UVNz?=
 =?utf-8?B?VVkwWTVzM0FubVBDdEFmaW5FeUJ4V3ZmaDJ5NlcyLzcvM2ozWi9sNEMrdEV5?=
 =?utf-8?B?RTZSbER0Y3Vld2I0WXRrSEhFYTZHazk4eXNvcUd2d0ZtSkRxWUFRN0FyZzRS?=
 =?utf-8?B?SGF4ZC9CS2dmN1FFU1d4anBxSlc3QWl4bGt2dGJsWndWMGJmRXNSUzlEOWVu?=
 =?utf-8?B?WUlJR3p5NktmdTQ3aURxN2tQSmpIRm54UERLbHloN1RYYXBXRGE1Z1p5SVor?=
 =?utf-8?B?U3RsN01KOENOV2ZjMjdkOTJORk4rWm9BY0VOZnB4ZFBMaTlqZERmR0h3QWhs?=
 =?utf-8?B?Qi9YY0N0OWNiQ283MWJaVDZUNC9FQWZ1VlVobGNIQmVvM1FXRmlxeXNRelZv?=
 =?utf-8?B?OGp4cWF4bTcxWXFMU0JJd0l1OGo3TzVLeHpER0I5dklQNDJOQ0htelF3VVlm?=
 =?utf-8?B?Vis5Mk1EUENWaFRSbzdra2VCbldpQ0FweTJIbldrYzF6N1dPaEJlKy9MS1dG?=
 =?utf-8?B?RXc1V3Z0aCsxU3JOdnp4STQ2UDJnNVR3dEJGcnJSRk5sb1BPV2pTeGE1RndF?=
 =?utf-8?B?Sm5JQ0FIZmVnNHUzRmQ1L0NHb0hpaUd6WGNTMW0vdTRYLzVoNWZqdGJaa3NB?=
 =?utf-8?B?WThIcTJ1Vkd5OFFoMVVGTHE0SXdHbWh0dEJndzlpNExyUDd4QWVuTXMvL2pJ?=
 =?utf-8?B?WHRqc2xoVzFpajI1WVRZRThUSUl4dFo2UURSRGRSejJOTVRabWtoekR2L1FB?=
 =?utf-8?B?MU52NzR1dEU3U0c0alFiYU1HNks4dGExdVN5aXRrUXdZQ3ZBaGQzekQ5TmJE?=
 =?utf-8?B?ZHgzbnNZbmxLSDhMRSsyVEVFTmU4Ri9tSFljMk8yOWFXalBNZ0s0ZklxMzkr?=
 =?utf-8?Q?HGYobBfJLCHuCTuhFKObkZ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6297f3-f8f8-4df4-fb70-08d9ed4b164e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 10:41:40.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l42SI1Q9NxHAvSYK5/e7wHdX3dfXt7Lj4oxV71LBLRhz61tJGuNZe5gnwMhGhvXJF9yHt4iSVjo6NdK8FMvuEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4692
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 10:59:10AM +0100, Jan Beulich wrote:
> On 11.02.2022 10:40, Roger Pau Monné wrote:
> > On Thu, Feb 10, 2022 at 03:55:52PM +0100, Jan Beulich wrote:
> >> This avoids unnecessary (and always somewhat scary) log messages for the
> >> recovered from #GP(0).
> > 
> > Could we maybe get rid of the #GP messages for cases like this where we
> > are explicitly probing for MSR presence? (ie: it's expected that we
> > can get a #GP)
> 
> This would mean some form of annotation of such RDMSR attempts (for
> the recovery code to recognize in order to skip the printk()). Not
> all rdmsr_safe() uses are, strictly speaking, probes, so I wouldn't
> want to put such in rdmsr_safe() itself.
> 
> In any event - quite a bit more work. Plus I'm not convinced it's a
> good idea to suppress any such log messages.
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> Perhaps even use "!= 6" in at least the CPUID-faulting family check?
> > 
> > Likely, or else you would also need to check for family 11 (Knights
> > Corner?) which doesn't seem to support PLATFORM_INFO either.
> 
> I don't think Xen is able to run on these (likewise for IA64, which
> iirc were surfacing as x86 model 7)? These are the co-processor ones,
> aren't they?

Right, Knights Corner uses a socket mount but it's still a
co-processor. It was Knights Landing the first one that could be used
as a host processor.

> My question was more towards whether we would (wrongly)
> exclude future processors when using != 6, if Intel decided to ever
> make new CPUs with a family other than 6.

In the case here I think we should only avoid the probe for family
0xf. Newer families (or even models on family 6 not supporting
PLATFORM_INFO) will just get a #GP message which is OK I think, we
could fix that in due time.

It's better to get a #GP message for probing than to just skip
detection of CPUID faulting on unknown newer families IMO.

Thanks, Roger.

