Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89141397A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 20:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191850.341970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSk83-0005t9-PL; Tue, 21 Sep 2021 18:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191850.341970; Tue, 21 Sep 2021 18:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSk83-0005rG-ML; Tue, 21 Sep 2021 18:04:27 +0000
Received: by outflank-mailman (input) for mailman id 191850;
 Tue, 21 Sep 2021 18:04:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjZ+=OL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSk82-0005rA-AJ
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 18:04:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a9ecd0c-1b06-11ec-b916-12813bfff9fa;
 Tue, 21 Sep 2021 18:04:25 +0000 (UTC)
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
X-Inumbo-ID: 5a9ecd0c-1b06-11ec-b916-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632247465;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HRt1v91/WQFroHXi/UO+MT+WBi8L4E38GL3fT0PiUvE=;
  b=CIfblkn35QomBLXt+izYJZqzGmkdA7aOPR01ClmhbNlD+ooO2CygTrFw
   m4a5sycOdbueo+WpgOGztVEgchdbGazcJVlEBZkA/fN5qaqSdPP9nDc8h
   jI11o1e49PAAJX9Mrk/4tSOsHqgNF6AzWN459ci9XZsIA7iAVuXQA+7jr
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: L9HRYVWMfxZAt2+3Hs869N6hTOeP0OfGrh7LAPonUgQMH4TK4UMFaZHYGJhHe7Ov8bQ/X+7aQj
 mpr+zd9yRdJSFY0uGhK4InFdnhR9MjL2szZzdeKEUagLMfcuEFfP1Be3W944NddrXP3jYZ6V0f
 L4t9Jdgm4lWtKWsnpN9fb9VYh2N/jIvO3dWQYk0WH1GGU5GgaqJZraJpPL01KOfi7EYk5OS+2I
 PD75UvNpWHKemi8q56oZnB2fn15DRk76XUfcRkUT0fLMtvzqg3+wxQFhlrGgJRuAgcsHnAasc2
 v/c73GX4X8H0n4eu4RXZgGln
X-SBRS: 5.1
X-MesageID: 53668010
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P4hVX672bECpINIowwIBuAxRtB3AchMFZxGqfqrLsTDasY5as4F+v
 mtMWW7SPqrbNzamf9l1Yd61/UgC65SDm99rTQZs/HtnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2Ncw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 vRu6bavDjYTJqzFuOkNdzN1PwVdMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTRqiAN
 5JAMVKDajzvRwFpZV0TD6scwua3gHnjSmZJ9GOs8P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8hxMLEQ90a88LLV6iaUFkwuYxJlS9Nz4afaWgcWO
 k+1c8LBXGI06uTFFy7Fr994vhvpZnNEdjZqiTssCFJfuoi9+tlbYgfnE447eJNZmOEZDt0ZL
 9qilyE4m7xbpsoCzazTEbvv0m/0+8ShouLY4GzqsoOZAuFRP9XNi2+AswGzARN8wGGxFALpg
 ZT8s5LChN3i9LnU/MB3fAnoIIxFGt7faGGM6bKQI3XR32v0oCPyFWyhyBp/OF1oIq45RNMdW
 2eK4Vk5zMYKZBOCNPYrC6rsW5VC5fWxTrzNC6GLBueil7AsLWdrCgk1PhXOt40s+WBx+ZwC1
 WCzK5f0USlCVvQ5k1JbhY41iNcW+8z3/kuKLbjTxBW7y7uOInmTTLYOKlyVae4lqqiDpW3oH
 xx3bqNmEj1TD7/zZDf564kWIQxYJHQ3H8mu+cdWavSCMkxtH2R4U63dxrYoeopEmaVJl7iXo
 iHhCxEAkFev12faLQiqa2x4bO+9V5hIsn9mbzcnOkyl2iZ/bN/3vrsfbZY+YZIu6PdnkaxvV
 /AAdsjZWqZPRz3L9i4zd574qIA+Jh2niRjXZ3iuYSQlfo4mTAvMo4e2cgzq/SgILyy2qcph/
 OHwilKFGcIOHl0wAtzXZfSjy0KKkUIcwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuZzQhhaEm3c4erkPCXW5DP+k4pJUeLOdjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vW+FpLXSx1MVSsrFAm+1CsgysV
 0PTotRXNN1l4i8+/IL98Ob9Utm+6A==
