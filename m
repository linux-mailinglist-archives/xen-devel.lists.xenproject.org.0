Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DE718011
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 14:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541756.844828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4L6j-0007RZ-EG; Wed, 31 May 2023 12:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541756.844828; Wed, 31 May 2023 12:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4L6j-0007PF-AC; Wed, 31 May 2023 12:39:17 +0000
Received: by outflank-mailman (input) for mailman id 541756;
 Wed, 31 May 2023 12:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sC/f=BU=citrix.com=prvs=508b7ea43=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4L6h-0007P9-Rf
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 12:39:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b33fff-ffb0-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 14:39:13 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 08:39:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6934.namprd03.prod.outlook.com (2603:10b6:8:46::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Wed, 31 May 2023 12:39:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 12:39:02 +0000
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
X-Inumbo-ID: 24b33fff-ffb0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685536752;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8OYiF6SPBjT7zP/qAx7QHPipcP5zT6XDLyGJG4Qf7+E=;
  b=eYgn3KkLkaHZ18sG4XlvZAgrp42CCccAHBoEb2td1GE8tDpjDQ6zgaWp
   /p91CiItJlu63ot+WW4sb8D1fi+6YM/c9g81XmxWFQPgFd5J/tamqe7Qz
   6FJrtVTZvT0QKmjScRXxJkxOPuhBZPRPOvnzKVndIQXqy+LCQnDGUzYTe
   E=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 109827932
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lhib/K9pzdaDbNpPfe3FDrUDQH+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2FOUTjTMqncZWr1ctwkPomy/ElXuMWAyYRqTVQ4/Ho8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKsS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklj/
 80Tcz4CQyyN3f2Z24uke8poiMMseZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpDROfnp6Uw6LGV7m8KNloQfGHjm+u0sGKwf9lYJ
 Q8L6wN7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMQNiKOy+Amfhyr2/8CYCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:0gOv064GrLe6vD30JQPXwEHXdLJyesId70hD6qkRc3Bom6mj/P
 xG88566faZslcssTQb6Km90YO7MBThHP1OjrX5Q43SOjUO0VHAROsO0WKh+UyZJ8SZzJ8n6U
 4KScZD4bPLfCRHpPe/zA6kE8sxhPmrmZrY+ts2Fk0dNz2CvZsQkjtRO0KgHkpqXxkDIJw2Gp
 aGj/A3xQaISDAsYsOnHWlAeu7MqdHR0LfrfhICbiRXjTWmvHeT5LnmCAjd5wwZUD9E3N4ZgA
 v4uj283KmlruqqjiTRzmrCq6lR8eGRrud+OA==
X-Talos-CUID: 9a23:i2Y7u2He0yCY45zMqmJK/n8fQc4qX0HTlmj/OHanOEVtRrqaHAo=
X-Talos-MUID: 9a23:5r3/JwYGD+BfXeBTtCbSwzdLDp9S8amUJE4pmpII+NaVHHkl
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="109827932"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPoIFmHJALVL8yqSHPlMjOSl3eT8OrLAuxpksr7GJEGj8+acmRrLv+8wdh3eXEjjjdK2Ip/apJ2n9OfJsbM6m1V1qmHgUZSzO9SzdJ+KYdzYGlL1490rDyPpoaeSD/2nqdwVvH0cYKbqfgqOf27VSgHqZ3LiDoL0dtAQEWpDlrsQk4HFt+eDyzdUREyf+47aBQcQo5iojty+cZqL7JAlySsG0I4bbr6Vjcskgag8spNENMumPw4Yy4EZdPW2BHDn+h4CzU0+NHojkK1APwScI5PgUKRn7T4dGNAo9bkf/fAKHa1QqIj5a1Z2Mewfyokb9773RPF2hBwWyBisi6KWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OYiF6SPBjT7zP/qAx7QHPipcP5zT6XDLyGJG4Qf7+E=;
 b=V7D40nYqx84JN6vrjDgak3O4b1FOEZgBoirABZqVSbzgSsPLiXTKaoyT7l38gTI/B2Q/b3N3+fropGyz43bYOxKXSR47pVq6xRxdVMJ4snGOWXeKXSDDuc0Pa4BacVxn5MB1FuGyYyXmZqR1SQ0RA63tuxC628gYIP7coEwn9r6Fxss7qAJ2zOXIXQF00jejrkQ7iEBPiD35TiQQGjfCZA7VoYseVZ4Ug2cYKIMnjWEZ1ngbZ/3UWBYYP+3rb943LYO853adEJaD0+HLwKz702zx5fvf3iXPYXWP5pL6Sd7YS8OWuUMb18q5q6ms/Yc38krPhF5mh6IBvknLEFRTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OYiF6SPBjT7zP/qAx7QHPipcP5zT6XDLyGJG4Qf7+E=;
 b=vprGT8adL4uSGkuT0fBZPcqtpj1LSJKg/4rlnY4sR7xy2l4zDUaY61oRaQ/6dykPhW9/CxSTGYvzceNuzveqOqgoentCDUlU94cslquUXzHG531W1k4m3jKjSrJoN2rlkpGyvkixvTtvOi4FudYp6G+UtjtBXdM/xS6z352KPQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3f009cf5-852a-abb8-814b-a63f05e37a16@citrix.com>
Date: Wed, 31 May 2023 13:38:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86: Expose Automatic IBRS to guests
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-3-alejandro.vallejo@cloud.com>
 <2e1bea58-9f6f-08c0-ce00-148f79ba12ff@citrix.com>
 <64770ce3.050a0220.fb998.7ff6@mx.google.com>
In-Reply-To: <64770ce3.050a0220.fb998.7ff6@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 8740b73b-7013-4dd6-bbef-08db61d40347
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nBJIwCHR0j6KEjsnwG9uNDtdQhgD3VKMBN6RslJnwqmtlsc7Hs8gx/KgMqE2LYAH2VNgZci6ubcZKKMI+XYHSIP3or8lopwFdtMDQHWknWMyfReBVo/8fB3wmqQDn85BjCxkYwkoSrxmU1oLhseHE/jQqbF5dAVt+KHjfzyMGbXecFpJvo3usaxoAl3BtlVb9XWlSQRQgO85pU/I5eSVLBlZKKgP+s2xJd9iIJF31Jxle1bHDRg+95xr14By+cIzz1FD0UK5Ha+37ZeW/oDPkJFQwMvkh4h2dNVDf5ZhMD0jbK+2EgZcrF8lg9n2fy+1iKySRdxWAVJniiXN7iQen48ajBiF+dMHoVa42lDBHd9TKh6XaRQ9iPeyYdeUxs2yVDRGOZnYZmPsB14y7Igpe+ICsvgqITJU7N16ZutyyScqLevJlYPcMZ5v/5I80cQ3gkYSUa6eV0Lw7b/rMTvax2cfrdbKFzA9PWljNyTNhiTVK+XZjntLKE7KXy6N+gKgGqcCPMQ6qpeOQhV9UNwAnGT4gLqpsJB7Z0Ta2bP1Ud9qSwXQe63HSEZyZqrgs9zApjgz16ToQKNoaDewA+v4LyRxTWMWLFKtqsXHlHoFWLh4JQ3GluHpvghzKEBd6A9IQcAbykwd2/w3CMP72TM61A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(6506007)(6512007)(186003)(31686004)(2616005)(2906002)(53546011)(54906003)(478600001)(26005)(83380400001)(86362001)(31696002)(8676002)(6486002)(41300700001)(38100700002)(8936002)(82960400001)(66556008)(66476007)(66946007)(316002)(5660300002)(6666004)(36756003)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDNXSDhhZGMrbGdpUzVrdVFSR1hLa2RGUkNJQmpHWnRiYXo5aENmK1RXNXFU?=
 =?utf-8?B?ODcxaU5GUS96dmtsSTVEbnA4SWw4VG0zMVBSR2hTRk03LzRieXhRS0g1akRl?=
 =?utf-8?B?YVNOMy84My9rTkZGbnRWOXdCZ2JNVzFFdmg5dzUwd0Z5c1pqZWo2UHByeWVz?=
 =?utf-8?B?Q1EyTE0vcEtzVVZyMHNWK3lueVBSRGZ4NUdvSkR3TEJvWXpoSGpjdHZrTm1w?=
 =?utf-8?B?Z095dE5sOEZGeGpMUVJIa29RVnFvY052NlFud0RyZ3Z5N3RiMWI2VTNnVVBh?=
 =?utf-8?B?d3VqUW5RNThpMkxudzVLVE5XK1o2TnVKK0thT29jUlFrV0xrL1BZK0dlcDl0?=
 =?utf-8?B?TEU5QUtQRDhIdU5vWTQ0bldSSXhUQTJ0OStwYjZUemFLcVUxMG9hNTcweXMz?=
 =?utf-8?B?NDJlNVVaUkk2Rm9kT0hrSHg2TmU2bnlIMlZLS2YyVnliUm5QZHgvblZlSDVK?=
 =?utf-8?B?SXdqRmdUcEdseWFUb2lHcEl4ckd6b0hBNmhqZytFQ0tUY2h4aU5YT1lEenFJ?=
 =?utf-8?B?bTFqa0NtNVN2T1Y1SlgrK21DTHRSanUxT2VqSWxHSmRhaDluSWFLNnkxRzlw?=
 =?utf-8?B?djhMNC9IMC9HK0VwMEJ4MHo0MVRCZXhxbHlzSkpHQ0JjN1BFeVZqLzBBVEgr?=
 =?utf-8?B?UTh0RWt5MXVIbGJTVGhjSU84aHdKbHd2ODhwZHVueWpxM0pNZk50TGJoVXB2?=
 =?utf-8?B?dUpnVTcrRXJWdHV1aFhBblp2YWxRRS9KZDVjZ2w0NFlIeUxNUHE4NmpHSzNF?=
 =?utf-8?B?VTM2NTA5dnMwd3QwSkJFWERGTTZnS1JyKzdmRzV1YUZhcW9IR3dqcFdxWVFp?=
 =?utf-8?B?MHZCMkVMaWtlZ3RqZ0FXcEJGTTlRQXp3MWlZbVhPcXB6OFFudnpaQzBaVDZY?=
 =?utf-8?B?YUM4MUpCbXE2SjhoSVNxY2dvRmwwMEM5ZEFIbUpIY0RBZk9ZUTREV2xTQ2lL?=
 =?utf-8?B?QVBEbnNDRFEvYnJyZWJaamlWOVVHVzZqZnlpRnBnYUQ5Q0hZNWZ0SmRaY1JL?=
 =?utf-8?B?ajJBRVlKUU1FdzBEclZKaTNsWGJ3SWh3QVdZbDFZbnJxUnJMK0JiRXVqSllM?=
 =?utf-8?B?QVArK2tNUlJvZ3hoZ3VmTGFvS1dWMUJQajZ4L20rQVVNV1JlQTZYeFIyK1h4?=
 =?utf-8?B?b0VxbGlrbHdCUVJTclY1ZXlZR3BpSW1ETlVYQ1JoNk94S2ZWWUNRVkZWTVQy?=
 =?utf-8?B?U0pENk1QVXpFNVpEQ0hGZHppaE9YS0t6U2xEeVFxeHFvV3p6RUxTV1lCQ1py?=
 =?utf-8?B?bWFmQ0M1MVh4UHpaRjFhbEdUbUw3b3ZmOTlhNXdTVjlBSGxKRG5BVEFPYVlp?=
 =?utf-8?B?QVRITElCM3hTSmtMclYzZk82a2c5OFJLcW9ET1NnSFJuRnBEOVRtaFlwcUFZ?=
 =?utf-8?B?TGhBVUozcXNMV0JHWHNLOW9FM2M4UXpvNEpmQ2xWRDlsRGZHUC9HWHhKY096?=
 =?utf-8?B?aDJYM2gvaVE0V1R3aEFvNzBYcjhNWFUyOEg2TGlsRGI2azJrMWRwdDBYTnRF?=
 =?utf-8?B?L3djTTBBRzVOYVhtSDJvOFZvQVVDcDIreW1WLzVpMXhrdjVjck1YUHI5MXNn?=
 =?utf-8?B?dlBOYzNuTXJTZjZPR1NFMlhkOERDd05wNVpDTUNCV2xOQkhqTlVCTXBFUmlh?=
 =?utf-8?B?N3pSbVFSQVhrcU11bVZ0enBVcHZNUzVWM1RtSHlZbEsxdGlRTzRMRUlJUXlQ?=
 =?utf-8?B?VHlndkNoZ29aZ2tndUxIekFVMWR3dENDT3hNLzJBbU9PQk9tb0JvMmJyckZT?=
 =?utf-8?B?Z2hjNkFOalc5WGZwcWxGbzNIYlMvZ2pyVTVRS3lPMi9IRERZcVg4ZVV0bndt?=
 =?utf-8?B?U0VybldmdUI2b0ZJZHhiYUZvRStjR1l0NU5BZ0V5K1YydTFVM0RCdFcyUGcw?=
 =?utf-8?B?S3owOVZrT2oxU0Z1MERlWUo1cDZoU3k3Q2VLNjBpUHVUSkM4TXNhd0UxTGdZ?=
 =?utf-8?B?d1ZQSTl4NS9MYVFWRVRtSWNRZlFLVmtiWk1pUm5LbDdKK0RvdXRUK05mbGNi?=
 =?utf-8?B?NW9ZWU5IWDJTQ1BNTCtEZkt0NksweXJQbjdDVE1kWVZUdWx0M3d3RzFZejdm?=
 =?utf-8?B?cTVnZXhJcVI5K3JtdG95d0N0WTNTWVMxSW1YaTdjMU0rbWVXbHdMallCU2Z5?=
 =?utf-8?B?SzdSODZBN3hBNExtWCtFekk5MVVIMFlERHRQaS9pZG8ra1crYkw4cFd4NVhj?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HEUb4SR14LfdoIH5CchpMQHK2WSff0x/8yhRfqX0zRpNZZTGBaMm/94so7dbmzcScJiJaoEBvIi3nCXevWN0ELr//+WnJ8i9z+yPWpYoN9ahpPfLvdmdusHeFHucGlm75i15fG0QMWD3gN1oqnWISV1XaDqUhIPY2po72CuvCzztaN3GJ4ozyyJ50Ru8I1SfEUGdWV+EkObdSWcC4sS3bJODKxDIQ7aKUQAi4ZT5F/UdtNOKyI3SggvmAcvsGrOwNhwsHsPXk+YIxwiQXgUWlOyYHFKQ3v8ylnbG2eKkUnSUV2HCgZ5BbeeOSP7a0zLvmJC3ooNVm9nXaRDiZdK7K7NhxNDFGrnov9MIXTfU7vI2yVJzCOb97bhnxUkxkgS24jIfPNhMcLUOCIgU0NbjllqEnMpW7ut4OMYkPsl92d6bOvSx0lk7MbxfzxZQO1tqPxyNO8lrvSGNawlqjX/4MHyDQj14rN8pefP+e8ejdcJGE31MABYpMMvjHkf1JcLJKN67MmhLYY7UTdbm7ek7pBB2X6TajShenaq/UfsEmrqiWHGWuutefFUSTuGoLgAfgy2gor1xHtMVNWOel2Qc93vYOMb9ln6wMgTAsJYquiPGUTOJ+neJkdB2DjeW/A7jhMlEK+pwFlKGQlnu5PshhKNQpDcamVKNWAXb+4cppEAgDY6nlJHULnrxnttKeamJDGDhrf40mdhPebIU61Uh/2U8tGV2p1gd2rEw4AmlrotR4Ds0Y8bhQJll4hLWmnEm8KaUkGYUxXmW3HG53kLKLTGEKCsnpWwO6dTjbM0De2UsbuMM/7FTdRK76BA7TT5vkNilu981uz8Gh/37anpkqunqefIZxxyU1h+2+/4swUA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8740b73b-7013-4dd6-bbef-08db61d40347
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 12:39:02.2883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZhs9tJI53oNOaKzW5uTnWvOhDDvHeXLEW5Pon00X/v69gbHe4xoWB8Cn68zbrHZBzVydGCTYzHeVg/x777KFAR2NOX4hQXWfWZFj2UoNp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6934

On 31/05/2023 10:01 am, Alejandro Vallejo wrote:
> On Tue, May 30, 2023 at 06:31:03PM +0100, Andrew Cooper wrote:
>> I've committed this, but made two tweaks to the commit message.  First,
>> "x86/hvm" in the subject because it's important context at a glance.
> Sure, that makes sense.
>
>> Second, I've adjusted the bit about PV guests.  The reason why we can't
>> expose it yet is because Xen doesn't currently context switch EFER
>> between PV guests.
>>
>> ~Andrew
> We could of course context switch EFER sensibly, but what would that mean
> for Automatic IBRS? It can't be trivially used for domain-to-domain
> isolation because every domain is in a co-equal protection level. Is there
> a non-obvious edge that exposing some interface to it gives for PV? The
> only useful case I can think of is PVH, and that seems to be subsumed by
> HVM.

Hence why it's fine to not worry about PV for now.

Right now, when we decide to use IBRS on AMD, we set it unilaterally. 
This turns out to be better performance than flipping it on privilege
changes (whether that's non-Xen <-> Xen, or guest user <-> kernel).

PV guests are obscure corner cases these days, and fall outside of
anything the hardware vendors care about when it comes to prediction
mode.  The only sane option is to have Xen explicitly tell the the PV
guest what Xen is doing, and let the guest decide if it wants to do
anything further in terms of protections.

~Andrew

