Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CEC706EEF
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 19:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535992.834103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzKVk-0000KV-Uv; Wed, 17 May 2023 17:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535992.834103; Wed, 17 May 2023 17:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzKVk-0000HX-R8; Wed, 17 May 2023 17:00:24 +0000
Received: by outflank-mailman (input) for mailman id 535992;
 Wed, 17 May 2023 17:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcLS=BG=citrix.com=prvs=494da41bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pzKVj-0000HR-P6
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 17:00:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c827f59-f4d4-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 19:00:19 +0200 (CEST)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2023 13:00:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5023.namprd03.prod.outlook.com (2603:10b6:208:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 17:00:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 17:00:10 +0000
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
X-Inumbo-ID: 4c827f59-f4d4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684342819;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eek2rsjzxCj1TFBA7MzdZHWj9gyc/pz95niKeU1b1Fo=;
  b=SwrVecmd7vovUC7f5VsGUQUizAunFrjz0ctQsX6mAPowXOPai9gwnJzm
   T1+XzkTI8HMIuqQd8yiZUX18JkNQTycQVUfgMLILmkpCzY1Rw8kkM8Pk/
   7UQd285h0Z6ZyNf227JfXPoZbVxPXX9vjtjz7BuDD7kPu6xLtignTEQ2z
   c=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 109286004
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RNTLAa1OId5kK5ow4fbD5VFwkn2cJEfYwER7XKvMYLTBsI5bpzQCy
 WYXDW7TMvfYZTT3e94kPoWz8U8P6pfVm9BlSgFkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPHt05
 6BEIyo2TRWM3+Op0ZWKQPVQv5F2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Kkl0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjCdhCSuXgqpaGhnXO2kwXUyNOTWeLnvbig2j9XpVtN
 0g9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+WsDezNC49PWIEIygeQmMt3d7np40iiwPVefxqGqW1k97dFCn5x
 naBqy1Wr78el9IR3qO3u1XOmSuxp4PhRxQwoA7QWwqN/g5/IYKoeYGswVza9upbapaUSEGbu
 3oJkNTY6/oBZaxhjwSISeQJWbS2vfCMNWWAhUY1RsdwsTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiONLKivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:fwOETKu0Uu2nLK6MNVd64aeZ7skCa4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MArhHO1OkO4s1NCZLXTbUQqTXftfBO7ZrwEIdBeOldK1uZ
 0QFpSWTeeAdmSS7vyKnjVQcexB/DDvysnB64bjJjVWPHlXgslbnnhE422gYylLrWd9dPwE/d
 anl6h6T23KQwVqUi33PAhMYwCFzOe75q7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3di0Kov6m
 /Mli3+/+GGv+ugwhHR+mfP59AO8eGRhudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWC+Usni9
 7FpjYnJoBW52nKdm+4jBPx003L0Soo6VXl1ViE6EGT7PDRdXYfMY5slIhZehzW5w4Ju8x96r
 tC2ya8u4BMBR3NsSzh75yQPisa3HackD4Hq6o+nnZfWYwRZPt4qpEexlpcFNMlEDjh4I4qPe
 FyBIX35epQc3mdc3fF11Mfi+CEbzAWJFOrU0ICssua33x/m2149VIRwIglknIJ5PsGOu55zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIHz8fZt3e07lmtrS2vEY9euqcJsHwN8Zg5
 LaSm5VsmY0ZgbHFdCO5ptW6RrAKV/NHAgF8vsupaSRh4eMAYYCaUa4ORQTeoqb0rsi6/TgKr
 WO0Mk8OY6lEYPscbw5qzEWFaMib0X2a/dlyerTa2j+0/4jFbeaxtAzUMyjUoYFQgxUE1/XMz
 8kYAXZAvlmwwSCZkLY6SKhLk8FPHaPsq5NLA==
X-Talos-CUID: 9a23:7PR6A2NjlxbECe5DZTNd5hJIEdoeUXjSlHbPMmiJA3pVcejA
X-Talos-MUID: 9a23:hmW1zArh7dnmMqjqpgYez2x+FMMz3fy2NHAyns4PnYqBch5sPx7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,282,1677560400"; 
   d="scan'208";a="109286004"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyI64KRT26G6xi7wckVUjBNgoY8M+ifJs6PoriYaHelupCgrFQ3JjA0lOgL6UAn+357Oa9IbRa8mAIEm5XS2URMDDgs8srDgYIMx5lZnwnPXZe1wp2H1IAF+giSTi8gCqppA6u4+gUeu2lao8fg7mLIikTzKNmvzngXIN9TuutWDWSCnBeGoi+44jIlhbCIIlS6reAY52FQ2rZj8JWm/rb/4/ErsOkaRxRzf6FglL06fmc5FbDAodBC4qreDuKKcvjGuA4xgazLrHO0ncaUuty2XK2A2vfliQn2D2cy00Tz9TrK2YkGnuYstZvEmswChGvvhT/WPH4eWbLa3QJei8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ8lkht6TdctiW6ejDjlY9EIEIwLigIUk3YY2jjGu5Q=;
 b=L0qxd37hAPl33dQH5S8t951kVx+pNM7Sz6b5wUMaS3U3GIC3T2YwvUJ/N6Fvh/bROZSe5sMo8w5Hc/kMiramv7to5SoXB9dj+vHT9llYPqskPuCDiZUl7k6Wt4b4HfnFbInNt1nlyEGQbhxOIbVAgvFqHnSuacyJf67iE1+SfJ5qrIl4ImdDzsFnnNWQ7H6AMb6kQdtwcpe7hnX6OXrp0N/M758KuwOWv3d7/SJ8i33+vOqICeIPRjtlxol1dbJvyW8yJr59r5U1fTNIZFegfk61k1EJG02qtwBSJzYFVtXw7MvTfTSiggc271Cf5WJn8wJ62aBpNl6cbTQt36yg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ8lkht6TdctiW6ejDjlY9EIEIwLigIUk3YY2jjGu5Q=;
 b=ouIjAkTmWxiA7zCqh8kN65tNviHQiCsjTh/nmdWGO8Gn1cPEM+Vzi4YPrchPo+++y9nL6noqcZh44bGcltDvrDRqownvYbaiIe89bBX1dvD1htWXQGictnegS5Yfk4D5o7MUU6KJWbzpI0wniJxDXrQD7q+6+JUD+Vj2tYU0y58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2308d1ef-4928-bb60-88b0-319ac3370a53@citrix.com>
Date: Wed, 17 May 2023 18:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] xen: Enable -Wwrite-strings
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516203428.1441365-1-andrew.cooper3@citrix.com>
 <796b6671-c699-1bbf-b3a7-59c8fceeb625@suse.com>
