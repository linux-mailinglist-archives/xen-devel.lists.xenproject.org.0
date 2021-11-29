Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECA461CC0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 18:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234785.407432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkV8-0001zD-4n; Mon, 29 Nov 2021 17:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234785.407432; Mon, 29 Nov 2021 17:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkV8-0001xF-1c; Mon, 29 Nov 2021 17:31:38 +0000
Received: by outflank-mailman (input) for mailman id 234785;
 Mon, 29 Nov 2021 17:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrkV6-0001x9-Mf
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 17:31:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 324924ce-513a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 18:31:35 +0100 (CET)
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
X-Inumbo-ID: 324924ce-513a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638207095;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bh2oLnyUD2hYXm6BLhEb/7ManCAKZM5/xuF/bUALGS4=;
  b=D1iJO/gqnXAWdymIeSjEorREO2I6sUTmbVzTl8EvRcEP7EydpUS6pQQP
   aDZLPwfjYzhDlKokPNgEF3b63R4kjEJXes8qSSci/y3RFI7ALhHdacaY4
   kI9nHKHIzXy3+tP28F5bXD/TTQG80fvFfmEgG9BU2ivX2HeZ1VuxvLYAq
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ef4gBSJ4CizeDOYr9GbQ1a1r/j8ZZ+7qPY9SQfV265TLvneB8/RuI1BlZOeNMCEPSsshZ9ypU7
 W42UAk/n7Yu7EkmVt0uxVSoRNzVGVMUZTRRb6jly+dQ0sNfI8W85OY5vWAa3dQo2LfCdTopK+V
 YuztxNji1ZV2JFLR+REGbcfpOsyfAq/7HIW1axNhLZk3t0Nm7VVmCK681bV237DjfIv4sUTJ98
 givBVHwUf8ZBqRZq7v7oPkgZlSqiA1fy5iCuP9DSJub3Gy69+RtBFPfLg8vbBovoWES+vg9ZZ0
 +1I1BGqGZBS0SjK1wy9JmDc1
X-SBRS: 5.1
X-MesageID: 58787563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yjq3fq/iL3G6yRnIbRgFDrUDe3mTJUtcMsCJ2f8bNWPcYEJGY0x3n
 DBOWziHP/qKZWb1L991aYrn8k1QscPSz9NlGgs5+C48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh92
 uwclZqXUzxyfYrlxOc2aSAbFyhHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFjGhg2Z0QRp4yY
 eIibWQxLwnpPSYMFXdPMKsQsbv212XWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkeHp
 ErW8mLhGBYYOdeDjz2f/RqEhOXCgCf6U4I6D6Cj+7hhh1j77mYXEwNQXF2npv+RhUu3WtYZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTB9iey1T1WHzezXihruOgMvFCwGbBZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2OBjr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hK0yT9Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510lvi5T4i6DKuNPoYmjn1NmOmvpnsGiam4hT6FraTRuftnZ
 cfznTiEUB729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5nel8Jtc7xvsNzY8lP
 BiVAydl9bY2vlWeQS2iYXF/crL/G5F5qHMwJys3Oli0nXMkZO6SAG03LvPbpJErq75uy+BaV
 f4Ad5nSC/hDUG2fqT8ccYP8vMppcxHy3VCCOC+sYT4eeZ98RlOWpo+4L1W3rCReXDCqscYeo
 qG70l+JS5Q0WAk/Xt3db+iizg3tsCFFyv5yRUbBPvJaZF7orNpxMyX0g/Jue5MMJBzPyyG0z
 QGTBRtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQDTqm9r+ja
 ONZy+DHHMcGxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLiEZJHlHVoWKFZ3Z+iPz6hJyDzb7PBzK0Tm/i5nurGAVBwKbRWLjSVcKppzMZ8kn
 rh96JJHtVTnh0p4KMuCgwBV63+Ify4JXKgQv50HBJPm11gwwVZYbJ2AUiL77fljsTmX3pXG9
 tNMuJf/ug==
