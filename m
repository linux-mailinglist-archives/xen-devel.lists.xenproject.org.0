Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1788620CCF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 11:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439829.693907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLS1-0001vy-Pd; Tue, 08 Nov 2022 10:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439829.693907; Tue, 08 Nov 2022 10:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osLS1-0001tK-M4; Tue, 08 Nov 2022 10:03:25 +0000
Received: by outflank-mailman (input) for mailman id 439829;
 Tue, 08 Nov 2022 10:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osLRz-0001tE-JU
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 10:03:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91b55eee-5f4c-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 11:03:20 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 05:03:17 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH2PR03MB5334.namprd03.prod.outlook.com (2603:10b6:610:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 10:03:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 10:03:15 +0000
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
X-Inumbo-ID: 91b55eee-5f4c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667901800;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UKrkgbvJjhs/s0GTACIj+3gmYp8FnnnYrb+25O5DyoM=;
  b=GZ57iQTSY4Pd7RNTzal9gQirwiOBS7kD+y/qrLVd9g3fF3KCYKjXjqto
   OX/Jrx14FLnV2B0fu/X78UUmDdXxYikaHUFTXe1CELXT3MV/clEKO+i9j
   jIeEW8PMWR3Altx/ga02ZvW+iFePd5BK4drMH2SABPJC76K4VYv+KjIRb
   o=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 84390988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xugPeKkYu08au3paY4IG/F7o5gx9J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZXDqPb6uIZGTze4slOt7j808P7JbVyYIxTAJt/n01FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5A+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dsSIWgcSy7bvuf18KChbPR1qv55Pta+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieCwWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+gCdpDRO3QGvhCiQat4UVIVg8sDVKJj8S1rF+4YsMAA
 hlBksYphe1onKCxdfHtVhG5pXGCvx00VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YVKQ8K2F6wy7Pyc9JHUHIyQDSGMt/N3LsIw1yBXVQb5LEqS4k9n0EjHY2
 C2RoW41gLB7pcwW0eO99FPOgTOpr7DISBI44kPcWWfNxgB0eo+jIZCp4F7z7PBcIYLfRV6E1
 EXogOCb5eEKSJ2IyiqERbxVGKnzvq7YdjrBnVRoAp8tsSy3/GKudpxR5zc4I1p1NsEDenniZ
 0q7VR5t2aK/9UCCNcdfC79dwex2pUQ8PbwJjszpU+c=
IronPort-HdrOrdr: A9a23:pHBTOK5xvIMXMBbGhQPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gZJPh8sH7eGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cFzp/8tHNxA7dg6MLqK40z2MGXx2TGpUCLaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.96,147,1665460800"; 
   d="scan'208";a="84390988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+pP1F7wfgbgpeZlQ1XMAlFNeWM/5tP0wO9iod/e8LmeqsMfJQFOOdNbg3casEq5wvZpoGcFE3L3Xji70Z89U2ZZvrTaOLR3ddGb84FkWDQcC/L6zUcEYg1WfJBlDi7qkTCOl29bgPtX/TSE/J34+OIctLvrs4I3Ulmy1N0HMVqGAt4tf3FmkOKUIjvmO63fAtSRUnGFBeJ6Acojvrimk/OpDY4mzdR9nKCQ62bxAYm5180kSHphieLfeCB5Kcb3Sv6Yf5UqcG6Htv7A7ElsI5EVSYtnn8e6DfTC0GunofLxQWofMWZpqAJpzIhHbb7Kn/ldKvuTgq+ABvHBUWmS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aooQ3uriuBZ1XS8ErDJpsLsMEgoeYZYtKG86JL2P+zg=;
 b=f2KzYAsxffCvgqgQKl9wH6WPu5frI4n5ZRg9XDgX42ZPhmxaZNtxr0LE8MTtdyNNyy37KVXU1ubguDfFOVMrkwYUzJ2M0vpbl0i0/NB96IuHHdjMG4zU1WG25R7RKxsljdoMfOln8g/v/up3ojbTjBJ/6OkKK8/Q4VqEYM7E1EkuLGa4i9S5zt8QaZp743g7cdnTZ7oa542+swnvKXwjtV4GEOIoltMX34nya5jhj1T1lvg9NjfMJUkvZWA2XR4YywWEF/QTSVibURGYcMYgcVgAIFSSvqzlxcnVyO50Rag2hakYIQ2mHBEjQpnTgFE4gcsKJmbFPQB46zxNcerLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aooQ3uriuBZ1XS8ErDJpsLsMEgoeYZYtKG86JL2P+zg=;
 b=f39IHup2TXWacsyH2+QNPJS2YXafiTWPeIMk9NldDtTaqGLd8UPpYsXc0pXJB7mkeYTzbuAUZZQNclaBs//XFkSYtthzmyDCo90ACMQIFLXa9Ux+wEYWNNRjGuFwjbvJIIjWIxCljt2QvDIjwut8aNZJ83JBb84eJXpO4d1d738=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 11:03:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <xadimgnik@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y2opXblnpVMTIdZ2@Air-de-Roger>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-3-roger.pau@citrix.com>
 <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
 <Y2U3Zf/nCv3PlTxa@Air-de-Roger>
 <9a505567-57be-a7b4-7cab-d1d737172db0@xen.org>
 <Y2U5bmp2rsUy2C93@Air-de-Roger>
 <2c2d8b2b-e607-6d9d-b991-d1c065aac95d@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c2d8b2b-e607-6d9d-b991-d1c065aac95d@xen.org>
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH2PR03MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: c8157972-fe00-428d-80a7-08dac170739d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ow2GYPpNf1oExl6wZaRL43+771lLIM4OIxQo8qHTaoERG0nV0gU826iUCdUeWqJBuRP+a14fWfO+3kZUD/GEP+sPW+VxaOCDq3v1BKdahfQRc0G01kiNJ09G5Nx9ll9q57KquCD3FG3NN0VEZ/fKT99/Avm3rf8vHEgu8ntGMPhLJJVU56eU3vrPgjMGd5XTbF4CR/W8TQnkarOWxTkC3xzhBdLwfohhDBok4Dg8f7yetI3u6jYj1oDlNQyB0i8BwnKhFYLlz7TSlE/aPlAMM8ba+k5F10xvTo3Fm+ym+DRGp0R5iUwQM9DyTWLyhd7qYvV4B4D7du2mtzIvBbdhNu6yPMZKVcq9bFDmkn1cd79HLcLDRyoXJfKGiHCiKh7utW6JSsAKPFpXCzq/AzL3SRfOUONKUbL/db++STRk0rLs/wBjVhsgQcYeUJkIY91+TGnXroLZNelzsLjTHloLdSUxyS2V7yov+/5+JX088UELtDhpHV8ZGbSldhPZaDM55fK7XFSkV8p94SwQqSTjoC+dk8k3i/PsiTCKyIkJzz+ABgyy7D6sou1A9wsUY5Nn7ySZW3IA45HXhNxUId/T0x0Dyor7QWvrouVEvvOKXTLVWK9XDS4Se1WUChZC20ueQOTAXb78U5Ho5kdnvJBXeAaNR6TrpaHU1/FngZg4fWochiiP/jkW9ad4l1rB6SGvRoPJM7RQmdipn7l6mDre/vYP1uaA5K0RJW0iFcaOljsbwVk14wPu5UBWoO4i+nkv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(86362001)(85182001)(66556008)(38100700002)(8936002)(5660300002)(2906002)(186003)(26005)(83380400001)(6512007)(82960400001)(9686003)(316002)(4326008)(54906003)(66946007)(8676002)(66476007)(41300700001)(6916009)(6666004)(33716001)(53546011)(478600001)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxVU2lyRDNYOGZ3eWJXVGVQcDhrSHZpeVJmVi9RSVVidTh4ekpkbndOOTEr?=
 =?utf-8?B?WU5QR1JmL2pYTXJlLzFpR0NzUjhnY0tsR3RPV0NUYXREck5qc29lTit1d0lC?=
 =?utf-8?B?R29KNmkrQ2tMZjcyRWpoZk1Xb1d6UVc5YzVEY1NsL2RmVm9SazZvelZIMDFy?=
 =?utf-8?B?TmdRS1FZeDYwMVd3eWNTU0xnSzhibTJnVUFIczhKMGRHbXFxUlJTNUtHd2dp?=
 =?utf-8?B?MEsycnI2Q29mU0NZMlRBZkVFM0JSZDRiOFhUeFVXTnUzeEpJMk5PNXJjMVVr?=
 =?utf-8?B?OEpPN1dqYmUxeHhXbHVCeHdIS2R6aVFZbExXR3U0RVBtMkN3ckhhbWhpTStK?=
 =?utf-8?B?QzJDUUpISjkxbEZSZW9pM0VmQ3NxTXYxMEZuZWxHSW9JNGE4cnk5MlNMZytV?=
 =?utf-8?B?YTROeWF2cnVTQ0FzNEtOODJoUjhyeW9zaUNQVEV4NDV1a0FxZCtKVWw1Y01G?=
 =?utf-8?B?VUVmaEhtakl1Yi9tMUVsKzVhK1ZRQ2thZ2lpbitjMlFiRGtFRlk4OUp2YmxT?=
 =?utf-8?B?MU9vSVQwSzJRQlNnVGh3R1B2VjlzY3g4NHZGVDAySk51U1JLY1AwcGNJYUxP?=
 =?utf-8?B?TkxLRWV0NzYwTHpwcWhJYVdBaFp5cFBsc1J2b1htc2U2aW5QNFV2UWFuVGJN?=
 =?utf-8?B?T1VjbzdXbWZTd25IT295dHArc0ZLanU0YzVGVkFpTzJ4WlZ3RDJVN2pFZGE0?=
 =?utf-8?B?V1hGSTh6V1Nxd2ljVzd2N3hHRHRUTlN1TkJYTjdsM0JQVjhhVXBFM2V1WUNL?=
 =?utf-8?B?Y0k2aUxiRkQ1OTRQb0crU0xsYk16OG5LelZYbXFsckFYSVNSeExKL3FyVlpw?=
 =?utf-8?B?VlMwWDBtN3BSd2krV2d1RTJZYnBMVTN6Wm11QWlSUW1weEJLTU5CMTk5T3Rq?=
 =?utf-8?B?eW5BNlNsL3ZOeWZlc3pVQ1BXTGRJbUhVejltQjdyR3YvNnh2R29XMVhpVDhQ?=
 =?utf-8?B?YzI5MHVicTNZTk45c1U3ck83RGFZRDZ2WkhEQzNwVkJWd3JkelR1TjRTajZD?=
 =?utf-8?B?blBEUFR2V1lWOHBDR01UNll5djNuZXhUWTh2TmNjWDM4NndldHBFT1FHK3pH?=
 =?utf-8?B?NFk3LzJoL2ZpaFQ1N0loUDd0SzhyMmVsQTNKdExKYWtvTjh4MzJtWkljWHd5?=
 =?utf-8?B?ZFE3M1h1bzRTZzBvQkMzQ0w0dHB6QzJSSmdHcnVKSFhLN1ozM3NzMFY3Z0lZ?=
 =?utf-8?B?NUZ3a1liTnQyQzE0Vm5PMWd4cC82aHQ5VmRWRW93dWlrWG55dHpQbHBtZHpP?=
 =?utf-8?B?d0NvbHJKbGUrUGdLVHVyRDNtQ0NoNEdzTmFGcmhyRXFWa1NnRXl4ajdWTmM0?=
 =?utf-8?B?WDFldkFXTmNzZ3YzdGtuZHFJOVUvc3huRVdYejZFQURHdVFGQlVrUEVMdmpp?=
 =?utf-8?B?TmROMDFvaWZWK01XRzVhR2hvV0ozalhHaUZWOXZrc3BYWGFNdXZSVWMwNzgv?=
 =?utf-8?B?MjhjQ2JNZnExRjhoYWlCYlNCMk9ZMW5tR09rMzZVakNTM1NlV05Nb0RDVmxo?=
 =?utf-8?B?aHNaeTNRbkVVbkFURFh4d3YyZWZqSDJ0S21GZm85QTRvN1JFOTI3WGo4ZUdC?=
 =?utf-8?B?eUIzd0x4MENZR1Z1aUJna2h1RHd3V083RGE0d0tUV1h5QkgrOHZYWDNrNk5Q?=
 =?utf-8?B?K1dDZ2ZucVNGREFWTzI5ZUk5NHV4M09LSmlReTRqd1EwOUJaRGY2Y0pJc0tU?=
 =?utf-8?B?NHhzdUNISHkzZ3duelFHZFlZaDk1V2lucks4eG0raExEQ3NlUXJEUEM1ckcy?=
 =?utf-8?B?UUszZFNCQWM0OWdGNGxaQUtyRTFZbGZoTnE4SVhRWmNLQVdiTy9rS2FWT3Nm?=
 =?utf-8?B?SlpMUDkzUGcxUGtVQmtjWENGTkpDVE9NcmpjSkZDSGJTR3RQNjlxeHMzd0Jy?=
 =?utf-8?B?U09OcEl1UjhqN25kSmJtcC94b0tKVDZFOGhGODRnTE1SRFFTaytLM2NuRUpu?=
 =?utf-8?B?ZVhDc3pqRjEwS3VLMDFUbnhDWjFLU0lNSHhGU25CZWhRdWgrQW9zOWU5U3FJ?=
 =?utf-8?B?eFVpWVJXMVEvbndqT2VMVllnd1JET3IwUUZWanRHdXo5WUZ1RU5rWk9qUU1I?=
 =?utf-8?B?eDN2aFFKSk1IdzRaRUFxYjFUdVd5a2NCdE04bFErTWRnbGUzU0sxaFFNVmRk?=
 =?utf-8?Q?KtXwVWZSgyoMIcJGV7ptoEATe?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8157972-fe00-428d-80a7-08dac170739d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 10:03:14.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVyO/6S+90sDq4Onnv8PxbMRkK3LJQHyMHhVVR0LIwMWsQ1MyW9p34yFZm/DYcdPeX7mIjW58K/yq0AOK/5V4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5334

On Fri, Nov 04, 2022 at 05:35:23PM +0000, Paul Durrant wrote:
> On 04/11/2022 16:10, Roger Pau Monné wrote:
> > On Fri, Nov 04, 2022 at 04:05:05PM +0000, Paul Durrant wrote:
> > > On 04/11/2022 16:01, Roger Pau Monné wrote:
> > > > On Fri, Nov 04, 2022 at 03:55:54PM +0000, Paul Durrant wrote:
> > > > > On 04/11/2022 14:22, Roger Pau Monne wrote:
> > > > > > The current reporting of the hardware assisted APIC options is done by
> > > > > > checking "virtualize APIC accesses" which is not very helpful, as that
> > > > > > feature doesn't avoid a vmexit, instead it does provide some help in
> > > > > > order to detect APIC MMIO accesses in vmexit processing.
> > > > > > 
> > > > > > Repurpose the current reporting of xAPIC assistance to instead report
> > > > > > such feature as present when there's support for "TPR shadow" and
> > > > > > "APIC register virtualization" because in that case some xAPIC MMIO
> > > > > > register accesses are handled directly by the hardware, without
> > > > > > requiring a vmexit.
> > > > > > 
> > > > > > For symetry also change assisted x2APIC reporting to require
> > > > > > "virtualize x2APIC mode" and "APIC register virtualization", dropping
> > > > > > the option to also be reported when "virtual interrupt delivery" is
> > > > > > available.  Presence of the "virtual interrupt delivery" feature will
> > > > > > be reported using a different option.
> > > > > > 
> > > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > > > ---
> > > > > > I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> > > > > > don't want to rewrite the function logic at this point.
> > > > > > ---
> > > > > >     xen/arch/x86/hvm/viridian/viridian.c |  2 +-
> > > > > >     xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
> > > > > >     xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
> > > > > >     xen/arch/x86/traps.c                 |  4 +---
> > > > > >     4 files changed, 24 insertions(+), 15 deletions(-)
> > > > > > 
> > > > > > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > > > > > index c4fa0a8b32..bafd8e90de 100644
> > > > > > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > > > > > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > > > > > @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> > > > > >              * Suggest x2APIC mode by default, unless xAPIC registers are hardware
> > > > > >              * virtualized and x2APIC ones aren't.
> > > > > >              */
> > > > > > -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
> > > > > > +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
> > > > > 
> > > > > So, not sure why this is separated from patch 1 but stated this way it seems
> > > > > counterintuitive. We only want to use the viridian MSRs if they are going to
> > > > > be more efficient.. which I think is only in the case where we have neither
> > > > > an x2apic not an assisted xapic (hence we would trap for MMIO).
> > > > 
> > > > I've read the MS HTLFS and I guess I got confused, the section about
> > > > this CPUID bit states:
> > > > 
> > > > "Bit 3: Recommend using MSRs for accessing APIC registers EOI, ICR and
> > > > TPR rather than their memory-mapped"
> > > > 
> > > > So I've (wrongly) understood that MSRs for accessing APIC registers
> > > > was meant to be a recommendation to use x2APIC mode in order to access
> > > > those registers.  Didn't realize Viridian had a way to expose certain
> > > > APIC registers using MSRs when the APIC is in xAPIC mode.
> > > > 
> > > 
> > > Yeah, I think they predate the existence of x2apic.
> > > 
> > > > I withdraw patch 1 and adjust patch 2 accordingly then.
> > > > 
> > > Cool. Thanks,
> > 
> > How does Windows know whether to use xAPIC or x2APIC?
> > 
> 
> cpuid? TBH I'm not sure why this recommendation would ever trump x2apic
> anyway.

OK, so the recommendation is ignored when running in x2APIC mode,
which should be the default since Xen does always expose x2APIC by
default to guests.

Thanks, Roger.

