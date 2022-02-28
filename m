Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667BD4C71BE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 17:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280696.478736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOivj-0002JW-90; Mon, 28 Feb 2022 16:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280696.478736; Mon, 28 Feb 2022 16:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOivj-0002GY-5S; Mon, 28 Feb 2022 16:31:23 +0000
Received: by outflank-mailman (input) for mailman id 280696;
 Mon, 28 Feb 2022 16:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOivh-0002GS-5Q
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 16:31:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3da634-98b3-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 17:31:18 +0100 (CET)
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
X-Inumbo-ID: da3da634-98b3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646065879;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wDVtaGfbtrvKea1QgznvqAPc2HZp3sWHr+lsBmRlUlo=;
  b=YQncu7sP6qEchO3v0Vf70IUCtXk8S1lmBJ7L1ho/HhbBcevuTiPXc/dZ
   J3084bWEodephCeQQAlu0Y+nS/SMiYe1IjOccX0Kka8q6PBh0HnUKau5Y
   +furJdIaPEDpua+b40a1hxq293i+luT9AvgEgBR5lBervJQ43RVd3gaK0
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67421947
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YpoHyaBiIrwJlxVW/5zjw5YqxClBgxIJ4kV8jS/XYbTApDIm3jAPm
 DMZXGmEbP2IM2ejKNFzPYrn9UpX6MCEmNJlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhh6
 txmjZW3Ej4QZIjCwdsdTDJDOH1HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg2tq35ESQp4yY
 eIlMghMSyzMeyFFHWxJUoJk38qUiFzGJmgwRFW9+vNsvjm7IBZK+LLgKsbPc9qGA8BchF+Fp
 3nu9n78RBodMbS39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IB8LUx29qPqwiE+7UvpeL
 VAZ/mwlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTTNfadpgqM4/QxQr0
 EOEm5XiAjkHmKKRYWKQ8PGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrNQcxkC7WdlcDuFHf7x
 DXihDMlm7wZgMoP1qO61VPKmTShot7OVAFdzgfKWmOo6CtpaYjjYJangWU39t4ZctzfFAPY+
 iFZxY7Ot4jiEK1higSdYuwmJLiuvM+8ahjS2GFvALI63GiUrivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZKVfflByCc3J8yIwEfKIEtagkc
 amWfs+3ZZrxIfQ2lWHmLwvxPFJC+8zf+Y8xbc2hp/hE+eDHDJJwdVvjGAHTBgzexPnZyDg5C
 /4Fa6O3J+x3CYUSmBX//48JNkwtJnMmH53woME/Xrfdflc3SD54UqOPmeNJl2lZc0J9zLqgE
 paVABIw9bYCrSefdVXiho5LMtsDoqqTXVpkZHdxbD5EKlAoYJq17bd3SnfEVeJPyQCX9tYtF
 6NtU5zZWpxnE22bkxxAPciVhNEzL3yD2FPRVxdJlRBiJvaMsSSSoYS6FuYunQFTZheKWTwW+
 OXxhluGGsNYH2yPzq/+MZqS8r94hlBE8MpaVErUONhDPkLq9YlhMSvqifErZcoLLH3+KvGyj
 W563T9wSTHxnrII
IronPort-HdrOrdr: A9a23:m4tEsa5evqhPs1O9hQPXwVOBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH46G7j5vZZm2m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MOOA4we7rFNoXze2O4DIuzGyWuKEhVAQOHl3bIiI9Fk91CPqZ4iqcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="67421947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzbbeAftgU0jaXTb4jDJ/buDhtOMVHKWvL5pAiwtGkPyPTWhDEe/yojITcrinK2G/eebPdholEXXZT/4m5DFWhl9sv2RO+S2jBdnHRkY7ZMHbl/rO8jejFK4Zt4cJVDg03YexlJY57pK8deDgu78OBlo3MYoRV6prtRV0OXbbg6DQzwpRkWrYt6tLlPLoeE4HtU8AA8QMGb6fRmHVLOGDLyRvjK3H6cWkZ3pqvddcVrpuEeG2//OXgXB7rv/4PUlQAZFJgGZIy9oHxoQ8fGNZktX+3CWD3riPJN/KYLJBxr1a67uM1DjSgyyvZpjIpaIdBKY65eQNVpLt/X/sdefOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H06QxMvESAl421R51c3OhWkzGa8V9O0CWDixWNdErw=;
 b=nPZEdE+FqXpp17aCKwbgJk2LjaRwQ76woyROh95QW4lf86cwpsxJPzmFXF+qD2Fx2HBUDQzolLmEK61lBNLVGnZSk8PdV3gbxpvYp49Zt3RE8zcGmAg5N/4RgFqGonEaNBlv7zDUVEQhhpxx8RYw3eEORimMGa0xYtKnw3TLkBw+7HahG5gztGbzIpEIU+mDfOdJOZ5S4ZW8MuxgOEisWc8/WmNpfB6Jjd7CXXrY7QxcXCn4aD8D/K14ZOzsWDwtCk5xBXfv55IYBnydTEM5vb/YcCQbwXdX8N/0q1QdhG9s5ULFu/8Ejw5bq5gPXeixVvIeLCc4KYb7bu97bX4YoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H06QxMvESAl421R51c3OhWkzGa8V9O0CWDixWNdErw=;
 b=ELgub8vui903zepYY0ENCbB5BzGnxEThZgGM75g9thg4Bc8jTE8kMWuBXeDaUZ3OOs8eIuzaG+0PwBrJhl9QlE7zHGevy81xB9/obw2uaGiUrRxez345y9Rutqi1GqaizPoDO/41fMXR/YTWS9VynjN118eNhPuMG/SQb99abrM=
