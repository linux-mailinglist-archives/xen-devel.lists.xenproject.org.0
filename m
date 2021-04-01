Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B121F351590
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104519.199992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy4l-0002Zm-07; Thu, 01 Apr 2021 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104519.199992; Thu, 01 Apr 2021 14:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy4k-0002ZI-T1; Thu, 01 Apr 2021 14:13:34 +0000
Received: by outflank-mailman (input) for mailman id 104519;
 Thu, 01 Apr 2021 14:13:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRy4i-0002Yr-QP
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:13:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c1ce797-8b02-4a33-8acd-43dd9906a2c0;
 Thu, 01 Apr 2021 14:13:31 +0000 (UTC)
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
X-Inumbo-ID: 6c1ce797-8b02-4a33-8acd-43dd9906a2c0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617286411;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o/T2z5izFqeFlrvyG41eLfX0wa1j+CcD9qVBIetCGhU=;
  b=PMM/9qULSJLXaegPolR3YnsaFrDLdnVyET/O8umQ03sZpoq11ne48Zua
   NzS5rbYmhpFhtnmaH5SNkc+cYGp8PLsXAGDm0x3JWE9C35IqEIViKmVYV
   pqTiloKitU/M3hY5A2usfqqoPAHGnnepTlbpP2MMjlMcvntfDMTcUX2fi
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /CoToxVt0p7OtTS0rPh6usII05wPspnEpsBlHbkGudq8QpttU5WUCRQg73LK9KP97zHpok/J8n
 DLtetwJioIKjXuDV0FTAvsg7JJfkzDkeN5fD7TH1qsBvKchmKr7e+ABT4i7gaNlbj7L5yTJ3df
 hAHkGeJoQvqnC2Zb+0UlrF5lRmBpQwEKa5Lb5j4vsZ6ode5mzVW9/1GSFucKNG314HaSztwUJ8
 e4xHT1MC7y3rUF+axKQyoNiaij7gUoZ5AHsoccaJNGI37OtQyJS1PVGnvSJxoNbWTPCVpqJdHj
 BFw=
