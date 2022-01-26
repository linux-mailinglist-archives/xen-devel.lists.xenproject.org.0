Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4549CC3A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 15:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260944.451274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjCV-0000aq-8E; Wed, 26 Jan 2022 14:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260944.451274; Wed, 26 Jan 2022 14:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCjCV-0000Z0-3b; Wed, 26 Jan 2022 14:23:07 +0000
Received: by outflank-mailman (input) for mailman id 260944;
 Wed, 26 Jan 2022 14:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCjCT-0000Yt-7Q
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 14:23:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7858652e-7eb3-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 15:23:03 +0100 (CET)
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
X-Inumbo-ID: 7858652e-7eb3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643206983;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+kon9qELRuDG0TRSmcbo2LnjIpnT4/apDLLh+wvYnhw=;
  b=WuvS7xxBKygZja9cwfMfyB+iu0A89hx/0gp2TdyiaT0Ts+GaMc/EG3Lh
   Abq5YgdUR6vvVggqFAk1uzkOI/4Ls1kPrx9nzOgzJdsTvR2L96/DYLhBU
   dYMFYWZpNp7jm2GTYp4J2ZsCfmansTCjRqNBOWITCxC4IgVrUHcujNnof
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GwUCZpHnzzXG9/yE04avBwFkBEEPcwrs7aCiWV5Cj7IM+V+G/BN8WkQy6qOdsEqiK+TyxMU7IL
 UvTAYA7NrafFy3t/p2JTxwC4ttHNPn2YjIGx9ZwCoXpaZhauf5xRxbX4VNTp8Cnd3kns4VV5h5
 BrZ9evM9AsKC1QaAj/by0zCWIuUN9lYye/shGDxfvwRLHtWL94DsfJ2bvng8Dcf+W2o1LxDJ7x
 /ArCLEtd6AqwD8VM+NFtHddVrQCGkHcwenzcwmLf1n6zo8fvkUz4tOfYN9J/5ch6ni0OxV5Ef6
 wsyGQvPpkk6KLXQLex5U5NGe
X-SBRS: 5.2
X-MesageID: 62801864
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3GmO4q8XLeKi+99dDRMSDrUDK3mTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zdKWTjSP6mCZGrzeI8nPNyw8UwBsJKBnd9qHQFp+CE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh7x
 4tArJ6LRj0VEaiPxt8XUkRJCzpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmdo35AQQZ4yY
 eI8ShpyMBnFRyFXJ1g+Jaxjub+IpFjgJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMSW1D6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW5y4voK4a5EGtCN7nUHWQrGGBoUQ0WtxeCeQ25QiBjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tphjAENt6EpW6tOHaHHKu+
 DqL8TkmnLpG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chTVcnlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BP
 B67VeB5vsY70J6WgUlfOdPZ5yMClvCIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjwVi9BVPo7kGfmGI/xNIPHIAhklAs/origl3yaPUe2PibJGd/pznPTBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KPndsJJtI094wIxrag1
 izsASdwlQug7UAr3C3XMBiPnpu1A8YmxZ/6VARxVWuVN48LONb2s/xHJsJpJNHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHmQlI/foIVni8jcgFC2yuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82f6md1AXe+EcCrzTmTx/Kn+N
 +xZw+ulaK8MnUpQspo6GLFulPps69zqrr5c7wJlAHSUMAj7VuI+eiGLhJAduLdMy7lVvRqNd
 niOotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Oos5JwW5gi4hkZ4O9qKlHkJpWGFL3hGWKQ7rJAKRoTsj1NzmF1FZJXdDA7w4Y2ONIoQYhV7f
 GfMifqQnalYy2rDb2E3RCrE0udqjJgTvAxHkQ0ZLFOTl9uZ3vI60XW9K9jsoti5Gvmf799OB
 w==