Date: Mon, 28 Feb 2022 17:31:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Yhz4yShnpcyq5IDM@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <YhyrAyxhNtNWi7NY@Air-de-Roger>
 <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
 <Yhzr739VZdRLWnok@Air-de-Roger>
 <6b59e3ea-01ff-e26c-02d4-3b11594fd7f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b59e3ea-01ff-e26c-02d4-3b11594fd7f0@suse.com>
X-ClientProxiedBy: MR2P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab1da63e-8f79-47b9-edec-08d9fad7badc
X-MS-TrafficTypeDiagnostic: PH0PR03MB6543:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB6543390D48CD9650A24DD0FC8F019@PH0PR03MB6543.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaRujtxKyjEhGuB1ze39lrVeKsnRfuOqDKbAZJ2YjaEyQ0ZzHDrhAGsq1xcbZT8Spj/e1hPklpLHix4AchEuVSf/u49TZzQTt7R+LyqkUDddbn/MPzxvxSoUhiw2XRG6tDFPXbY7mMYTr3TR9bFsrTs9GSfZZsV+YACaPj+B3jDm2FcVX0zsIIPym0BEk/Gq/Q6/pa/AKDeOi3XcV7jqTYIU+fBE2ArWrt3MnnfWDeqDFQzqwCqKplJd/UcvK1FTppfipnaH1qMrrTuGtFC4OzT6Uz6m/7NJRj6JHuYQxjS/6RIq2yI8mNjPIB2/y8XrnlYQ+IiLlLCYenKuiG/aXWAQN9+GpBB4nDId8WQ0d/LEaXRRtVX+Iw1oYNgoYsX4cZ0K59IOEgl6ithWuzZ6LlNUqYpCZp4pNvK3gMqIdRdjlhPagr3QXezO/U+8wRp1yiZ2ZphlhgJ81/lwUgccw1gPFAcMNr8g5/9/c/f1pBFwcSkn9b3SdkZDJmsCCXLme+FcjVNU0atz5YjUx1NoFMFL+f0XvftiDbcfOzTiB/RItyHO8xenZuq0NkJNvRu/cNN92efJaM8QVV0wgChbSOCgom9eyW7sBXBxFPe9+wtnBkysb1+CKOC81f+p/d+qWfDJxsKsFPzWZp51gDjQaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(9686003)(6512007)(8676002)(66556008)(66476007)(66946007)(26005)(186003)(38100700002)(85182001)(4326008)(7416002)(5660300002)(508600001)(2906002)(6486002)(33716001)(82960400001)(6506007)(316002)(53546011)(86362001)(83380400001)(8936002)(54906003)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NpbkJ1YVFVRk9kdjJGS2FYZnJMbDc2WXVQcXp4QU8vd25iMW9YRXdncUo4?=
 =?utf-8?B?T3FGdGNaeUd5aHRzdHRSZmwySTdWR1Vma2lLaU9qY21oOFNBY2MzZ2g1VVVr?=
 =?utf-8?B?M3NqTXhWMHluTnk2aDlROFpQLzFWOTE2bTJ6Wlp6NHhnOTFBNTJaK2ZFQzBr?=
 =?utf-8?B?YmNsNVFpRXZSU2tRVXFDcFZPTW1HVHVJcktIMzRHQTgySVhCMGZYaXpRTVhJ?=
 =?utf-8?B?bDNLajF3cTZsTW9FMUw1d3NSZFhoMlZ2MWZsTEZZcnBkeWVJeFhtUTU4MGFE?=
 =?utf-8?B?MnJnbEFMdnVpQVUyZjFWUFlyN05OS3pVREl0NC9xTGxYR3RSa1JhdVZOZFBz?=
 =?utf-8?B?ZXVXQlNzMjd0OGRkNWpRc29ZU1RjYXk4RFZiNmhsaWpHVFNIeTlsMDlNVUx0?=
 =?utf-8?B?N3M4N2pCaVFBaVpwak4rZ21wSUt2ZmNRYXhDTy9BVkRNMkJBU1VrajhMZHdB?=
 =?utf-8?B?YlM2S2JQMWM5Mi80Y2hQZGhuZ1JsdlBueTBYczdMSm5keUZidVZQbUNUTEpO?=
 =?utf-8?B?SFhMT2taNE9FSTBUWFk4ZkpaQVZ3dHllSVZRbUYvSXluRUJ6eDkvcHZickgy?=
 =?utf-8?B?YVpjQjErNFg1amhYU0ZzK1RZTUkxaXVGd0RrRUFwejhGamQ0N2NIRVZMMHhP?=
 =?utf-8?B?NFE2N2dVVjBVakgzQWgvRkxHK3cvV1ZWaXdpWTVjbE5TcnpHekh1SW01MlEx?=
 =?utf-8?B?OW91Y0NiZ29VQ3ppS2pOM1lJK0V6RHF2bjJWaDJKUmZjNTR0blk5bVAxWHhW?=
 =?utf-8?B?T0d6SER5R2RrSGV4eXU4N1M3VFgwdlV4WTNBTENUSDV5M3pNMUNkcExWZERX?=
 =?utf-8?B?ZGJZWDhVbjVEVjloQi9kNUo3NUVjOE05aVdVUEswQ2RXRWtRVlRDZDNadVlr?=
 =?utf-8?B?SFYyaHNrS2kvSXozeE16NG5KUXhEcXZ3K3BJcy9lSnhPUS9MdmdMK25rYXBu?=
 =?utf-8?B?YWpJd3NLaTU5amV6eWx0czhnT1I5MnNzRElaSEtSTXoxQ0tDNFh4Ump1TG5n?=
 =?utf-8?B?NGpabHdjRHpHV0tBQmtaQmtaT0pxOHdUSmZ5M0hqWXFJR3VHT2hDbUJNSXEr?=
 =?utf-8?B?eTRyYWp1UEtPbFE2cjRLOGJtemF4K1JTZnpaWkU5WkZqeE9LVlBBRWJJeGJZ?=
 =?utf-8?B?VlYxa0xSSVZOd2x2cnh2ZDgwQXhyM2R5NDBjSUd3MHRIQVFTNllJMU44ZVVE?=
 =?utf-8?B?WkxRc0VJRW5NL0pPbnFLWlFZRlczck1UVHE1N0FjaGNyZHE4RnR4MXhqV0ll?=
 =?utf-8?B?RXlUa1V2WVdaOUNmZE1ENW40bGpxcDYrd1ovc0thM0l1WVYzazlIbjZtbVhh?=
 =?utf-8?B?VW1KbEpma3NDQmNLNWNVd3hkYnhvZXI3M0phYkxoV0d4ZXRsM3lIZzEzT0lQ?=
 =?utf-8?B?Qk5CTnBNUnpCMGk3TWp0S21nUjIzb2JEaDJYNm9NWlBmZy9KYlNVZTBtUFpy?=
 =?utf-8?B?ZVVDVnlDQVZkWENZamNlQytNd0ZJWkdIbkdNQmZ2cmRFNXVqWjJkeFN0cVc2?=
 =?utf-8?B?aW9XMUp3bHFRek5EWkQvL2dWZTRsK1hRYjR3ZmpIOEc0c3ZGdk9VMVZyVFVH?=
 =?utf-8?B?RG05TUlqUG9FMFRyZXJHOUV5dktlRlFTM1FRM3RSTERNQlA3eUlVZlBzVjZQ?=
 =?utf-8?B?Uzlmcm9MdHhhZDk2aDdiTVdzK09XLzJjdHFFV04xRktUWVVOdDdnMTREekV4?=
 =?utf-8?B?T083clBDSkZlODh3ZVFuUzdlN2ZzS3N6dG5LemhGUFZJNjY3Vy9DYklRbFlU?=
 =?utf-8?B?QVlmYS94TGNmL0NxQ0loM2tpdDBjZ1ZQK0ZxSmRmS1FNaVZHTlExdFBRc2Y2?=
 =?utf-8?B?TmhZUW5jZk5KY3M5Wi8zN0k0U1NoNTBRRmRLSVkwWU8wemtqQ01YV2t5S1Jq?=
 =?utf-8?B?Szlia3drcXBnMTVzRDk5UVRDN0M3VHRWb1h2ZytyRlV5OGw1MXRGU0xrcVhx?=
 =?utf-8?B?RFd0a1J5YXdIS1k5eVBNSnJySU5FaTBLYmhBOFVKME1SdjQ2QlBlZ3BST2lh?=
 =?utf-8?B?L1JXa1VrM3NHZ3BQZ3hiZHppVkZZQnJkRUZwMWZSSkNRbWdHU3RlTHIvUFda?=
 =?utf-8?B?KzFRNFppSE5IR0pPdk9GSENzN0Y3NGNEakh6c2xKTEhTdUZzTndyd05CZkFH?=
 =?utf-8?B?NkFKWVBUcjVGSmFFNXJabEZ3YmQwSWhGZGl2djRRTVFER0VBbUkxdzBxRGpH?=
 =?utf-8?Q?4ce1ttmudxbTuiy0+4nKU9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1da63e-8f79-47b9-edec-08d9fad7badc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 16:31:11.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqhoSV7kYTcNrt+MjQCIRVcV4i31LyrQnZIpgZVzzdlb2sxCXB8MF2lgZLEJ2AT5Abnu1IuNeXH94ZgBnNwH6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6543