In-Reply-To: <796b6671-c699-1bbf-b3a7-59c8fceeb625@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0405.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbddd6d-655b-4ceb-ed61-08db56f82c32
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6psOM21LqUI52XvUj4wWn/aSxq2T0iz9lP8o3Kalbw+WCPR+RafczhIsn35nb0M20YKObUcIjXqiveN9vOpv+NfbQOyn/XqAZzsClQNtY6eglk592OnmWjFmMVjURBMfeLO3J0chhY62crtgn/YSX9EJNCdU9U5CQIHdZP8X1xH3ssDmlFE3N9wu4c9LpGcIGKZE9/Gzfu/jkjkKYwtSkaARU8bQlZSkEDL70+zuISasxc5SCu2xeJsc5IkzE29IM0t+k4816By+Ec3v26p58SKSiDHufHyjoVtEly/7SAwl52OaG9Uw0EgGOvsm/Q8g6zjKXWRpWtWw9NNngVNB4uJMslF6XWdbVvgkkxCFjRwPf+GKxPDolKyrZ0Q2XSp+i1NgpYqqeKIsnLU17RhLomtGn7lX+i9G2eBX7qWB2muQV2lJc4y0cliMFumUr71y7+283R/KMfM21kvQyDehScuGiUkN2oUZ7SBcm/4w6rFp7rwJ3xw9RaY+XemmTiNIoSS35/zx2rnE4spWKI6vCA+EIF8TC0OAzurSc2/bsFEZ2kmhPzKwP3hmXOHXSsWlIBFn0nspl/VqosZ1/zgvHPzY8ia3KkjAOOAJ75heVzp0v7BCmpwKe1PJIaqoacqVdGmqnErvL7nJV8a6KfgppA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(478600001)(86362001)(6486002)(31696002)(6666004)(82960400001)(2616005)(36756003)(316002)(6916009)(66476007)(66556008)(66946007)(4326008)(83380400001)(5660300002)(2906002)(31686004)(38100700002)(41300700001)(8936002)(8676002)(53546011)(26005)(6512007)(6506007)(186003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRTNXpRWXY1R0UwdlVzZS9xRDRkRyt3R2FGbWJ2Y1JGTFJBM0ZlakhvS0FG?=
 =?utf-8?B?N25GQmlXVG5RQWRHZTQ3Qmh3NUxkTTNEYUFqYmRMMmR0NFl0aUt4R0VGOWlZ?=
 =?utf-8?B?VHhHZlNFNmRac1dFWWFJMHV5WkxpQktXdWJ5QjZpb1JpVUNhUFc1Z2FTRUor?=
 =?utf-8?B?cW1Kc09XMnJ2VnpuQis5eS83dDB6K04ycVovUW5yR0ttb0ZXM3ptSlZueSs0?=
 =?utf-8?B?bXhYQit6TTNaNjA0VC9MbDhkRUhFUEk0RHFKeWpZSi9tK0xjenI4Q01RNGk2?=
 =?utf-8?B?NmM5cHlybW5hQ3Y4cTl6cWREK3crOEhWZ3BkZ0pmdWtBWStyYlBVckVmVitS?=
 =?utf-8?B?REVSM3pZYUg5N2lzZTFLYmlUL0tXRnFKM2J3MDBuOHl1a1BteVdVUTBWdlZG?=
 =?utf-8?B?ZDFGTk9OUXE0MUUxY0dEbW9iTTVQT0pCVDRpL215SnlhaVpCQkl5WWJtQUdu?=
 =?utf-8?B?UE9JVEZ6L3hQOTl0ckhpRWU4YXhpdzdIYlY1RFdsTFhtcGlDc0NGYnRXdUwv?=
 =?utf-8?B?a0RFNjFYaXZqSk9xQ3FrYlNwWlFhRGw3eGFtb1I3TVdjOC9jUTZiTlFCcnhH?=
 =?utf-8?B?UW0wU3owV0E0NzY2N1F1Vlo5Z29qeVQya1Z2bVlwTFVCSUhvSlMra1VBdlE1?=
 =?utf-8?B?ZVhZZThxb0Q0NWpaTjM4NGZueTJCNkFTYlZSaXVoSXNDaGROUmVyM0R3SlM2?=
 =?utf-8?B?OW02VnN6b24wVW5SV010NHJUY2ZCZUtkanFlVVhtRC9lVjJsa3AyV3VrOUVj?=
 =?utf-8?B?bUFmdStBTnluVG9nUWplMzROaUhldGpObnQwR2NQdmVwM3QzSlc0MllNcnJF?=
 =?utf-8?B?U0lVeU9naFdmYWloUGc1N2tuNVY1b3pvTkpJcUVBMDlTSlhwM3k5aEVsQW1F?=
 =?utf-8?B?d1dTSUg1S3Q4VzluNlphcTRObW01dSs4dHE2aWZrNjFEUUwzeTkzRVBjT09u?=
 =?utf-8?B?VGJPZWdMYnFwKzZiZ1pobnoxTnNsUWYxTk1Vd0RWYk5VK2k0dVNaY1pUR3pU?=
 =?utf-8?B?UGlINE1kUDBDMzZ2bXQrN0VwMkh3Uk5KVDJicDNlYWlzc0EzeGlMK0ZIMUxm?=
 =?utf-8?B?ZnE1T3NpRTIvZ004Qndyc2w2bCt1SURzejdwTlJ1VHRWMDZhdURTUHZmQnhO?=
 =?utf-8?B?NzI2OFVTaWcrSVVhZWpjdlE3Wmo3Vk1HMVFZeGJIZkxEYk00WHlieGF2eHF1?=
 =?utf-8?B?OEorRGxyZW1YWHBib2pxdjJrWTUwejlEaWtuV3d2aDA5SDQrZUFKWTB3L3JE?=
 =?utf-8?B?SWhLVWNEdGN0bmlBektUM1hNVUcxTkJnQUNlRVlDS0RWeERpeSs0ZTEzZnEv?=
 =?utf-8?B?VWxOYVB2UGdBMUxmSUxtek5pOXZ2bDFHa0RBb0ZMRTlrQUUrSzdYWVQzbzBy?=
 =?utf-8?B?elpKdVdjL25OM29jOFNKeWlqUWRZaXIzM25jWlRISTl3ZS92QWhGTXFsQ2pS?=
 =?utf-8?B?YlRSUlJpbVNZTFpDY2VuZktRTmVydTM0blkwQjZmQk0yYWJyU05ZaWdINDRU?=
 =?utf-8?B?ZFgvNjFLUXlNeDNKQ3NxSktqZGNVeDFRcXFlUWtpRXdmazBJMWdrS3I2NHh5?=
 =?utf-8?B?b3F1aFlDQ3B3TDQ5Sm5xSmh5dHpORjBmQXg4emluNHI2bHVYVWt3SG5hR1Uy?=
 =?utf-8?B?QWVjNldmRFFqaEN0emo1dDdDdDNraXIxRm42aW9WWFJHOTZtZ2Q1emdGWmI1?=
 =?utf-8?B?K3hYTWhDZUY3NnhZNmJmVE10cGhuUmdUcGEzQ2FpK0VYaE9hZVFNRnJsbG5B?=
 =?utf-8?B?L3IxelVwQnRwUlFUZFBRQjJWbVlnazhvR2lFMWIxUVBnVitQbnhuNWtYYTda?=
 =?utf-8?B?SXRtRFRoM0NLdlhHUzcvT25nWExwbUtRTW9uTUNpSnAyejZ5MFU1SUVnR3By?=
 =?utf-8?B?T1ZMeUtmQ2lWMGZkNWZOMkJMTXo3d3l0QjFjUGRlczBIaEZoN3pQOVZxS3BE?=
 =?utf-8?B?cmN2MENwWXZGWS80a2U5cVFLYzBydm1USXdYV0kvb2Zlam1wc1lJSGF2cTBM?=
 =?utf-8?B?ZVhLbTF1Y1A4cUhJUFdNRitCN0pqZkR6VEp6NVVGOE5SQW5VRFZPZy9xMmgv?=
 =?utf-8?B?N2s4YXVYS3IzdDl5akJQOFY5Y1hsdHpYS08xMUNxcXlsV0szVjVKaGRia0JG?=
 =?utf-8?B?TzBRUzBmMFFzeFpYUzZqRUhiL3VRbGo1NTNqNkJFZ0trUFk4b2V5N245OE1l?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MOQxL5r7SlxGa/dtbHoa5Gsnv4Iyg1DN9MblnApODyILp7OkjBdBy16i0fhSUTN7yS6tPyLfv1fYeyegJvu7SroxaGBhyMvs0kvt3pZEk9XBVDRO5RL53LoaprNdKb12V6CQMRNLESgk0RmEw9+08ppdVGuS+fbTxqeaP5jxbEkNJrCt1nlc40CkbaXgQRxsqXf8oghulGgC3Twk6+zYf6cTNSi300QGoEdZtL14UftGb/FU1NjeTu0g9EbbsAgmA7RlffgPsTVl8nSrd3fXGh6SPdio7B0Nr42l0nXE+4DTcQyHiEpZKfPbmka99mJG+RfiTSJ97GEsGlRijaSbwRP+W7YGzIHOubVKzzuFb1RXhYrUwdAIo1kTBItpd1DP2V7c3uLfEIR0P2iftMqGhM2Qiex70AiT5gXa/56CQ9xpH5Af6Tyc3o/kub3m/gt9PJLgEhkCTvgae93SFHRgRKTRJb7Ne8QYKLbGT5epDQPRw+XEFIqJhCn3TmaK5aokuYijWyrKabR62R6Qc4lUjYpk6iCYjdj1DZBbdIeiWmBMb/KJu9d8mRtoZQ3AdnrKQ8g0A0FUHsFmSjkCIuadkAMSXUpS/gUf/k0sHGIfdzHc7+oYGtCgZJl2gX14CKi16AgqtlB4ZpQrDIk4KJSFltP0HK48syiIVO1UT6YFXqOqQZdvIxktcWIl6wjUBeICR60bLfJLX8UMKT3OQPiZWD96Nmpw+4gkNQgWSYPP3BkTrcZgd9DGSWhyBoAkOwYXaaWNmLFb1WVQ3gszntCQ4HlzqNfl5NYq0TH2a7MCqOvtwvnQC6qGM5nqIJjAityYPok1Xanvu+FARZ50EdjNiaYrfx66vUgMBOgmM5gdih5UvHo2dWtQMN5W+MX4MTM3oVouSPeFNNROKh6Gx+etYg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbddd6d-655b-4ceb-ed61-08db56f82c32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:00:09.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN2YybOxMQoVKtEPORbuUOi2iJ8448oUWMDHqL2JFE39ZlH/+eK9iRQqcO27TxJJosgVo/IbsM5+pSIXIy/k1DNbUBFxX60jne5YodYF2+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5023

On 17/05/2023 11:34 am, Jan Beulich wrote:
> On 16.05.2023 22:34, Andrew Cooper wrote:
>> Following on from the MISRA discussions.
>>
>> On x86, most are trivial.  The two slightly suspect cases are __hvm_copy()
>> where constness is dependent on flags,
> But do we ever pass string literals into there? I certainly would
> like to avoid the explicit casts to get rid of the const there.

The thing which trips it up is the constness of the cmdline param in the
construct_dom0() calltree.  It may have been tied up in the constness
from cmdline_cook() - I wasn't paying that much attention.

Irrespective, from a conceptual point of view, we ought to be able to
use the copy_to_* helpers from a const source.

>> and kextra in __start_xen() which only
>> compiles because of laundering the pointer through strstr().
> The sole string literal there looks to be the empty string in
> cmdline_cook(), which could be easily replaced, I think:
>
> static char * __init cmdline_cook(char *p, const char *loader_name)
> {
>     static char __initdata empty[] = "";
>
>     p = p ? : empty;
>
> Yet of course only if we were unhappy with the strstr() side effect.

It's quite possible we can do something better here.  This logic looks
unnecessarily complicated and fragile.

>
>> The one case which I can't figure out how to fix is EFI:
>>
>>   In file included from arch/x86/efi/boot.c:700:
>>   arch/x86/efi/efi-boot.h: In function ‘efi_arch_handle_cmdline’:
>>   arch/x86/efi/efi-boot.h:327:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>     327 |         name.s = "xen";
>>         |                ^
>>   cc1: all warnings being treated as errors
>>
>> Why do we have something that looks like this ?
>>
>>   union string {
>>       CHAR16 *w;
>>       char *s;
>>       const char *cs;
>>   };
> Because that was the least clutter (at respective use sites) that I
> could think of at the time. Looks like you could simply assign to
> name.cs, now that we have that field (iirc it wasn't there originally).
> Of course that's then only papering over the issue.

Well yes.  If it's only this one, we could use the same initconst trick
and delete the cs field, but I suspect the fields existence means it
would cause problems elsewhere.

>
>> --- a/xen/include/acpi/actypes.h
>> +++ b/xen/include/acpi/actypes.h
>> @@ -281,7 +281,7 @@ typedef acpi_native_uint acpi_size;
>>   */
>>  typedef u32 acpi_status;	/* All ACPI Exceptions */
>>  typedef u32 acpi_name;		/* 4-byte ACPI name */
>> -typedef char *acpi_string;	/* Null terminated ASCII string */
>> +typedef const char *acpi_string;	/* Null terminated ASCII string */
>>  typedef void *acpi_handle;	/* Actually a ptr to a NS Node */
> For all present uses that we have this change looks okay, but changing
> this header leaves me a little uneasy. At the same time I have no
> better suggestion.

I was honestly tempted to purge this typedef with prejudice.  Hiding
indirection like this is nothing but an obfuscation technique.

~Andrew