IronPort-HdrOrdr: A9a23:O9YQBKn+9zhLYT2x1yKTYwhaoV7pDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y5I2mePVmGJ6VNN1xMPdfNVa9Mi4kEFjiV2gPR5t3ck4klfbMkccIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62801864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VenB/nHGhBy8dosTD6ST+xZ50zFeOCcsAFwz0zE4v6NcuVzB4D53UFKDhKLaNZ6Fk551kdCKJXJBYiGpc8v6JAs+NSzNDlKESLN49w9GV15q0jleJpjPuWwBOxmHuTSZwo1jQxHyTvS5/4ewtHgWbn5zyVtfw6dZ3+ViT1WyIniSzvLkG4yT16iwd8sLgl/UlPMNp7aplitauv+BJ5Gikb9EGxAjV22MgJ+77ESrviul+SIJymrNRf3etn7krYUstl3eLQkJdorBAvAy8CN8OgqTKgZXCZsUxhJ2oiOEN5/yUXrISa+5rFJbwOhMVDgMqlV/kNqU01n9dtBvG/VovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybozYoBvp0zBAnFXuZmtXVpEzxgUtWMhfizZrmN+e0M=;
 b=lTNlbZ14sdpoXeKs1n8j9oE547npS7oDzAiq8Aj9m9QY+eR41xCXtu/xsmE3HeidRTIMSETMYtfZ5uuTCf+7tZ4SDohMmQIgx4aict6NyiRJ1FOc0DI3pbxfJEe/1atOZoBBic5OMEG7vVU6pge20mgkO8JT4hInc9HcLB9mPwijSiFiRAyonQ0JQvUr9yDaJuqxFhQ+8+oE/MVYKPeK/3pVJ0UpnF5NYh/f1vh5UWJtmfAKOo38p21UVoUU0Zu8Ebk4WUVkSqqqsp3nZFkTPs36UOgdE6i5TvTzp5FeRp4BAajxse7Lz9ZDBkLAY+6VFCByhlslyPR0yiNilHhuNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybozYoBvp0zBAnFXuZmtXVpEzxgUtWMhfizZrmN+e0M=;
 b=eweE0GJbBR64bzSdVdD21AF8HWI1zQF7rp6QPcWiPPIT/W3CzvHE6kphGO/8YhweU9JmT4oWUQuvtohmkYY/0kIgEluVtAI3wT9Bo0P16aO/uwq+RvNRJeJ6w2jQGJBFdeBrV/bhJMifimmNPQ7W5KSVAfxoCiFKRttF8kruZ1s=
Date: Wed, 26 Jan 2022 15:22:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Message-ID: <YfFZPCv4hTt51Xqd@Air-de-Roger>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
 <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
 <4377595bf97c1e317b89411af31528d8f84b2b06.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4377595bf97c1e317b89411af31528d8f84b2b06.camel@infradead.org>