X-OriginatorOrg: citrix.com

On Mon, Feb 28, 2022 at 05:14:26PM +0100, Jan Beulich wrote:
> On 28.02.2022 16:36, Roger Pau Monné wrote:
> > On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
> >> On 28.02.2022 11:59, Roger Pau Monné wrote:
> >>> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
> >>>> On 18.02.2022 18:29, Jane Malalane wrote:
> >>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> >>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> >>>>> and x2apic, on x86 hardware.
> >>>>> No such features are currently implemented on AMD hardware.
> >>>>>
> >>>>> For that purpose, also add an arch-specific "capabilities" parameter
> >>>>> to struct xen_sysctl_physinfo.
> >>>>>
> >>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> >>>>> ---
> >>>>> v3:
> >>>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
> >>>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
> >>>>>  * Have assisted_x2apic_available only depend on
> >>>>>    cpu_has_vmx_virtualize_x2apic_mode
> >>>>
> >>>> I understand this was the result from previous discussion, but this
> >>>> needs justifying in the description. Not the least because it differs
> >>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
> >>>> vmx_vlapic_msr_changed() does. The difference between those two is
> >>>> probably intended (judging from a comment there), but the further
> >>>> difference to what you add isn't obvious.
> >>>>
> >>>> Which raises another thought: If that hypervisor leaf was part of the
> >>>> HVM feature set, the tool stack could be able to obtain the wanted
> >>>> information without altering sysctl (assuming the conditions to set
> >>>> the respective bits were the same). And I would view it as generally
> >>>> reasonable for there to be a way for tool stacks to know what
> >>>> hypervisor leaves guests are going to get to see (at the maximum and
> >>>> by default).
> >>>
> >>> I'm not sure using CPUID would be appropriate for this. Those fields
> >>> are supposed to be used by a guest to decide whether it should prefer
> >>> the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
> >>> example), but the level of control we can provide with the sysctl is
> >>> more fine grained.
> >>>
> >>> The current proposal is limited to the exposure and control of the
> >>> usage of APIC virtualization, but we could also expose availability
> >>> and per-domain enablement of APIC register virtualization and posted
> >>> interrupts.
> >>
> >> But then I would still like to avoid duplication of information
> >> exposure and expose through the featureset what can be exposed there
> >> and limit sysctl to what cannot be expressed otherwise.
> > 
> > So you would rather prefer to expose this information in a synthetic
> > CPUID leaf?
> 
> Depends on what you mean by "synthetic leaf". We already have a leaf.
> What I'm suggesting to consider to the give that hypervisor leaf a
> representation in the featureset.

Hm, but then we won't be able to expose more fine grained controls,
ie: separate between basic APIC virtualization support, APIC register
virtualization and interrupt virtualization. We would need to keep the
meaning of XEN_HVM_CPUID_APIC_ACCESS_VIRT / XEN_HVM_CPUID_X2APIC_VIRT
(and exposing more fine grained features to guests make no sense).

Thanks, Roger.