X-SBRS: 5.2
X-MesageID: 40704382
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1iQtd6myeJ146F07dg4LkW06YbPpDfOej2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW97LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm/m/TgkpX6bRkaQyM94A6Vgj+yrJL8GR6U3hAROgk/vYsK22
 7DjgD/++Gfo+i2oyWsrVP7wrZ3vJ/aytVFDNGRkcR9EFTRoyuheYgJYczmgBkbu+eqgWxa9O
 XkgxBlBMhr7mOUQ2fdm2qT5yDF8BIDr0Dv0kWZh3yLm72LeBsfB9BajYxUNjv1gnBQxO1U66
 5A02KHu5c/N3qp906Rlru4NWAeqmOOrXUviuIVhXBEOLFuE4N5loAD4FhTVK4JASOS0vFWLM
 BVEMre6PxKGGnqFkzxg28H+q3KYl0DWj2CQkQEp/WP1SlXkH1T3yIjtb0it0ZF25QnR5Ze4e
 PYdoxuibFVV8cTKZlwHeEbXKKMeyPwaCOJFFjXDUXsFakBNX6Ig5nr4I8t7OXvXJAT1pM9lL
 nITVswjx99R2veTem1mLFb+BHER2uwGR73zNtF2pR/srrgAJL2LCyqUjkV4oidisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXAWUCUfcSps0wVzu104L2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gFwVusXlP+nRjNS1LgckHy5vtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7AL6PqNL+mUCGuULzq0l5MBtUCUhYpJ/6VWlRmAMMO0ToNZIKu9CVf3FuzGKKTyUPCP/+IU
 p6nRBa6Ki3J5ufyWQJENS8KF+XiHMVuTasQ4oDnLaAoePoYIkxAJpjeKEZL3SLKzVF3SJR7E
 tTYg4NQUHSUhn0j7++sZASDObDM/9mgAmqJsZQgWnFtVqVoPwuQndzZU/tbeenxSIVAxZEjF
 x49KESxJCanyy0FGc5iOMkdGFXZH+vG7JABgSdbIBykrTmETsAC1uitHi/sVUea2Dq/0Idii
 jEITePcf/GOFZbp0tVy73n6l9ya2WbcX9hc3wSi/wOKU32/lJIlcObbKu61GWcLmEPxewQKx
 npSzofKAEG/aH86Del3BK5UVk2zJQnOeLQSIk5e7bIw3W3NcmjjqcdBcJZ+55jKfHjuuIGSv
 ikZgeQNT/0YtlZgjC9lzIAAm1ZuXMkmfTn1FnZ92C+xmc4GueXD1J8Rb0XSuvsplTMdrKt6t
 Fegt00t+frbTm0Rd6C1K3NbzlMbjnUunW7Suk0qZZS+YI+3YEDaKXzYH/t7jVg2h57EeLf0G
 U5a45/6KraOoBuc9cJEhgptWYBpZCqFg8TrgfyAuUCZlkjgH/QAsOR79Pz2M4SK3zEgDG1BE
 KW/CJc9crURiev1bYVDKQrPGRdAXJMnkhKzaend4fKDh+tePwG1F2mMmWleLs1ctnJJZwg6j
 J76cqPhemZam7R3x3RpyJyJuZr/3y8Sc2/RCKKFuggya33BX28xo+r6tW0ljH5VH+SbFkZn5
 RMcQgoVft44wNSxLEf42yVUaz4okUsjltY73VGrzfWq/abyVaeO1pHPw3fiohRRh9JPBGz/J
 z4zdQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40704382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I91Rn0jFh8q/Wkya5RImjHk7qrqSHqASu+s7FyDUKeIrzOJRx4NowxvwTx2RQmdpjUheIbuXMT18ymp5vxQTBVIcdtKX6z5gbGHcXnITTHFf4LmpjpmKmA7mBnLeJeGwg6aqyOxQrvLMVqZt6xfgqmT8Vhk4jn9KW0G67PCHYr1pYk8uPg390j6whX7olPFCLUMetaHwBm9h1NGiP1SUUuA01o9nJzWgxM1/gL/HYWx54ZED8HoWutVZ4joGqAj3iWCKd0jmBZ+Vri+hF0xXecj27Uv/2/g414GSkVgl2H64aU/j9q80zuSVZ7tDkO4VZNO7zyVNz6ISQVvP3Z48hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqXtbKToHbLI33LPAXGUP0ffz669ImFGlV5VdiPlG8I=;
 b=mLv4CCVsp41RiNePwSuUK6JvHZhWAk64yTaWFXfnxTNySHUAwkF7KkzD1LKEzKIJaQlwxCtVZIhMrPgzuQaN9KRhvzb38dxLYJMpQ+2RKZQ9tSrk5aGUZjkzTlikkvP77wQYADdupUvIhYLHb6TYmzr2QtLxnYTxzR4emnZKQ0dYPvv4+1NXYA3rtBa2K1pt4UAESMSqDGSv981Ahr8PSFimv9c22mf4m9Hw6IrTQu2sxmOQD81qJgKUaOpFAwVVGjRm22ANujgC9YkNQHihwEVAMgyBPEN6clAd6ra8d0UFHB0P5bvzhio3fpOSEZdaws4xbuy0MjA+KIyVwpoElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqXtbKToHbLI33LPAXGUP0ffz669ImFGlV5VdiPlG8I=;
 b=iLr5GOsmDPmk3uB21vRzwoqiF386lyLAMLAwSsqBpKahGGSTZzJ76qmg/z3YaX33iwVrsD8bVEAwvxVYPxbhEljMKT8KkL/d1nt8G/rF1pJNcVsbdMjsKoNsf8gOuwO49W3gF0KFWwy1wxthftvJi8g2Z25Td6FUDKfm5ehB/YM=