X-ClientProxiedBy: MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91f4a06d-1314-4c79-7ff4-08d9e0d75a58
X-MS-TrafficTypeDiagnostic: BN6PR03MB2961:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2961E809F45E6D2CA2BFC8B38F209@BN6PR03MB2961.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S+9+4jyTgDB0sQLMjDOHfWC1rc1KyGhZzjJTygXvAWDgkaJlPfa5FALwyzWZLNZ7XUXPgCB+hwx2h13ovBx/aq+czuoXjt7qd/eZ2Ohg/shqjtyGX1qU/9tQkZCfsdq5nPe5XMnRja/IZ+7JGu8HIVC/C1Lz6p89UbR+v54CUZi4Wl07Bmqzq1UOvWnEmmDMfeoc/ntXcmQnFpD9BC98u9kRMvt5CVkCEJiO032cdx2gfBxvjHkP3O4Q73qqImrzBLK0Rcgq8GEDbu/V41WhcmX3qpuKD6Skp8XKDVlMRz30EPWbfTr+4QkblUfPsImKUyYR9IoTL3NMW5tXeQwvrHrP+L4+3CXNY4JHMUEyekXcaG4jOGjipMqRlhYps+KhkRReXG9rWrsFMTQrGRDiZVCh1W2E0v6B3uoO2iJv99ZSs0UyvJtMhN0bEH/hCuDl3HgmxXuE57DevNzuH+S2qzzlukJI8AfDVfc0oX/lnykOkbDAbwGNI0EmoPrO8ubVW9S5o/NnqjxybUmYyYWRqVTrBmKsI/gh51owlsXgoB+t9gCmr9djU+Bu3reVyXfBL4oqDkoEnMzZnQLg49V35U9zVRgbv9eDWaTrFn7XA0N8SEe0nFYr6WHbH+OY5dycZXhFXmFzPRs82y0w6QfTDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(2906002)(4326008)(26005)(54906003)(186003)(6666004)(508600001)(9686003)(6512007)(66556008)(66946007)(8676002)(316002)(66476007)(5660300002)(8936002)(6916009)(4744005)(6506007)(6486002)(82960400001)(38100700002)(85182001)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWR1bnJ1cVcwQ1lGaktOMGxsd1phUFM2YklKSzl3VHlROHA2WU1hRjBDUERm?=
 =?utf-8?B?dWtVb0p5NHBBWjIvRkhRUDRsamxpQjdBMXgyblFTZUV6SVM1SjBkUTl4WDgv?=
 =?utf-8?B?WWV2dUZBbXF3MFhMdk5MK2tyemVBUEJUU0VjWXNUZjBQWlVUaVMwclJ1VnZG?=
 =?utf-8?B?NXVkOUFQbWR5N1I5OG9MNS9hTStiOWMvcXFwL2QrbjdMVmE4OTlwMUUwTzIr?=
 =?utf-8?B?WWQvRVNCRUpaK1hUS3haQ0ZMdjY4ZWFrMmRLQW02Zk1lTkRUaFNsU0hTdGRU?=
 =?utf-8?B?dmJnNVFCczl3bnNMd3R6RmJEdkl4VjFxaFpJTEJURUtjQ3gzUG9RVEhMalFm?=
 =?utf-8?B?OThMVXhvTU1vQTBzWDVCejRwK01DZG5YVzJKN3R0N2o2UDl3ZVJhZVlueDhh?=
 =?utf-8?B?TUhzQmRZK3FOVnQ1Nmd4enJyQ01Wc1hMYitDcDkrMTAvdnhHMXF2R1p4Sll0?=
 =?utf-8?B?L08xbGhnM0J3TEU1TmpGR0syM2p6Q01zZkxQaGRyaUFmSWJRaUZqUEE5bFhI?=
 =?utf-8?B?UWxVYzBLTXJVYUdySWJ6WHBEM1ZkcVFIQVdyUE8xNHE1OWxXbU5jdUxGYllr?=
 =?utf-8?B?UkczYUdLZlB5bTYyL1JFeisvZUlCd1F1dC9CNWNlSXpMMTFvcHRkSkFGTEFv?=
 =?utf-8?B?OVA5dVowbUNnK21GQjVYR0N6SHBqa3duUWFQMTRIWjlmeWh6VXExY2hWZ0ZZ?=
 =?utf-8?B?cTh5cHQ0VEpYM09pdTdsZkN4WXJEeW5oVVlKc29mcGhiTWtCdUtFRjBuY1BI?=
 =?utf-8?B?MVRNNVFvQy9mR05GZjZob21zakZhenNLUUc2QmlXSWpnTU02SVc1cmpxN0dj?=
 =?utf-8?B?cXFTR2V4cEk1UEJ1VTRUTEc4R1YvZmJvb0grNC95Wk8wTEI0N0s3OStHMW9X?=
 =?utf-8?B?MTdOWnhSTi9SaDlVT1FZNGEzUU85R1BQY2FXcVFJYi9CM2xJUHUrYkplQ0RO?=
 =?utf-8?B?ZWJPb2pZekt6L01UbFZSR01HeDJCTnBBNmQ5dTFxVGtmQkpxc1F3NzMrb252?=
 =?utf-8?B?Q3VvOEU5Z1M4MmU5UldFcFE5ZFNZd0ErdDNzOVhnU1R2RFdNakNRdW9CMmxh?=
 =?utf-8?B?ZmJtajhNWUZMWmU1eG90QlhFdUxaWjFLdHJOSWdBbE80Q085SDZ0WnJLNlZl?=
 =?utf-8?B?bGdqZGxxM0oyRTJDMmVzeFdLNUR5UTlNa3l1R3Z2L1R4L2M2ajNobTFKd0hG?=
 =?utf-8?B?d0FUaFNYU0pjWlFQWjRyZTdPQWlES2dsS3VHdzNyYTdKV3V2M2xQY0t0aUVp?=
 =?utf-8?B?ZDl4eXRUdjVacnZtMGV2ZldReXNsN3JZOTJDa2RxU01qUFdGWU50U0NSczZo?=
 =?utf-8?B?eml4Y2dZVFpjQ0lNbk5BQXhIakVNNktTNWpoWjVIZkdvUVdCVmlEL1VoWUhy?=
 =?utf-8?B?ZEFpUzdxSk1TKzNCWGZnd2lwQnREWFNzWFdsL0dvYmZ0aTZOczg1WXZITmJJ?=
 =?utf-8?B?OC9SQzM2OVN1UTh5anZIS1JXYkMyNTE1VGt0S2hvTmhEbEh4OHhWdk5VR0xF?=
 =?utf-8?B?Uy84SGJDa0I1SDlnQVRKTVRuKzRteHd2N2N1MDQ1blZac0JOMDFlaTRzYnBY?=
 =?utf-8?B?Ym5VaVR5KzM4cmQvdUlVZjJqOS8rYzFqQjlNUlRvanlPRDlTUVNHOTY0cVJr?=
 =?utf-8?B?OU5NeVNvTkgvaG92QStaQnRPczJ0NS9iMWJEeDBsRTRpV25vUmIrVFlsb20x?=
 =?utf-8?B?K3R6SEFpcXRqckZuS0ZvY2N0c3VrQ2h4SGFHNFFGTHBCTFZxU3VkbEVDelc4?=
 =?utf-8?B?ak5yVEZDaWU4TksyUHhnUmtIUGJDT2pNOGlVS0t4UnpHdFJxZXIyV1lRSDBY?=
 =?utf-8?B?OGJxc0l3TGI3SDYzV21zYmkxa2h5S2FYM1ZweW82MzBvSGhGVnJpTHRmK0dY?=
 =?utf-8?B?YlFyTjBRUXk1djNNY3RYWVE5REFGS0trMEQ5d2dFTHM0b0ZJSjUyTzFHaUI3?=
 =?utf-8?B?dGo0a1ZtMlJUSmVoQ3hsVjRtNHRSQmFrc1M0WktTSGF3Z28wV0RPNG9lOEsz?=
 =?utf-8?B?Y0N5WXkxb3ZHMXFHa0lxQ3JzRGpGZzZhOHhCTGFOS1BoYzFHcDg4akpuRWNy?=
 =?utf-8?B?SXRDaCs0S1c3QVp5MUJVMDYwMkVYZUpRM0lscFRkNHlyWmtpeUJ4VndzZk14?=
 =?utf-8?B?WnNuREo5SDFnaDVwUExZbzB0NHl5UHQvQzBseW1EVjBZei9FT1M5ZDZIYmVK?=
 =?utf-8?Q?UijFayHMlnzX1Zh80+w7PQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f4a06d-1314-4c79-7ff4-08d9e0d75a58
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:22:58.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idYdN6EqUPu5iZu1Rzpd/2Ca9/4ipO7uuw0Lm6uOYQIkM6W9L2Z7nqPo27E3Tv8ZayDCRDfRIS67UU5zE2chFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2961
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 01:54:26PM +0000, David Woodhouse wrote:
> On Mon, 2022-01-24 at 14:47 +0100, Jan Beulich wrote:
> > Because of also covering the IO-APIC side, I think the CPUID aspect of
> > this really wants splitting into a 3rd patch. That way the MSI and
> > IO-APIC parts could in principle go in independently, and only the
> > CPUID one needs to remain at the tail.
> 
> HPET can generate MSIs directly too.

Indeed, but the emulated one we expose to HVM guests doesn't support
FSB.

Thanks, Roger.

