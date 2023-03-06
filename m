Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDDE6ABC27
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506874.780077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ82H-0002lb-G3; Mon, 06 Mar 2023 10:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506874.780077; Mon, 06 Mar 2023 10:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ82H-0002jD-D3; Mon, 06 Mar 2023 10:25:41 +0000
Received: by outflank-mailman (input) for mailman id 506874;
 Mon, 06 Mar 2023 10:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnE+=66=citrix.com=prvs=4220c523c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pZ82F-0002j5-Pt
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:25:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b129387-bc09-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 11:25:37 +0100 (CET)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2023 05:25:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5725.namprd03.prod.outlook.com (2603:10b6:a03:2ae::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 10:25:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Mon, 6 Mar 2023
 10:25:28 +0000
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
X-Inumbo-ID: 3b129387-bc09-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678098336;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=To+Q6vplXy8M6Sr7Lf0mExWRChDCvip4MpaD1uk27k0=;
  b=bJhy/wnjjw0olKWXfELWkDV2lZn41u9UtfexlCE4hFoy190uopFy8H7q
   i4/f35ZoPlZjq0Zx4yU/OTxYTeh7VcPkU0Qc0NL102Ksm6d7CrIh0/Xx/
   sKg0czNKb9nGtwWBrEiW6Zle72YqpGMLMnD2k+K7ak4OE7tImXWf3/GOp
   o=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 98466576
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ycqNhKkt7o9eS4g9ALRtMgvo5gxhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXmjQO6zZZWXxeNgkb4zk9B9SvMLTzdM2TgFkpSw9ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5AGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dofcy0AT0Cfu+27zpyyU9VKoectCfC+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDROHmqKM13jV/wEQ2OTcmbQee/8Wpj2m6RdFOK
 X5O6yox+P1aGEuDC4OVsweDiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaMiEPIWgPTSQNVwcC7p/op4RbphfORdZqFOiylM/4HRn5x
 jzMpy87750IkcMF3qO8u0vbijihopzISA8d7wDbGGmi62tEiJWNYoWp7R3X6KhGJYPAFl2Z5
 iFcwI6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:1z/kW6xoUSVskEY4i45kKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWE6wr5J0tQ++xoVJPvfZq+z/JICOsqXYtKNTOO0FdAR7sM0WKN+Vzd8iTFh4tg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.98,236,1673931600"; 
   d="scan'208";a="98466576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGOr2Gw1kvJB+Xo2i59tI2wJz9cp4O5E3xo7Eg+eYb+GMpbVUaqL7gFluloQIKfPoqTf2d6U/sHqwG6tlLtDmKBYuHIsaYUU/fRnRi8RoVjc55SZlA92WbxPTqrIGnD3oxbftFD2XpAP068pIFo85BRJDQfnRnVm+aGdf4Gbd6uS4n965Ch3Sj0OBA06BeFW0eFOgwqjHKZ1/JnXzCIzJmOlX9JM58IuFdBW1cET39rN91W9pMGWT75bwkECG3G8gGvIqjQE3bYf9G3VhweoRssnv9THGM8O7pJEIEYl8cCnbqrR999On4BXQI0qs1BtWphh+cZl7NQClocree44GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKaD0CLrMZ6aX2Z3CEuXe/uO4dawKUVAmhZZrz1Qul0=;
 b=Ga0xeTA9G/kYYo0TXK4+FQW6BOya62vh6WHIM1s4wh3AnZKsrykYK7AlHHWaHn833lJcb2ejEShimJ5aCTeDAaXNT2WjGxex/mqy6iusRcVznb/kEVn/8kY78ZP9XFd4IUcnuf01cHeZ64f/fyLeAzbbFeIySkf/vlzpCI6NxYboJGP4kV+nh5N/CdEHRWY6ZnY49affJ0omQRTJl0BXJYku3LxM0LXG2oqVEzZEmemHDyy2Z2xkL94Kcw8KnkZxcl7L1L5SA0X937ZA8uyqzM1V/WNy3bk57EPEUJbScaxdD3iDPKJiVYNgmuWIK1r8L0JYUSxnCbFZwjA7hjEa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKaD0CLrMZ6aX2Z3CEuXe/uO4dawKUVAmhZZrz1Qul0=;
 b=v6lTDpIsXvpu2S30rMOz9a0QMb2nR7+3NEoQV/2nXBtsKQwiNVoO/Ch/repIrBRaAI321tzxCM7vNiAYKbKw4y0JjDf76Q1pavPJdihQqFk2lEFfOeBEBiJnradoVAetnyrj4yZNC9jp6rxcXWWlfdIyny0gvlX5i4Ty7ETzprU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <290dec66-c5a5-0609-f95f-7e3bcfd3fc94@citrix.com>
Date: Mon, 6 Mar 2023 10:25:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: cardoe@cardoe.com, michal.orzel@amd.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
 <20230303235719.1181690-2-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230303235719.1181690-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0630.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: be47f139-d9c2-4c08-2885-08db1e2d1aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5CQ0kOvvolzhDwCxb9Fqa/WbSJfv96UfZ+xZPljAAH3SvXgWsO7BcLd3uZL2inS0L9OMbWKgCh5MyGuF+NPjC1aL9WFlTee+jVzg+VP4Mhhjuiv/pCgnQ1lcWCqiFD800Zw27nkIM6tprZ05USlcZ3k7XMNnX4aN1RNdhNAsdwvcbYwaKbtagKpK/R0hClSeZhbnEUNy9uzYpaSc4robbZDwJuNRUsvSVz/DrqzVO5mEWn9OWY7JcYwnjVFmIl671KDtifq+3VFRrGw0XCFOeULOXChFFbt26u1Cyuwh++w3b7pfUFg2ey9HeQVdIn9j6dNt8w6lu3y5HzMnCL1FfW/o1U0DW0I0fqapmUsgTXXqqoxt22dwfY3UwaObShrtd1kpSZ9qtkX2Zvk2lfdbbT1sMvx9WLjxNHM4YFpci4dgYz6Iw/019t0Fwv/n2uHPlVlF/0oqspgJhKBup8iSVTfn4jDc4SVh9ZTDgVRo8xUI88oz69TZWy7te4FssRZ0zi0YZpzs2MH+RKuWcPE1gzmdNMAvIFtd4q9FiJLQS8bDW+chsJq1bhZ+urEWG2hZftQuGBqIiVMDAmHk9ZCJxZNaUZYQLFn5XST1ksFODaDOpZAf41+3O/qhRutAvyyVEe1cLXR9K0TbdMmJjvv1NLmMdVpxd3Y4N405ExfKfuSDOcvYtuSQnpEzXP2Bh/Zoj4q0kLUc29Rag3EnVtuyYEaJUuCszQNi4/P207ptkYTEfMHDewCDNFA96P2WWLS9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199018)(31686004)(36756003)(316002)(83380400001)(31696002)(86362001)(6486002)(186003)(2906002)(4744005)(5660300002)(8936002)(41300700001)(66946007)(4326008)(8676002)(66556008)(66476007)(478600001)(6506007)(6512007)(26005)(53546011)(2616005)(6666004)(82960400001)(38100700002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RURBeEVRMTV0b2xlalVvRFNzVU1GUXlaTm5aY3FZTDdqOExLb0FrWWo2clVq?=
 =?utf-8?B?N0xmQzU0MnExcFJCdktsRmhES1IwWWVzUEUzSjg5YzVOaUxYTVNDUk1IQi9u?=
 =?utf-8?B?K1BxcWVoZms2Y0ZPb1lOejgxMnV1eTBoYlIxOWN6L2tUYjBjc01GRkpEa1I3?=
 =?utf-8?B?MlhCTEgvR05oTVVhVUZNUVk5Wkp0K1FqMzNXQ0k2ODFOY1VaYVZ5WE5JUTND?=
 =?utf-8?B?bTM4ZytLSHRQS3A3WU05cEhSYkZVQ0JES2hndjVkT2tTbEdJODl1Z2NQRzFE?=
 =?utf-8?B?VkNtd3dvMUlSTmMzQjZxLzNhQ2wyUCt3Q1lZS00rZDhwT0Q5N0cvR3A3WWFD?=
 =?utf-8?B?WGpwTzEvZ05hN05INXR6MGJpZTN1S3FBaVMwYVYwWHYxR0d1eHUvZEQ2OCtw?=
 =?utf-8?B?MDJBTWdka0hwdTFCQ3EveFR0eGNrNU5RZVB6WFNRU1hFZy8vUTRzTmoxeFZk?=
 =?utf-8?B?WHNBbTNjTDNZZHhwN0d5VkJrWHJLZDlLL1lyN2NiVFArQUYzbUNJWlByenRt?=
 =?utf-8?B?emM5UncwT0FzQnBsWGhINjBsWVBQK01yWnpWNzZLTXBhK2N4QmhjYU9SVmhK?=
 =?utf-8?B?LytyMjJ1eDdCQTRzS0ZPb1lXTGdna1owVnlhS05saVNYQXlWeEpSVFF5V2ZK?=
 =?utf-8?B?Tnc0UTk0c1ZFNW00NjN3bGpNL09mSG9CYnQwd1I3SDl2Y2RvTWUrRC9Od214?=
 =?utf-8?B?azM5dVU2UGJKMUErck8yOXNuWVJTL0NMM0wvRmJKczJqWDJ5OWMyYXo2b09Q?=
 =?utf-8?B?Tm9LZUltVlVUUnBNZWFxNk1CT1NyTi9wSWFQbTd2TDhzS0ljb1lYTmdxcFYy?=
 =?utf-8?B?NnFkbFVmUjFMbUt5aVo1ZGF5VE1hRkM0eXlYdGNSM2gycG5EeUtJVzV2Lzgv?=
 =?utf-8?B?bXFVWFU4VExVMXdYZCtraFYvUDAraDR6T3p5MDNMdWNUNDF0MWNHQUhQWGpz?=
 =?utf-8?B?VmZvLzMzT1dXL3lyWkNSZ2FsV1VFY3hYN0lxSXJJaUp6MExIUlBteHd3NFpJ?=
 =?utf-8?B?SmVJd2RkYm8rTCtUbXNTMEx5TmN1M0kyUkMrVWxveFgyeWhaNFdSRDdTUjdn?=
 =?utf-8?B?VnlIMW55MkQ3dHlOZXJmTG14NUd2OTA2eTdmWDlSaGF0WGdMb0Z1Qnh2RVdJ?=
 =?utf-8?B?bldlMkNZc21LR3EzaE4rd1R3QjhtOGx4RnBQZ0lvREZZK1piZ0VhMnErZjVY?=
 =?utf-8?B?K3JMVy9qK3RoVlRVb3Q5VnBxRTJjR2JUbXhoRXhYUW9qNUNmOU94VFJJNlVh?=
 =?utf-8?B?OXpVaStPVVZmSkd3RlRBa2g3TlNaY0NMTEI1c1I5VTMvdHBZc0YwM05pNFh4?=
 =?utf-8?B?VEZwVHIwc2Y0ZlhWTzZ6eXBYengwZGUwWWZyU25DSGI0eWZPZWpyWFgyRVZS?=
 =?utf-8?B?WGZtNisrVC9sVTZDeU9lUDdFb3hOSkJ0WS9GVkFwbHZDaWdQamhBN3dyTVpY?=
 =?utf-8?B?WGdZaFhKL2toZWRnbThNZkNnSTlvVUR1aHNqNmRFU0hkZ0o1OEdhUzUxMTlL?=
 =?utf-8?B?S3N4K2tnVDRjUGdEUGp1QitwUWtuNERGSXZ6Z3dMbkRRSlZpUVM2d2x2K3po?=
 =?utf-8?B?UXdXd0FtdFFVWGxNYVludlZwM2dSZkNWdlB3a3JIZzZoRWFxUXBxTTZQcU1q?=
 =?utf-8?B?OHg0Ym4xakF1ZFNQU3Z1cVVIMDJ2QnFuYjhkRmV6T1JPTWhhSUxneENVdkxE?=
 =?utf-8?B?V0g0cjBOcy9FbU9TRytPR3FGak01Ty9KTnEvbVptbHh4cVg4WVgxd0pTTnNz?=
 =?utf-8?B?Yzh4SFkwMzNtTzVxS2lPREt5bXVhaG15NlI5QVB1MkNBVXhTQUt3ZXRoOXJT?=
 =?utf-8?B?RUpvZlZFVm9pdW1NbCtVc3Q2ZnVmVnNIYXJNekpKNk42RW0vSk5rSWNYa21z?=
 =?utf-8?B?am9EQkRUak9kTW1XZnNsb0ZJWUp3d3Q1RmV4Y2s5ZmhVRXB4M21EbzhlMFVH?=
 =?utf-8?B?WDRzbndDZXpsMUlnUEtoaURGY2xFVEpGeFNoQllMVXVDblpqOXExUlpLYzVl?=
 =?utf-8?B?QUJVM2FkdzlMWVV4eDRzQVMxdnBWQnR2R0hFZXVrY09GdTFwYjRsTlk0WXJy?=
 =?utf-8?B?UWFLQjRFeUs5T3lKWDBoTFU1R0l1a2thN2RjSHBPRTFZWmM5MUpla2FnVGd5?=
 =?utf-8?B?Nk54dnlNUDA5MzZ0Ukxkem9zUnZJRnduY0t3NGNoZ2JxeStRdkY2bGI0WXBG?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xxr0YLZ54TVtjqB0GtllRtK5Hcg6fEduje5zifs4j8G4Ff+I+kfFWXJHsv87lKpxHCyPm736W/pXxPLP6Tyrm6WcIVa9zH7jGoaeH60vNohKVDbQJgLnbvwrSYH1thDXDVCzauDWYpPmjQwiTFC93jZWDZZ8ftNuOV0yp7nWBSeltwwvAVoIl8K/0AvHxRFNXwpdMAwEF8ON8oDGkVCPM8FJtbn5IgArBa0UvZc/wvfbfx66S2i7zQgW+2pypVntEYjpIc7fNHlV42umK3MADcx24j+mA0WsNhkfjVt4/bD/DCrRwJOliYdYH3tW63NguhmwVB9I7MliZUAjJ8oc09l33mR+DI8JWNIQisnCPMtmGZbKKiQKXd7WKU7IrYZT4TlzycKwoX5yde/jj3fuiuQK5jzYFbSJG8FEQtrRNglKOZ4Kv+jBR5bDeKIVIfmHXT34cWtSv8eCfnjHIi50bqNLZJnrvrF3TPjkmNOzLJipK/2XFHI/ksIKpvSGDM4SKLDXIt0ACJFtCFWX/H3lvBtJc0ukNDHxl223nsyyP5dITadv6s7PAljlfj0sZjzhaQfYG6lMw/gnIdLsfe+4ntrdzQ917fxyKauVi9iRZKTanpx4SB94YucE2QWn3UKSO6mHB/h4Lbz2WKAUIXCtEXOZITl5brpXuHkAiwKLEkcP7rCVBc3ZE5xEXrDaeAcZ9K7fV5Nf8SHVaZFw2uAone0f4YqNvBq3FsiO7wpM5ks3cItZuWUpPnbu5o7uSeWwFfPhl9gyi+nDfmljppFlX9BVTkRMEVYYZmtajS+o4IkSPTQg8qZ69995mvfiPWcvp4u7C9OEpFnjitX7OtRunVnpY9GE9l40mp+o0FHe8sk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be47f139-d9c2-4c08-2885-08db1e2d1aeb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 10:25:28.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/Qsf+SRpGOFGhsgGkPywfbnCovv30lbIGE0mLkZNXAZq1fd0tP386ZBwPu9P0mAQj6XCAlCG2q8AwVr7YIZGoQ6gzVkZh4TRyPavaL1AL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5725

On 03/03/2023 11:57 pm, Stefano Stabellini wrote:
> +  only:
> +    variables:
> +      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"

We don't want to protect every branch of a tree that only a select
number of people can push to, nor (for this, or others configured with
the runner), want to impose branching conventions on them.

In all anticipated cases, those able to push would also be able to
reconfigure the protected-ness of branches, so this doesn't gain us any
security I don't think, but it certainly puts more hoops in the way to
be jumped through.

~Andrew