IronPort-HdrOrdr: A9a23:OZhkbKkVVDdO4VvPSWTujuwUjJnpDfPKimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOdOEYbmIK/PoSgjPIa+rIqePvmMvD6Ja8vhUdPT2CKZsQlDuRYjzrbHGeLzM2fKbReq
 Dsgfau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58787563"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyOcw6io0S10oFYvubONMNhKx9gl2mYA2PGPwR9QWXauF/hKIVtbe2ihRwVjJc3Cdd0A+bQDaLGGpOiMMc/2RqYcVMV6r05NmTxGlDpLAXT6hhSXMwKPfA2+fVPxs0A3kRCru+719iqgSxSWUUOQ/EyBQ069WfedglhViAChnrbZjhkA8Y/MpIddOtSGeqdpxuf7FcVTJPcQzpbYFTa+vyf3hyg+LexmMA3clHIUMloLCgxKbCmJ6Z6X5Y+7/Osl4ilG5yrPNh6u9sqJKNoe/5C91pH0/5hF7niuybRlFyOsOmzdouC9bWX4Eya6I5haFGackhyM9KbIFKdCd6J4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh2oLnyUD2hYXm6BLhEb/7ManCAKZM5/xuF/bUALGS4=;
 b=ndCiKOkB+zg9PRQCR4UAzrdT0FLgdqjFGAxZYlEtx7xwHNiwfQRm0HPSsS/d15ylMgU5+gwmzQR7zV4n7JgxQZ6FeTSR1tvuV7dgjkLz/IElwIo4otEitqKz9zvRz+ZwVssDBtWliCeYugBPgKPBVWHE4p8mkUYcIDmAm9uZx1O0L0TC2Xx093IW5zbXqnkWsNQlRtjsoNJ0cX+XrxO6OEWrAWUwOyk1Zg3rr1nNCEa9Xc1/e4AiW2R6Q4I02i4Z+AKX/5i0mHkAS1/fSslH7C3nzLroA8BUffRRE1IyQqpcIwvKGhImJBiyW4kVxmWUNlWhQ5THCFYg1NCF8fE1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh2oLnyUD2hYXm6BLhEb/7ManCAKZM5/xuF/bUALGS4=;
 b=GmtcP0pvNHrurIxhRkJtdXXCuJv4OtyEfGSX07ZxWGZwcwNIY7AUwWJfSm1+yE3opaDeib2hF6OuJWG+5nXWLBTvC++iB6IIYdoPzTUOKKHz55vvnWlsTzoZ1iSpuW2+sckh07D9bETeRgSeOv67tWp+LwT7IpHJWNgioLLAD+8=