IronPort-HdrOrdr: A9a23:hi9E6qCrXayuaQTlHeg7sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGZXgslbnnZE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53668010"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP4IFygMV26Gz0PN/lDbwkmWBXKuiGAmwjNU3b379neUfzjtMzjWcHwaKiDWJLqVWorZs6FGcdLoTyRSZDPh5lo3Q1ohIUktUF864+rQRKHLJiWjLSmYqUuK5KE8JtaBoqmZYDwVSgOE+qAAW7vHr9AAiECkA1VNWStT9Cv03ccNj66HdbGMN7GA4I3kb8cRSDqC1zdkPa4u+8OuWQ3DcJ3ZQM1P87/3c+sM03FXkhU5kChl0UxyWdu/UYAMA7wQU6lho2n74fGnQLDmnxK9p1pR5XsRv7KzhDkTVfZtLUBOKyKN0YO7lR658YxWe8bMK3F0AAV5+wcrKjpBFvgqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pyvufv6Aa+O0JfFy11wVbUELWG4JkMJG89GlTmp0M3o=;
 b=c242c272fBYKEhoYOrbdQJo44Tc4Fa4Ab2M5wxYlM4eN5aAK+BqnhS3K70j0wiCQl8kEmTE2HPZCnuoy7LEotzTpGDWNOiax9k4akWt7PEMI8HAq+PFt8Ca5TnAYf1DVkC+N8TqsE1FRD1NvOJYr01wrVcsb3xuer0qlM+9u9JpW1C9i+KEd+sNkyZAE6IbHjGOKAnyUbte/SK0GXvbmEqbix+80q0xATGzhaFzWRuschFJ9ttge/PiFtrGW1IRlbX5CFe9dormjjr5YFkqYnkopR3bUhBvFohg3LjrmI8ufETGfUUFQYwibAxt/Gp59xMLwkPMzJ4gBWZWgFtFlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyvufv6Aa+O0JfFy11wVbUELWG4JkMJG89GlTmp0M3o=;
 b=vQQ995GRWVeReBu+a7SlEfYUOFyDJ3trA++YND2BUCU8vCKG+x5kWxkFuDgk6yRlBXwagDl3+aoDk5J/Nwkav/8Bm5BcCbX0n0bD0RexHeHiWGPryDcNNkTpS/JI+qR4BkYh2SbD7aB6xxQpa2Tm0KmTx3LvvhFndooAZQk0JDo=
Subject: Re: [PATCH v2 05/12] x86/hvm: Remove duplicate calls caused by
 tracing
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-6-andrew.cooper3@citrix.com>
 <45d5ba73-3099-9744-41f2-e3f53faed536@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c651b2ae-b664-c838-62eb-7d3609cdce68@citrix.com>
