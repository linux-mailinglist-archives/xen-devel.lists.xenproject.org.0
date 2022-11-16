Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCA62B761
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 11:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444246.699249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovFP2-0002N0-3O; Wed, 16 Nov 2022 10:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444246.699249; Wed, 16 Nov 2022 10:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovFP2-0002KQ-0L; Wed, 16 Nov 2022 10:12:20 +0000
Received: by outflank-mailman (input) for mailman id 444246;
 Wed, 16 Nov 2022 10:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NgR=3Q=citrix.com=prvs=31293058e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ovFP0-0002KK-25
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 10:12:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23a01dc9-6597-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 11:12:16 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 05:12:08 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6272.namprd03.prod.outlook.com (2603:10b6:a03:3aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 10:12:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Wed, 16 Nov 2022
 10:12:06 +0000
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
X-Inumbo-ID: 23a01dc9-6597-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668593535;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=U0QYsZ/ZQSzBDfIueljtW82soAW7bSRi6m2TaKuC6xM=;
  b=L+Yg/p9RiOa2mDV/I67Mz6PStgmYa1q8mZx36VHMZOePdMBSeiKe4WCs
   LkRap0ZKA4bC3oE4ALpJ7lqwG8TrYDULDedSil/hvJiov6qt6kKQf74H1
   Ey7JfLVlbxr1TEDsFj+WhfNK6qZ0EGpcvJMjrkkokNxrMIpu7Zda8pdgl
   Y=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 87465033
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nipK3K/BG7y7ZIxOq6EUDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYdDT2CM/vcZGv9Lot0aoixpE0Cu5HdmN82GwU9rXo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKkV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkVy
 dgKeQxWaivSpNyNmpW8Ve41h8cKeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+QwX2mANlJfFG+3vBax3qh734TNAwXdkLi+KeXjBKzA80Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwCGAzLDFpTmQAGcsRyRELtchsaceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9jqQzf5x
 mnSqDBk3u1Dy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:UgEgPKFrPjjRYl2UpLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD/nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MC40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFvLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/blpgR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZOfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIWiYcLQTOvNSSy5uwJzviUK1/NHwgFi/suq6SRg4eMBYYCaka4ORUTe8jJmYRsPiSUYY
 f2BHtsOY6SEYLfI/c24+TAYegiFZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="87465033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrbBSs2q75RyI89TXL4DWPqunhtvpRw2dLW8h47XZAHeUy7VGATsYS30uu90D3+faB7R3e3QJqywvpHoIdZIRZ1nLL6M7jKWiTNi+qXm7FLPTkILCCxh6ke5rtm3DxEYvNW+zAU8Q9V7Eq2R7EhyPC7R50l8xoBIo+dJ5EXRNtFPjQXYc7QOeyl1lcDFrxq1qmNsK6Hc7eiJ1gjRd3sCAqnb/uwCWgi+nCajNo2VnoK3glr/l6QlS9ief3bcpuEJ+GYPcX3O6/jEDJ7u5JgC2us0zuCzUfiqD8W29ed6XFcyxx6N+ZbvrkTsMw8+fq8080fWtVjszPdJM0j4MuSnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ysUtD3/HfB56CR1xkTIbrxesjOsMXC8HAnE4JLjOLI=;
 b=AI0YB/h19Mjik2pQGLnWshpvHiEu9OAA2RDhJ7jp+9KfoDa3N2GkiiX7B6HLuIU+P5Jsdxcg+82U4tVi7yORujqsHGM5xlZxd3vIoE6LFnvs2cOA7anUI0Z13P24rf2Pqwl44fJ+593c17N4d3TxxxARh25gpQvuR7VO37aZjq6zZwXqUacV7xJ46PtgtJUfp/wZPsRqyvMEVozMT4xgCBSbPiJ2ejX8qSDAWW7ghsv0+NEVXumLGQsElFoE0yE+PmHRDIzuj7BJ4Wb3shT0+PCz2d+7W9v+duJhhO/boILDEH441Ipj5apN4oBvtzGXa0SP6hgjh9sK1GwRkvQThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ysUtD3/HfB56CR1xkTIbrxesjOsMXC8HAnE4JLjOLI=;
 b=afG0Ful+iOIbRKETn8JmP4QmXuioypRi5mKQneHrjLXD+7CtKqSmoBSNqN32PIkEDw8gaegJuMlXDJrFbbTuuwtlN0RNpcGWfLoEgkDdV4p16KL/81aThbViZS7MezCSqmZ/Bh9nJY+dk5IMLNlrjggVnAPeWtKnGNv1h3+rIcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 16 Nov 2022 11:11:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Message-ID: <Y3S3bGaWXSmcAvAJ@Air-de-Roger>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
 <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
 <5caf3930-ea8f-6e68-326f-93cca1fa210a@suse.com>
 <51e9dd3f-59fb-a112-baf7-f96c07800ee1@citrix.com>
 <a43058ad-98eb-f558-3b21-65054e163c22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a43058ad-98eb-f558-3b21-65054e163c22@suse.com>
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f88017e-05a7-4d95-ffd0-08dac7bb0141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/DAG0yAmLcHYXpiQ9eNMwjNFInlBeForl1Hlwl3Om+ClGcoSnmS8kedaqhqdAT3+/UwjYYMK2OQJmn6sHEbhBQlzsvt3C0Zyjv7MEB4m/1Hcv0hSVxWRwEtWn9LnPx0EIvg8+QiygO1hHOESDGLJmWMAA297d0hJvKHO9LkptArrRGUHPR2wOodGtmWHFYiAL611SO2YGngvhWbZ9ntdD0ehywulP38BB/KgFvg1LnMGBgMj/j9VBZKzZ9f/MnK7oL2w6GBwP8b3gvWvLyLH/lHa3zxOQkBjPw63ta+CXTvnNWSMHLIKWUNgG4ZuhbGLxouz8QehXvAYdq6OwiuZkWdGG2OK2jXEJ6YSWrNsYG8YqxDn5oFOVdKYL4GRth5P/wEeLofpFJ3Q6sn+E3pKz6KZcozRd7hLlC3Rz2JKNnpHrCd2u5Rkcqlar6qw7B/RfuJJTGQzeMNZ5ai80yIk1zJgl+qthNpvVtn/FFIGcFuyY4KzH0D+/8GHi04zTbLNPKaDBGvhyt7VpheKtPIhX7dF4mReNrp8Zdv1IvWzePMMoyFcINkf0Q9VKUQqkGHO97DCL0vIPk7pjNttQaHRvlP0WmUSh84OmO3MHGyAIDEaqVAJaHxIv0A4dI8l7oAcfPzCkLah7k31fhIQLQun/Xh64DMmS0zXuDhBM9gmKTGTNLTq0N8mGJlSoAPNEhJ+6k9qj06vwy0geRYNyrBlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199015)(38100700002)(54906003)(6506007)(6916009)(53546011)(2906002)(316002)(41300700001)(8936002)(186003)(85182001)(86362001)(5660300002)(9686003)(26005)(6512007)(82960400001)(66556008)(66476007)(33716001)(8676002)(66946007)(4326008)(66899015)(478600001)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk84aGs2YWFyNTNzK3oxMTFRWXdjcWJwUURRTVI4WjVQbyt1SW42MWExaGh4?=
 =?utf-8?B?ZnpvTHFHM3ZJMFprQzVkeWsrQUhJVWJiVWZXOXRwMFI0dHBZai9Xd0NyRzE4?=
 =?utf-8?B?T0s0c0ppNnlWZnFGZFZhU2Z3RHZlQm0wYmpNOWN3anZVMjlKem5TWHYyVEs0?=
 =?utf-8?B?YzlzV0l6QU1VNERLSXh4MWsxWlBnWVhjeUUyeXJwR1dEVW1QdlRLL2k3QTdy?=
 =?utf-8?B?MDJxZzVDeHZoSFFqcWNBMVMwMGtmOTRFaEtLZkdJckxCcWYrSmgvd0tGUTRq?=
 =?utf-8?B?MHhNTHNOWkNQNTRWcUpRcm56R1ludUYxQUU3U1ZpdWNmM0FYeXd3aDBNdlZN?=
 =?utf-8?B?UFhFckJPY3AwS0RhYkpzaWNpTFhlalY3b2VEeUJOMm9FdXcwOEhsbXloRHls?=
 =?utf-8?B?QUpPK2RxakkzTzUzdVJITzRrMCtrNllsWER4cGRXcm9keXYvQ3c4K2hab25W?=
 =?utf-8?B?L3pwcXpRcFRmZWFHSVVxV3l4Z0QzQzB2VmZ4QmJFM3hFMXNlRThLTU9oWkZv?=
 =?utf-8?B?LzRyTDdGSnluSEc0aHJEdnRTcTNiYVllTXh1SFczczlTSlV1UG80bm9wN2I1?=
 =?utf-8?B?aTlmQTRDVDU0OU1MU3FSeEZCZk1tRnlLeENRaFYzWk9sL0NQemc5Q0ptdlNP?=
 =?utf-8?B?ODFuN3BMOUZrY2JaZ3pzN0RWT0JRQ25EclJrdDM1UEZrWW1jZFBrRzlxQnRO?=
 =?utf-8?B?eUlmS05wNk9LTUFMVFdwUTJDVDQxd0E5dS9nNUw1NkVyaEQ5U1lvRjRIOGJ1?=
 =?utf-8?B?UFFWTFFYb3YvMDVyUWx6ZXhCVmVtRkNvMUtvQzgybE5LZ0lkckJqb3RkSDVi?=
 =?utf-8?B?YzJ6Y0dYQVBVZVRJYkJWdnF2aUFHcFZFS1BpTXY2TDk5MExaRXJBK2l4c2Q4?=
 =?utf-8?B?bzg1S0FHdnVtWEFSNm1kOXhMVXU3MndZRm1uTFd5Zm1qeFZlWC9XZFRFQlU0?=
 =?utf-8?B?U1MzdU1IZjFOWktvenQ2T3dPQjAyVC9vbkV6M3FKTkRldVMxcjArbHg3RGli?=
 =?utf-8?B?L3krZEZmb1dpMDdSaEN5d3lhWjFNRHdMc1RyRlptQ21FYWJudU5LVy9lbERa?=
 =?utf-8?B?L0lDeHlleE16eXZ5bTQ2QnJFd09NZmhQaHVvRmY5QTFkV1g3T2F3emQ0RzF3?=
 =?utf-8?B?YVl2NFh2MTd1dGVQdkFGa1dsV1AwMHBEcDl1aG13cS9ySW9kbTEwUy8xSjNp?=
 =?utf-8?B?dTZjRnd2SnMzZm9VN2VmV3ZaZkExS2RoU1ZORVR0NzlXMkN0K0xhaE5MZFk2?=
 =?utf-8?B?RUdtQjhCOGVYSklRZkQrd2lBeEhxZ3hjU1VCYytQZVFEeTdNSWdmZndTbXJD?=
 =?utf-8?B?b1lCak9relk5N05yNklPdjZUd1hha01rRFQxTko4Y2tSUi8vL01BeXc3NHZx?=
 =?utf-8?B?VzJIS3Q2ekkzUm4zVFJpUFY5TkpWMTNIKy9Zc2dQejhLdjNNNG9ETlNFRUVV?=
 =?utf-8?B?WkJiME4vbW1OZENrR0hJQnVOcFh3L1BhSmpCQUQ3cENLYTBiR2VrdDBYQW13?=
 =?utf-8?B?TmlQKy94ZXFHWDg5UDhwWmdrSExXL3Z0S3kzdGhnWGUvV25hemM4Vyt5M1Rl?=
 =?utf-8?B?UFA1Rm1IazVya0t4SGJZak9VbmUrUWVtN0hSdkpSWi9TNHNrNHpxWjAvTGJW?=
 =?utf-8?B?eWh6MHZ0TGZTcGN4TkoyMDN1Z3Y4TVc2M3lmdmFISElEektodjhBYVZkWnUx?=
 =?utf-8?B?MVBFN1g5U25lbmhFRDdsa0oxK1NwR2lwN3g3cCtzUE9FOGhLS25vb09kQjRX?=
 =?utf-8?B?L1FyeHF5N016YmU0QW01R2F1TzVaNGF5dUxHa1VhaForWDBZOVBzN0FzeUhW?=
 =?utf-8?B?QURpRFB0R0JOVnNFNnhSQ0JraWwzc0prQXlKSDdLVFdBdWdxN1o1WGdVazRQ?=
 =?utf-8?B?MUtiSjdreWlnV2xEdDI3TXQrbzNVTEFKalV6bzkxRlFJL000Rjdibzc1ckJQ?=
 =?utf-8?B?NllvWEpyOFEyNWsvYmlVVDNSWWZFQ1FuQ0ovN2dYSWVYelZmbXlmSzd6RFN5?=
 =?utf-8?B?QW93dkk0V0lYbThmcW55MUs5S2RYQ0MyK1FQSy80VTFkcGVoNWVnVWYzR3Zo?=
 =?utf-8?B?VkVkOXVDQmx5R01uSmIxcDh5VXJ1ZExmM3A5eStjeDhrWnk4YURZK0d1d3B5?=
 =?utf-8?B?REx1NmpPK2tuU3ZiZmhRcVROdHlreldBNFNMOTJQd0dnalRXZXRZM3BrMFhU?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eSgiBGCOzZWiiPNockNedswWpfMvAfU+yoWgVit//7fBMhNNlHc9YLQqlE/50vzEo/2e+iNidGcZrCoE/lNAKMc2BlZMHdCI7PQ8e6Rw3mVSzYdQmnnjerGcfzlYJq0+Mz1CJWNeH5uCSyeItn6ypCG8ivFJ0CNE/lPbNnRdTFE8KkAt0XO+ZFyejBJklL8OEbkmCtBUzpepa+/UeD04/pivGZuzCZKCBsS0EG565/aTtyO/zJA178HOh/3do7nu9n+5xas50FBiRwV5ge3v1OCetVgUxdWuNm63W9EHX6xV6rASnXCxcUuioqpCmzBhlBbR2vHCglBZp4mNtouQggLoFBfVC1YUeyXhNMxAbuHFjFyRxiMEGlRRQqYMBsr0Z50Y0vnhh7kKvSPyIIKhJXFiYL9P8p6Hs8uHP6fy+Y+3zl+7WnAd/urn2V1BnpWf1M55rSQr7n/npXN57RFuzVfpaBB5FNrzhei0j1PckiiBuc78fQXRDsAnRCU3j2ORB+/sCYMoZpjxfbe4e3H/W/qP+igZfrgv6AkNMsXtmw36GU2TL0vVgfI5TVu1dmAFSQ6IZueK//6en0tVfEasPDrKFRh00K7hu1TpQrCL0tnG0Gu+vCXl98uoEFpIxcczbHTOI41zAtTFQkbmHccQPSDmKu1ixt43vXi0pqHfEuLobbrFHHmPetw+IY2ro425Vss1tetGmHcwQ7NQqxf9kQoWW/ng2FkJ5kbhHRaIeZapat2HUBOd2/l5nQGTCGfZj4/qYjYXa9SiFQDDjYyl57KLPF5PTtsa37eKY0gadyl9POrK9suKr1UC/FaOlp5M+uhy4Rs5W1KhZdcx+r+ab5nspGtVBmMZXF6QknOWCMs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f88017e-05a7-4d95-ffd0-08dac7bb0141
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 10:12:05.9741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZZdyi07QjxNGgwAAl5ppg0xINlhuGfAEpDRHm1yFEsGYRL3jufDx0P7/xVT1xRKRiZcAgvGWfAUqrog6oRuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272

On Wed, Nov 16, 2022 at 08:41:06AM +0100, Jan Beulich wrote:
> On 16.11.2022 00:54, Andrew Cooper wrote:
> > On 15/11/2022 16:44, Jan Beulich wrote:
> >> I think we need to settle on at least halfway firm rules on when to use
> >> synthetic feature bits and when to use plain global booleans. Without
> >> that the tastes of the three of us are going to collide again every once
> >> in a while.
> > 
> > Its very easy.  All other things being equal, synthetic features are the
> > most efficient option.
> 
> See Roger's better wording of "why use a more complicated construct when
> a simple one will do". Yes, generated code may be better in certain cases,
> but no, we don't always judge by that aspect alone. Source simplicity is
> an important criteria, which at other times I recall you also weighing
> higher than the performance of resulting code (especially when dealing
> with performance aspects when they don't really matter at most/all use
> sites of whichever construct).

I think it would be easier if we can discuss this in one of our x86
related meetings.  It's still unclear to me why a synthetic feature
would be preferred rather than a global variable in most cases (like
the one here, even if the variable didn't end up having the __init
attribute).

Thanks, Roger.