Date: Mon, 29 Nov 2021 18:30:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anton Belousov <blsv.anton@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [XEN PATCH 0/1] Add support for SMBIOS tables 7,8,9,26,27,28.
Message-ID: <YaUOUmwGdmk5lc2d@Air-de-Roger>
References: <cover.1638190663.git.blsv.anton@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1638190663.git.blsv.anton@gmail.com>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99c107cf-0793-4461-bc20-08d9b35e04be
X-MS-TrafficTypeDiagnostic: DM6PR03MB4297:
X-Microsoft-Antispam-PRVS: <DM6PR03MB42976CF477903CD4B9131CEA8F669@DM6PR03MB4297.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mgh42OqUNup7wBXPVVbSCUwXuCgQjd5nRnF7iIwJmTS2UNKqQvA6dTFN5a4rM3P3lUo68QQ3mld0BBrjQqq0m4oKzxVFh0I1YNc8812/dqewk0Yk002CtH5rL5fJkmiMyjmiKHMxy3C7bhmpJuvrNinmhj/1oY1T80O6xVgWcnpKHmlOon8AnrkunwNm3i3bK7Rnr6+Oxx/IH/ar2CfkqFP2QIMOWMQDNYG/UxgNNt4est/Y5ucd1tTGMk+EuEB8st/1andn6ZUZVv3U7a/Atl4ZwCRXVmyx+HX59CVDcK4zcIjgKLnNuHwSFylKP7Ggtofya0Hi8/MiE8kBFGirY1z5JBj+PIQaa5Slaht7/Utf/D0IwgU5wKVWCBTRnZLat7pSg4NTzqd9kvn6t5ECEUCIQ0S2TqnXZ+so/blRkFBKEVygHrjaNGOSiEw4V+m0TOxCtyHeT15SVE36UNzQxWTdx5OR15ZWBGmKNnhnUMqxCCoafo8e8vWKkYYB5XvNMM55A3u3Yp5BdxipAKMx6RsGFwI99qiJVFHyQEVzsOBHhXkYh54EeH6AOVz21UPywm9R8F3XqiGO5ZrUnYMaERCxV4LPcOvR8R4lP0vhJI05h7R4wSV+8WefABGV9XZ1oMyOpa8JYu/xx+e14HbCl/8W/ub7030GAWCHIH9HvV4ffTTZD+5tXHuvQ4wr2PAlyPscX5PsZ3nFZfzvzgnjkP0u0rW630HqdyumgmCUis=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(8936002)(4326008)(6666004)(86362001)(508600001)(956004)(316002)(5660300002)(4744005)(66556008)(8676002)(66946007)(6916009)(54906003)(66574015)(2906002)(33716001)(83380400001)(82960400001)(26005)(9686003)(186003)(6496006)(6486002)(38100700002)(66476007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5sZGlOOXFPd1F0WUtEbHJIR3J4bmhmTmpYZ05EZFdwTExZbVk3T1hKOG9O?=
 =?utf-8?B?NWxCdGhLazBOOXJsTlE3REtQZWxvbHlpamdlNTd4UzBPSnNLNTNNUFZoVXYr?=
 =?utf-8?B?TnFEUTR1TUhUaDlCS1JKOXBpVlJlbVdQVzc3QXo5ZmIwNzExNzArM05iMUNO?=
 =?utf-8?B?a3lzL3R0amg0MjhEMEZ3bWFjWXhhY0xVZnc3dTh3bUNJOG5uV0UrSFQ0VHdD?=
 =?utf-8?B?Uk94emJQR0ZNUVl2QkNGOU1yWmIvNitMcXhGSHJxalNSdnZraHpCNktBQkFE?=
 =?utf-8?B?ajNsem1iK1Y5NzFnVW9kUFM0WmZsaklpUUFrWE84NC95YWJJTmRDcmJrOC94?=
 =?utf-8?B?RWVWcU1GQ0MvSUxRcXBvbCtzcVZYYjJTdUhIOHlKby90ZWh3di93YnQ4dk1W?=
 =?utf-8?B?M0hvTFJFVlJ5anhkeWtPMCs1TGhKNkpzK0h5MHBWYWtmTFhnY0s2Mno0cVNt?=
 =?utf-8?B?TGt3ZmFDYXlQckVZZW1MZjRCaDVpQk1vVGdrRTNIYTlWOXBiM1ZCNmZYcW4r?=
 =?utf-8?B?UjNmSzFMWkhiaHVOVEJKbmtVQ1hja3JQcGgrTVdGd3dyNExoMzQyMzhGQjVP?=
 =?utf-8?B?R1BNbzNQbWZ5bTFzdThSak5jQnFlek9PRDh4ZzcrVWp3cSs1NVZId1RLT0pL?=
 =?utf-8?B?Wm5GcTFhZXg2b2s1bWFDR1l1cU9qVys5T2xXK0N2aHoxWDdjZkZFazBOaVEv?=
 =?utf-8?B?SjhBWlQ1cEQyZ2JEUDNKQWhseHN2OVpuUldYYlRjMG1ZL0lFNTAwQUFQVVF1?=
 =?utf-8?B?NFVQTUowWitXUWtwb3huZ2wrWUlzKzljZjNMazFUd2tnNG9KZHMzZEJNVVlm?=
 =?utf-8?B?ZmNWd2MrdXJRcU5YMEhYeFBCaGltak5aelRRMmpWakh3aEtoSnJrdVplRGJH?=
 =?utf-8?B?V1QyRndjOE5FcSt5SExyVHlvcXZzTDk1OEhKRy8rTDhlWld0OER0V3FqTDMr?=
 =?utf-8?B?VVUvNVZrdnY0ZW1GT1hrS1NMeGtLVUJaTWRISHNidlJia29FZjlFTGlGVWoy?=
 =?utf-8?B?WEZldDJ4ZkJEVzN6dVpnc2ZFNGVKTklWOUxyUTJyYW0rcHVnNUdRTDZLdnZw?=
 =?utf-8?B?VEV2SG4xVVQ0K1pSaDg2N1BQYkRKWXdwbC9FTjd4VlFNVGFPQk1xd0hCR0tT?=
 =?utf-8?B?Qmt0YXd1RkhidkhlbFR5d1F3Rm1QTkthWTJ2YlFvRUdEajd1b0FsdzR3M1F0?=
 =?utf-8?B?U0lRSnRaQ29xNXdQZWJXaXhXcFZpS1d5bi9jTlVya1FFdUxIVk1GQjB4b3I2?=
 =?utf-8?B?dTNCWGVTOHNuLzhFcXRZVmJNZWg4SXdKbjJ3dXJ5NWU5OFJ3UVJYYWV0cmJQ?=
 =?utf-8?B?dndSQzVXaU1NNnpBdzJxSXZQSUVJRC84TWNjbVZkWFN4Wm10N0NMSURSV3F1?=
 =?utf-8?B?VlFNV0Z5cjVhd2ZtQVdHSkM5bkp4dE5ib2VzSEZvWEptUm83SVQ2MFpSK3NT?=
 =?utf-8?B?TUd4MTBvcld3WnhjLzFuNlpjRERsZVBRQm4rYnRyc0FsWUU5TTRoRzZGWFlI?=
 =?utf-8?B?ZHlLbzNNR2w1WGJIeHduOWtCcTl4OERHYnZuYVdLbkNhY1I5OUZhUEswRVM1?=
 =?utf-8?B?bEJtcjdpM0RUaE16YUNqb29WZy9MZURZNEk2S3QrRHBGNnNYMFhGNmVJVmRV?=
 =?utf-8?B?c0tWSHlKR2lKelNFR0dhZGxJYkJLWkZnQzIzV2FVay9BWXRadDZtc0wxMnpP?=
 =?utf-8?B?Z0lWQk9YYU5Vd3lpaFN5ZGk3emZEVFduUTArWGt3VGtwNjBGc0VXaU41ZlQr?=
 =?utf-8?B?Wld4SHFVaDNxdHhyT3RjdWNPalBWVUFDSllTdloraWYrMTlodm15d2o0dy9a?=
 =?utf-8?B?N2txd1J6dnNQa016M01xZmUwUWZJeHBUbUplL2EwcWxMVysvYkYybzdHekRV?=
 =?utf-8?B?Wks5UDlsRWhVT2xsZFFHZTB0NmZScmhTTHd3cTJQVmxCdFR4OWJHTVJaRFVl?=
 =?utf-8?B?KzhaOUw5QmdZS0ozcmVqM3VJSmE1U1ozUlhZUDBGUEYvOURXbEYwVTBzQlh5?=
 =?utf-8?B?dGs0YURBa3RtbVl5d203YzRxdWhMUXFYck50Q1RrWmxGWWxOd1V5eldCZEdV?=
 =?utf-8?B?NGhhS2NTSGMwNG15Zkp5a1JOVzM1MjRYVDkyQ1BhWGlWdmxzbjA5YTYwcWlx?=
 =?utf-8?B?WnA5VUhYZGVaQi81OG5aRWE1UUtTMWR0Tm4vdm5pMVZYVXhyQWdVbURGbnpl?=
 =?utf-8?Q?OAJTCHwZcfMjW9JX6gmrtn8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c107cf-0793-4461-bc20-08d9b35e04be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 17:31:03.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5/TqKDLbFlMrB2o3d0jfwNIt6Q59+74r66193YgJli0LLdkWvnULCjnNWvVKKbpXjN0aZaU/Z5bMzAV9FLiGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4297
X-OriginatorOrg: citrix.com

On Mon, Nov 29, 2021 at 12:59:28PM +0000, Anton Belousov wrote:
> This update is done to improve virtual machine stealth from malware. There are AntiVM techniques that use WMI-queries to detect presence of this SMBIOS tables. Example: "https://github.com/LordNoteworthy/al-khaser/blob/master/al-khaser/AntiVM/Generic.cpp"

Aren't there many other hints at whether an OS is running inside of a
VM? I could imagine for example the ACPI tables, the list or models of
exposed devices, or the cpuid data?

Thanks, Roger.

