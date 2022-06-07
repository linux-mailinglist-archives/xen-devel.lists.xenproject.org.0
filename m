Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C453FAD1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 12:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343091.568249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW64-0006k5-8t; Tue, 07 Jun 2022 10:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343091.568249; Tue, 07 Jun 2022 10:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyW64-0006hH-5A; Tue, 07 Jun 2022 10:06:00 +0000
Received: by outflank-mailman (input) for mailman id 343091;
 Tue, 07 Jun 2022 10:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7Lz=WO=citrix.com=prvs=1504b46c8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nyW62-0006hB-RH
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 10:05:58 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbe0746-e649-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 12:05:57 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 06:05:54 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5529.namprd03.prod.outlook.com (2603:10b6:806:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 10:05:52 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:05:51 +0000
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
X-Inumbo-ID: 6bbe0746-e649-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654596357;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GOsm/q6PlKhUpbGNAwEiz8eiJKvZXqwgM6BEFn5twt4=;
  b=TMbKrOVudboQ7YRxAUHji6qNGNqRsAH4cDJvwJdPi2LlQe9ZKlFKtKKb
   YCijMd3H+L+C7/J+6AHZyyFlVIPJKWEtH5ekuEdrQUcgLF9c23QWLd3lm
   k6W6lq+NMdKDusgfRfk1+uIwZmVN6IUqIXdqe77kcWgvkwu1M47lx7a6e
   U=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 73040467
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pgBkT6uThtzclnqZ2gd8AL+pvufnVJRfMUV32f8akzHdYApBsoF/q
 tZmKW7UPfeOYWr0L9okOYqzo05Sv8PXzNYxSAc6/380EylA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13V5
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi80M+7Ro8U8QSBYHiplIIFk+pj/fl+W5Jn7I03uKxMAwt1IJWRvZ8gy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IFmm5v2qiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3O/fZvvzaMpOB3+OT9Od3rW8GTfNV+3UDC5
 WjY4lbeHh5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JPF8Uq5QfLzbDbiy6aC3YFSHhdadUgnM4wWTEuk
 FSOmrvBByFp9rucSnuf97KdhTK0JSURa2QFYEcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx74j/luYO3qS/uFrB0zSlo8GTShZvv1qLGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWB6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:Yt5HfauqsTK5i/QQ06oGv/sc7skC/4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVeUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0k9
 gsfJ4Y0I2mdfVmHJ6VNN1xP/dfNVa9MS4kEFjiV2gPR5t3ck4klfbMkccIzdDvXqA0570Pv7
 mEeG9klAcJCjfT4Iu1rdB2ziw=
X-IronPort-AV: E=Sophos;i="5.91,283,1647316800"; 
   d="scan'208";a="73040467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/68THZIkbldY52Ydlp7L5jnS75pZd2qc67VXvUBvFJMG+ion+a3Adf0mECLKmRJ8cfM+ovvSpe0AlQfIl/bHZoqUevSBeEItt91K2hrZq0Me19pYeIZl31JpFK+nVSKPJ1fphL3jTHjQUqRAVipl8Gsy9N7b6gopGpSnN/UHeBb/CWtR+vY/zZ85S+/Jc+T4cQAqTtINTnRU/oYU7rEt/rUJhAebVv2cm3wiAnXZCA6y4FyH9rcejjcqNb9hwpMxa7VpLGBRt4rSaFFt4+e3t0vDVL+AFUlbZu8qUq9FoX1bwgXax8LFyohECQ9RKIDpKrzWfV1p9xMX3Ururzf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sP+J3hksyJu9gy2PUY/QvzBqSYuyjyjHyxqnlzQqoQg=;
 b=IBEdBmlAYfaBpEp9PBlo5nAsj/2eacy6z1vRJxGCBIyijg6LvalSodq/F82SRbbMf/UX1pjtCZS3Dh/UaQ7KIyO2Wu44uXAWwgP0fhD7BzyrCv1jdROiLA961f2JxCNG5bS78fStG6cCn0KEpzb6pEZWyS+VJdlt5QBInGVKl7Ff+mBIRDMy9jtmKVOIf83n3GOn7i36i07f74Sf5vT3iaIeyTle3TS8VZ/q5qwoCaRJpUMn6mlBRF7oYfAlSqgpEEtgEcWFFchLsKx46xcfXhvPjg8jF+GXxDcOHN7WHdQheguLzjq0UpM1zm7LxA9P/6GteiilLjdzGkeReLXyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sP+J3hksyJu9gy2PUY/QvzBqSYuyjyjHyxqnlzQqoQg=;
 b=Fbva538lqS0fSJILJxIInEG34a1Eg+cBYv0Z5MJF5wL1w/jVpca3qpIdom25jnnF/4chKC1NUfjcOR6Bz81VK2a3MXcl2mY/NGgCthV7kRc7kGeMKwPXHlCOm5w/v4opLBTnPhrenzclLHhfMwbFzsy4Kid9cTU1ZpkBawac+RE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 7 Jun 2022 12:05:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Message-ID: <Yp8i/C+X82ZbIrSn@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <6fa93f8c-9336-331a-75c1-7e815d96ff49@suse.com>
 <YpoeuOJPS0gobz5u@Air-de-Roger>
 <c8f22652-abd5-76f8-75d3-ed581d1c4752@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8f22652-abd5-76f8-75d3-ed581d1c4752@suse.com>
X-ClientProxiedBy: LO2P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8e83bf-9549-48ba-aba2-08da486d4dab
X-MS-TrafficTypeDiagnostic: SA0PR03MB5529:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB552915BBAFE2098DDBFB6F748FA59@SA0PR03MB5529.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N2nwk6A+Rf05clZgtX0y2j7ne/FM9zzlswf6nJ1n4W0YbBn/gIp3A/FFMk13OCnZ0pSibKsYyYyPRqFZSZywRFcH+mcDeKyaFnQc6AsNy/hGKfZlzuQZamC4noKHf2azczraBlJtZDPJ2DSMsQoLk/oRWtylbxwSFEoYi9muTwxZbm8tk/ER0HRWAG9hAir01RyI64GaqTmxTan0p+J7FGxBSWw2HqisioZ0iGcvktSLEgrqGrELYQzF4LmQjoBmEcCPr91dvGHp+Le0Zu5w4sdw3iAMoKZsb1cH/JkMd7nQCUBGWE1hS/vu9ak3twNdzO7eE9UqxWQjzs+oymSr62qSofpoZTZbmOwtnwnGuzFAMzrk5/DomlUzjRLYG8Kagi8wb9GHd2ve910ivvZg7ijmizhJ0v3Tqno5xroFSYtAGsM/9v872gJphiyVvMibB9JfSnaDLBfZ2TKyq/uvngQlOHrbPUu7b8dUmj0MkYm09dfMuX+IH7V2q5capz68f9o6GehMe1aPOZffD5p/UgB6EolKVOiB2S5IfHgdPfa8PrRm/J2UuxO25b2B8+xrfu36YEiWOWo06yN6/fDK3QwjPcqor6xDAZzVqPbZsd/zupEUcJY5C4yJOJI2vn/f2kzGGmYlQ5TZjWLgPbpNqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(316002)(26005)(186003)(83380400001)(8936002)(53546011)(6916009)(6512007)(54906003)(9686003)(508600001)(2906002)(33716001)(85182001)(6486002)(38100700002)(86362001)(82960400001)(6506007)(5660300002)(8676002)(4326008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhFWDdNQ3Foa1ZyNGZLVHI0bUc2VFYyRjdiQTl5SnJGeHltZjJ2WElBOVhG?=
 =?utf-8?B?aHk2KzdaYWpBdGd6c1Z0Nk5jMTRPYXBJbFFNQWVtdlQ3elVWYzVOVUM1cXpQ?=
 =?utf-8?B?bUhqcXYxajVhbDNoc0toc3RTUUFDek9kSDB0ZXg4S1BWV21KZ1pSa1Nkb053?=
 =?utf-8?B?MENrODBuZVNEczl4Sm4yVHJGMllKTVhlalJ5YWc3aVZtVFhYWkVvZzZOU3V2?=
 =?utf-8?B?dFBEQnZVVWtncjlDTXpVdWlnWXJlKzhReEpTRDJSYWo1SzA5N2ppM0RuK3k4?=
 =?utf-8?B?L2VQTW40MS90cjVxMVNzNUFLaStWNml2SjZmRUNKbjFiL1NCd2VZQkZVSE10?=
 =?utf-8?B?RHhTWjFjMEN3NDVYanJiZDFJL2FXbWliUXVWZU1WUHpDM1pzNERSUVhnMGo1?=
 =?utf-8?B?Q0dJM2VNVDhDRFNqSmlOUlFkdFZlMm5VMW1qVWxPK0ozdDRjaHBYVHphWFZl?=
 =?utf-8?B?ejFkOVhPbklUMDBkcDd2dEJNT1UzL1F6U01NaGxVZXRKVzd4cVFPQm1kSHF6?=
 =?utf-8?B?S3pVZEovekZnVFMrTmhjNkx1Y21VVkdDK2ZkN3RzdFZ2T3ZYTDNNaDVrUG9y?=
 =?utf-8?B?dlI0Q2QxczNZN0hoZ05ZaGxtc1lKOXY0VkVtakx0bWJ4NjdySGdkYnR1TFdL?=
 =?utf-8?B?LzNMZkxzbGpQYkFjTm1hNmJqalppOVZPMXU3T3VlTGtNb2xGMDRVYUgySWln?=
 =?utf-8?B?OHU4SHdKbThDTElzVXMwWVk0d0xSUEI5Q0FxdTNnMThZYUUrV1M1OG1mQTQv?=
 =?utf-8?B?MzlmSnRSMVROcC8yQ0tpeGFsRHJJcFc0YldDSE5pNXNiV0tuWXVScjdVQXMr?=
 =?utf-8?B?aDU5Q09yQlhrWnZrMUlxZEJnWW9henVqZTllaTBOeTdwTXhDSGZ2OTdQeG9s?=
 =?utf-8?B?R3N3QkJYT05xdXRGeG1KbzU1YXlncWxCOUlNNkRoTjJPbWZZckZxVHVBUW9i?=
 =?utf-8?B?ZUlXZEVxWE1xVFMrTHo1SlpRYTFDazVnM040SjFUMGNySmRTbm9ZNmpldVZH?=
 =?utf-8?B?QmI0cEZhUTZMSTJNVUhnOXpZb1BtYzU0cUUxR0NBaVQ5MkFDSUdva2hIempQ?=
 =?utf-8?B?V25aVmlrR25IL0dqUStGblEyZU1HWCt5bGpIWWc2REtqRXVpdHFvVzRUSkhV?=
 =?utf-8?B?S2xiWWhuOU81QmIyaU9sV2F2Q1ViNEtoYTQ4Q3RZQk02UGFEVDJpcGRlRkxz?=
 =?utf-8?B?Tjd6TE1wcmRrUzIwbjVuTTkwZGRsZFNCSmhyMGJGUllpdCsrYlkwakdGeUs2?=
 =?utf-8?B?dUhwc09xZmFOeFVVY0hseWsvZDViY05hSGs5UU8vZXIvZlBHYVRPTUxyS1lH?=
 =?utf-8?B?MzU0b25hUXNWTnFaWVJaZ0NtZUpDMnpLRU5YVktxS1NJZGw1Rzhsbkd3QTZR?=
 =?utf-8?B?TVhza0NzNEZrQmNxTUUzZHdMcVVlNUwxUUZRT2xaYmtvNVhRNlBBaDRQVVV2?=
 =?utf-8?B?cDVuc2VVeXVLT0NvS21FekVqNExBY3JMRlFMTmRYVHp3Y1BEK09Xc3JEL3dE?=
 =?utf-8?B?Q3A5OERwNWRKc01YVE8wYjV3aXI0bnUvL1pvRWxnZ25RbVJleWNZVmtMcDYz?=
 =?utf-8?B?VzYvdm4yU3o3MEI2ZnNGQmlVMHc1em51di9WMGdDZDF2cVpVZm01RXRTWG51?=
 =?utf-8?B?cG9RMEpLMDVEcm1uVDNHeXpSTUVTRkxsRGtybDN3anp2TmNkOTZDTjdFSkxv?=
 =?utf-8?B?TmtJN1owTE5RUmcwbzRSQkp6OGpWaWpoS1FWMUdQMk1FSlplOEw1VVV4K2dT?=
 =?utf-8?B?RU1JVHR5QXVDdFR0TlhQczFQN3RvZ1FIZFJEUGpGWUFsYXZ5ZDNaNnB6VEM3?=
 =?utf-8?B?YVF6NElmeDA2SU8zWm82T1VPOTVaMG5uOEl4azNSczk0SHowN2xwOGNHYndL?=
 =?utf-8?B?SGZOODlYcUNMdUVyYWx1bHdyS1prUkF4NXM3aFZGamdQOWNKQnBLWjhlMGFj?=
 =?utf-8?B?VXV3MUM3eDdOa0Q4cUlXNWxkTkU5em9nZ3FPakRqM2J2NDRXWnBrZ3R0eFNF?=
 =?utf-8?B?cC9VVWpLMGoxNG1jeGFQUXdUakZSWldyYml1Rkd3elRqanRmemd1SDhRb2xY?=
 =?utf-8?B?WE0wL0JYK2txdFliQnlKTlEwdzE2eHFpZDdIOU5XaTRMRWJ0N043Yk1lWVZm?=
 =?utf-8?B?bVIySGtmT3hoS3pNb2lMakN5WlFaT1VteGNHK2dyNWluTXlIM280aW8xaE1Y?=
 =?utf-8?B?Zy80KzJwR3lkRFhVVlBPWWpzcGs5QktXRDk2Q3VuYVBMR0lLdHJSZXpTOGQ2?=
 =?utf-8?B?clh6VmRidGIrbEZRVnFmaTlNK2ZCODkxU2JmMVRXb011S0dkdEtKVnFhZkRU?=
 =?utf-8?B?NDVscGJwUm5telFKUFlVczJLUHFDY3RvL1JxQiszeGVXNUh1NXl3ZTFlZjZR?=
 =?utf-8?Q?N1Dhcb+WoFG6NvF0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e83bf-9549-48ba-aba2-08da486d4dab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 10:05:51.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0P3zcOYtyPJ503fFTTvkTZuOcRQDd/06FAEIkqwNHOH/bASH+pL8wq1/0Jc+PFAuf01pSofbb7MG8zCd3Iaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5529

On Tue, Jun 07, 2022 at 09:43:25AM +0200, Jan Beulich wrote:
> On 03.06.2022 16:46, Roger Pau Monné wrote:
> > On Fri, Jun 03, 2022 at 02:49:54PM +0200, Jan Beulich wrote:
> >> On 26.05.2022 13:11, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>> @@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
> >>>  
> >>>  void vmx_update_debug_state(struct vcpu *v)
> >>>  {
> >>> +    unsigned int mask = 1u << TRAP_int3;
> >>> +
> >>> +    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
> >>
> >> I'm puzzled by the lack of symmetry between this and ...
> >>
> >>> +        /*
> >>> +         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
> >>> +         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
> >>> +         */
> >>> +        mask |= 1u << TRAP_debug;
> >>> +
> >>>      if ( v->arch.hvm.debug_state_latch )
> >>> -        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
> >>> +        v->arch.hvm.vmx.exception_bitmap |= mask;
> >>>      else
> >>> -        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
> >>> +        v->arch.hvm.vmx.exception_bitmap &= ~mask;
> >>>  
> >>>      vmx_vmcs_enter(v);
> >>>      vmx_update_exception_bitmap(v);
> >>> @@ -4155,6 +4164,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >>>          switch ( vector )
> >>>          {
> >>>          case TRAP_debug:
> >>> +            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
> >>> +                goto exit_and_crash;
> >>
> >> ... this condition. Shouldn't one be the inverse of the other (and
> >> then it's the one down here which wants adjusting)?
> > 
> > The condition in vmx_update_debug_state() sets the mask so that
> > TRAP_debug will only be added or removed from the bitmap if
> > !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting (note that
> > otherwise TRAP_debug is unconditionally set if
> > !cpu_has_vmx_notify_vm_exiting).
> > 
> > Hence it's impossible to get a VMExit TRAP_debug with
> > cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting because
> > TRAP_debug will never be set by vmx_update_debug_state() in that
> > case.
> 
> Hmm, yes, I've been misguided by you not altering the existing setting
> of v->arch.hvm.vmx.exception_bitmap in construct_vmcs(). Instead you
> add an entirely new block of code near the bottom of the function. Is
> there any chance you could move up that adjustment, perhaps along the
> lines of
> 
>     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
>               | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
>               | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
>     if ( cpu_has_vmx_notify_vm_exiting )
>     {
>         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
>         /*
>          * Disable #AC and #DB interception: by using VM Notify Xen is
>          * guaranteed to get a VM exit even if the guest manages to lock the
>          * CPU.
>          */
>         v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
>                                               (1U << TRAP_alignment_check));
>     }
>     vmx_update_exception_bitmap(v);

Sure, will move up when posting a new version then.  I will wait for
feedback from Jun or Kevin regarding the default window size before
doing so.

Thanks, Roger.