Date: Tue, 21 Sep 2021 19:04:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <45d5ba73-3099-9744-41f2-e3f53faed536@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0374.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9cc6523-7923-4509-a337-08d97d2a3d5f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB41657FD950806152B8E374D4BAA19@BYAPR03MB4165.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kB//dxsyheToMsTMrs6c9/LXNmgGMrnpecR7szNswEwFN4285aMeaHpDn7Lsno6kEivbgbu1wLA8/bBnk3V8xuZPR7OxjF8Z+Z0/bJYdNCPqJXdevStA08p6Vy7cHAmrjGg8JUZe6d8RC9YFruVLTaYC/e/i/q50/+FWdhg/tQej0q+ExZePMu8t0IRzKjmTlhEaxEmTxblm58jLhmUFJczCvjXEmOCXj1UmmP/tAvST/vR5jm+32TaLcIq5Q6nIEIWroRyJ3I8vDw594zWZQ9RtNZWiKr1tHORRlD5H/0AixmXQJNsVHkqAdiZ/9eYm3lJJ+JvjDYRayru3i49SYEeejgABi0EID1AopDHsJJ23TfKfD453yJgdhLLbfw8+jIfSvwkpQuIZy5Jt2PwlZAQ6ZnLaiddASeLkxHzfCE7xilEBJ0dh03K1Vx3NVBWD3YJOzSionczd8mMPQlWmK3fja76jwKRC5WPZmQyHnHL4Fgroxl1Tvmn6MmNTkaEZW9kT6kuq8FLAz/tfI5mL6qx3QMLjYS4Pq1XDh/7O/GgBKuOt1pQnw8vWRWGMSQTXPMrfhheG+hZW+UoixDYQ7RPrqTpZf0lz76a8U+2vy1GYOUQUfVT+tjec4wtgeGn5Ssybcf8Dk93XTcwqdWrm+nPea0UtK2azBE5cyEhWGPHY7N0jhXcPvjiJCjxNVFzwb8vLCOEsJOQZy6WV0mn9ODN8TMaYtnS/2BxitNtqng0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(86362001)(31696002)(316002)(38100700002)(53546011)(66476007)(508600001)(66556008)(66946007)(36756003)(6916009)(4326008)(55236004)(16576012)(956004)(2616005)(6486002)(5660300002)(54906003)(26005)(2906002)(6666004)(31686004)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVPUG5ZWE1IV0JhcmVIVW45MUpTYlB2NE1FZ1hBY3FjUjlUYVlHRnNKWVNI?=
 =?utf-8?B?V1NPbU5OM1MyS0t3RG5SMzhGMXVPcGtRWmE5THdGN1lpcFFEZU5IdGVKM0hx?=
 =?utf-8?B?QWdIVEs5T3F1akpiWFVNbUxsdHVRbGt3SnNHTTJlYkNaTkNYekoxenlNMUVP?=
 =?utf-8?B?TTdGb0N2UGJkNVlZWGsvVWpNckI1dk5RWkNEN0FsSmJkcFIrNTBmbGpBQTAy?=
 =?utf-8?B?S0t4bkVyZ25RR0NQZzVLQ01sZUNYNmlTTnRGbW11RXg5cnVkK1M2eEQxWCtC?=
 =?utf-8?B?Wk5VVFFUa0lJeHdGYThySXc2TDE2bkZicUpBcWJOclcwUmNUa3FyUWN6K3VR?=
 =?utf-8?B?NmxaTFRTb2Q5Sm4wM2owajY0TzkyZklCY2pXdUliVnBqSjNnSFhGNHNIckFi?=
 =?utf-8?B?T05iSTNKSWRVajdMbjYxSWVDaEhoUzI0SHQrenRxbHZLUFprdFYwQ2Q1UFlG?=
 =?utf-8?B?ZzU0NGkzYk1ZUC9lYTFtVHRSN1Z1MnRkd1JNK3pjQmRILzJHK3JZem5EVVor?=
 =?utf-8?B?cENCM0UyK2lxdGFtL1lRNHlORCtwRTNIUU5FakM1eEpWUEYvWkYySGtJQldi?=
 =?utf-8?B?SlgyZFEyR1lvQWxRREJnL2NXbWVjeTB2UFJpMHVQVnlVeHV2MWpnVk1rWnUr?=
 =?utf-8?B?eG9uZXY3SHVkek1FTHVFQ01mZjZmVnZzREs0eFNkMjBENE1BdXAwR3BkZDZG?=
 =?utf-8?B?YzFncElsQnBqTXBDWkxRQ2Z1MXlCWXp0MDcxTnRXUDJGdkU2R0RFZmxuOTBQ?=
 =?utf-8?B?TnQ1S2pLZjVJd3JoZW0zdUEvd29PbzY2MWpTdEdpSlYzUVUvYVdrOUtOeG91?=
 =?utf-8?B?QWNRQVlpM0tFL1doUzFZSVd0S0FQdld3UUU1dG9rT1ZyeFE0SjYwaU5zWEtN?=
 =?utf-8?B?UklaTVM4V0lsWEZ6a3Zsd1I3UmpzZldDU2w4VWhBclgyZU9pa2VJd0NrNExS?=
 =?utf-8?B?d245NmwxNU9qUWI2RU03d2ZHR20zcDdLbjdmWDdRdzZmYnFjNUtkamtudHJD?=
 =?utf-8?B?V21jQlk2VVJURk5CMXk3ZnBvdGZGejBHTldDRHNoT05tc0dVVk1iMDF3QVQ4?=
 =?utf-8?B?V0ZOODN4LzlPSUprZXFuR1RqMy9YYU9WWFlQOW9wait5SkFCaG9tZTREc01T?=
 =?utf-8?B?WW9vWW93SnpWZTBXaHMzREdIdmxwRzFaRjdBRlREdVVROXB1ZHBxcW10alFz?=
 =?utf-8?B?OVMxZlREdDhQUUZ4TTAyV2lScFQxODhJQS84ZmkwbEpyRjdnTHZmTzFpdVI3?=
 =?utf-8?B?Z1ZmYytPejdybFdmSktrSWRFMWNQKzVVcitiQlc2OVpubjkzclUyUWlXazUw?=
 =?utf-8?B?U1cvTVQ2aVVlRSs3bmoza2dsWnl5MEppLzRZak41a0EzbWZBbGNqY1QrVjRl?=
 =?utf-8?B?WVhjRzdoU0tVY0pwbkQrRmlVY3duMFE0cmNuMWFFQ21nRGdBUDAxeU5nR3lo?=
 =?utf-8?B?cVpsME1FMXZ6NUZhd2Q3K2NUS2pabjVDWFplR2tzMWRjMUdqVlplZkpLdFU2?=
 =?utf-8?B?aGtmcnZuejhPTnVScjJYTVhnSjRNaGU2ZEZHYzEyVDVNcEMrNFcvVEU2THpM?=
 =?utf-8?B?STBYdjdtWnRHMElQWHNhSWxkMUc1eVZGMEwwUk1vODdWYVNnY2QyMEZqRWd1?=
 =?utf-8?B?cXRObU5MK1lUZDNGOW4rdTMwamRHK09WeU5KV1ovMllGaWYrYXp1WXBjVXh2?=
 =?utf-8?B?TlZXbVdGMWNZTW01YUZ5SGZjREpFNkZRNmpmd0FKd0F1UnFkbGpqQi82ZDN4?=
 =?utf-8?Q?HuC1ImRuwFhcW9ZOE1EdWpf/erdwRVpG5LKRFwq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cc6523-7923-4509-a337-08d97d2a3d5f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 18:04:22.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqiSJW2C/nB2Z9TVtQzgEelWPxbKBFZwW3iyAKJg1bJUHbpuWnVeL7rLfGj8XmgS7S7AZCXgyqp3cRAINYmyHmCiIuPsXsAg1VYpZ9esGJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4165