Date: Thu, 1 Apr 2021 16:13:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/CPUID: move some static masks into .init
Message-ID: <YGXU+/sr6+GZ6gQ/@Air-de-Roger>
References: <2e3dfe1a-bc8b-6774-ef7e-efb565343c52@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3dfe1a-bc8b-6774-ef7e-efb565343c52@suse.com>
X-ClientProxiedBy: MR2P264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446e2ad0-de9c-481d-7888-08d8f5184e53
X-MS-TrafficTypeDiagnostic: DM6PR03MB3915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB391564BAA2A3A936E655569D8F7B9@DM6PR03MB3915.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6YDHzyLQc4kLA5mYBFiaEHTEvfX3XoQJrh9iD3yvoYrip95SzkaXVR9j2crP3WM/lxS4oNr70qVcUXQAvg4duabNhJjQ97XiyQO6COjfJBvVbfV1/1daewTx8v9Il8CU/aoKHzTarRPsV92wjPFh3G/NzJPJaWU4rcDN7KhMdkIPqsUa5iyqvPvalcrES48kckVh7T7Qtw2Ifj8AYx7avqHc8SfRegrxd/OUHE1YRCZFU1rgCydOjB2WHS9TM/NpphDQ13qegV2RzEGN2DogC5lsAVlbdLrlLo/kuYa3rbbLH/W7VLErT4bHtX8HU80KNxejX+hClI982HbEkG0uN0+Qd+cIx40YBTAqMg/hGh5XQC6g7ZodX2a7z2g9INm4pcRchKEmyu5nRhyVkgiwjziUzJCGtMjADGWMZiAqu5+Sl9vMGR18cbgbIRGdrKMdPSTby0GRv/Ptlt5MS1iZJPE/QRENgPHUpFU9fCfFXSlTJbdB09/lLsDNnHdRwwTWJUZ7GTZco9fyQM5IcpEqOgD7U9kh1S8Z6c4AuFRTwnRqYRSk8o29kOKiuBqm3G99sgfc2y4c2rMUbCb+nP17wsSEOA50VI+ISusu5Bq4oQMqJxUHKdnSGp2/tyJEa0kunjOl+FXxtYnXPBjcxNw9U84EKHfP90npZse/GsEMNKLbksbuaLCFj4oWgI+t4Az
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(39860400002)(376002)(346002)(396003)(54906003)(16526019)(33716001)(8676002)(38100700001)(2906002)(316002)(8936002)(85182001)(5660300002)(66556008)(66476007)(6666004)(9686003)(956004)(86362001)(4744005)(26005)(186003)(6486002)(4326008)(478600001)(66946007)(6916009)(6496006)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnZpWnVFaU1rRnduQlZIUWRZdHlocU0rcTM1UllRTVE1K0pwWXMwdlUxWlk0?=
 =?utf-8?B?VUJxczRKK0Fmd2tVZFpwVlNRZ0w2OXlrSVZmbkZJM1AvYVJId2h1elIrQjNC?=
 =?utf-8?B?UEdhR3NYZTVvTEszZWlKOXlZVE5IakRmRmtudzd0ZlNUZnY1aGNBZ2lpM3F6?=
 =?utf-8?B?eVRMUVYyMmtySW45QSt2eTJBWDNkY2hEUE1HazNQSFgwdEtCZ2xoSHBXWWdq?=
 =?utf-8?B?V3VSWklpcnVFSDQ1MXBiNGM3RGdtSi9xZytlMkFBM2pReEpxNU5kMlFvUGZs?=
 =?utf-8?B?UVM0RXg3dVJtNC9wS0ZrQmxxOE52Vk1Id0pKVVZEUk5hTWcyMmxjaUNEV0hy?=
 =?utf-8?B?Q0VPbWNMaFlkZ25Gc2dyaDMzU2tYUjlONE9GSmplbGs5cmVST3dCWTAzNWxP?=
 =?utf-8?B?YXRJZGhhT3BuWGczU3Y4V2R6TTI5Q05OU2Jac0tHN3VHQmRHOTdJSWhJKzJG?=
 =?utf-8?B?WW9pNEZXZlhsS0V1b01MK1dDVStZYm5Mb3BTM1F4c3E4VThOdzV3WGptQmsz?=
 =?utf-8?B?YkhydTh4enQwQjR0MEpLWlB6dURmRXl2LytUM0N5VUFxRGc3UnY5Y2JRQk9a?=
 =?utf-8?B?Z0EySDlkNXExcGgvdHNJNzRaSTh3TVFpaTFsdkFqQmZqOC8xNEsrQVZGTGcv?=
 =?utf-8?B?YVRyQXJaYVNCWWhUKzdYbzNZbjdCSE80MVF2T2RYWlp0bTJRZnRLeTBJM2ds?=
 =?utf-8?B?bFJxNklrajVwd3E4Z0tBajJITU83RFEyWlhzemoyYTRuK1hQVURFZ09RekRU?=
 =?utf-8?B?b2JNS0lDcFF0Y3NFbzR2bjJNbHVWc2U0SFpNeWYyRW1rbjRaOStmN1lLVUFj?=
 =?utf-8?B?bVRiYUpOdHRmeDNXNU1NYmJORjM1dzJZRkl1cGdTcWh3YTVTRldkWTA2aTZK?=
 =?utf-8?B?SlJOdFFTWC9OUTdBNUhjZkVGUFlzTW52SmoxRFNUOTJKcERyOGxIRW10WmFF?=
 =?utf-8?B?RWFvRkV0eTAxSUJGNHIrR1BJcXFObkdFeXEzdStDaFJ3enNaeGJCSDBpL0hC?=
 =?utf-8?B?dUQ2dXdWRmZtbVR5OWViMWNYcEl4V2w2NXRBM0tUaEVRQ3RtY1I3eTE4d096?=
 =?utf-8?B?cEZQZHl0TmE3RmtsNk1qbnhHYTlBelk1WlV5SEdXV1RDZTVITWFObG5zUFY5?=
 =?utf-8?B?VHVEZ1BtMnlwQkt6MXJUUmhCaTZxTVk4VVVnVTRrR1NZdnBuVHAvY3h0ZjZF?=
 =?utf-8?B?d2cxMVpFOURwOGx4VnFEMytiQk0yUlc2L3pCMlZXN2psUnZUbVNWMGdvU1ZX?=
 =?utf-8?B?aUFEQXZ1OGxxR1VESnY5VlBTTlFyNHZJR2RRSHoyYlp4Zlo1VVNraUJKNTJ0?=
 =?utf-8?B?ZmhYY3BaaUxVUGxsbVNrbHVQZ2lMMHg3Mi8vdHdwOVFkTituUG9idFZqVThq?=
 =?utf-8?B?eXF1eURNRFhHek44RTkrY0plUUFwbWFRSkJ2SFZvU0RocUt1dkpHWVVBWG82?=
 =?utf-8?B?cFhFQWxOblhmNDBJU3dMbWROZHVCMGhUeFBvY3luTVpiQXNkWWlhdUtJWVhq?=
 =?utf-8?B?bzExK0tvdi83SUE0c0p4QVk1dGdPYkY0aUYrUC9SRkVZSGFJdi9yNmFLd0dV?=
 =?utf-8?B?aEdoTTZ0dkRPS1JQSjJ5WmJTa0hSaEl2TEtUaG1zYjFiODhkaGFwcW9pR3Bs?=
 =?utf-8?B?V3dOa3UxZE5VbDlmZS9EZEl5VG92U0VwUWpIWmYyMWhPRGFSV2NzT3dwWDZs?=
 =?utf-8?B?OStXUlRiNXQzTXM3NHlRK1d1b2drWEhmWFJPOFhVOEhPQkxVcTE2SEtHNndk?=
 =?utf-8?B?d1V3cnlKU1g0ZEtNNWlYSzFRcEpzUllzUm5IaUhpa1pYTnZZcm9qWEVpSng3?=
 =?utf-8?B?UFVNWTcxZXRVNUtoM2IrZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446e2ad0-de9c-481d-7888-08d8f5184e53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:13:21.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0RVUtY4ikaS+HQq1RpMMjPBW3mtoYz0N+XRNaOlDeeiWrZit1Pn2ts4OVSxaq3zdDJbY7bnC9Pym5b5JvQf5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3915
X-OriginatorOrg: citrix.com

On Wed, Jul 15, 2020 at 09:45:47AM +0200, Jan Beulich wrote:
> Except for hvm_shadow_max_featuremask and deep_features they're
> referenced by __init functions only.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

AFAICT those are still only used by __init functions:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

And making those non-init when required is trivial.

Thanks, Roger.