X-OriginatorOrg: citrix.com

On 21/09/2021 13:18, Jan Beulich wrote:
> On 20.09.2021 19:25, Andrew Cooper wrote:
>> 1) vpic_ack_pending_irq() calls vlapic_accept_pic_intr() twice, once in the
>>    TRACE_2D() instantiation and once "for real".  Make the call only once.
>>
>> 2) vlapic_accept_pic_intr() similarly calls __vlapic_accept_pic_intr() twice,
>>    although this is more complicated to disentangle.
>>
>>    v cannot be NULL because it has already been dereferenced in the function,
>>    causing the ternary expression to always call __vlapic_accept_pic_intr().
>>    However, the return expression of the function takes care to skip the call
>>    if this vCPU isn't the PIC target.  As __vlapic_accept_pic_intr() is far
>>    from trivial, make the TRACE_2D() semantics match the return semantics by
>>    only calling __vlapic_accept_pic_intr() when the vCPU is the PIC target.
>>
>> 3) hpet_set_timer() duplicates calls to hpet_tick_to_ns().  Pull the logic out
>>    which simplifies both the TRACE and create_periodic_time() calls.
>>
>> 4) lapic_rearm() makes multiple calls to vlapic_lvtt_period().  Pull it out
>>    into a local variable.
>>
>> vlapic_accept_pic_intr() is called on every VMEntry, so this is a reduction in
>> VMEntry complexity across the board.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/hvm/vpic.c
>> +++ b/xen/arch/x86/hvm/vpic.c
>> @@ -512,14 +512,15 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
>>  
>>  int vpic_ack_pending_irq(struct vcpu *v)
>>  {
>> -    int irq;
>> +    int irq, accept;
> Strictly speaking "accept" wants to be bool, and ...
>
>>      struct hvm_hw_vpic *vpic = &v->domain->arch.hvm.vpic[0];
>>  
>>      ASSERT(has_vpic(v->domain));
>>  
>> -    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, vlapic_accept_pic_intr(v),
>> -             vpic->int_output);
>> -    if ( !vlapic_accept_pic_intr(v) || !vpic->int_output )
>> +    accept = vlapic_accept_pic_intr(v);
> ... vlapic_accept_pic_intr() would eventually also want to be
> converted to return bool.

Yeah, but given the potential for backport here, I specifically avoided
unrelated changed.  We've got loads of functions wanting to change to bool.

~Andrew

