Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3144D50F385
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313513.531068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGNv-0004wx-QU; Tue, 26 Apr 2022 08:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313513.531068; Tue, 26 Apr 2022 08:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGNv-0004us-NN; Tue, 26 Apr 2022 08:17:23 +0000
Received: by outflank-mailman (input) for mailman id 313513;
 Tue, 26 Apr 2022 08:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njGNt-0004um-R8
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:17:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4937b1c0-c539-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 10:17:19 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 04:17:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 08:17:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:17:12 +0000
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
X-Inumbo-ID: 4937b1c0-c539-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650961039;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=v33cqw5ky5sHlL35G+v6bFoFFbiObpPnCXptq4QJZVY=;
  b=DzPgjWE3kCDV+wLqW6YFgdd6CYtRI7bC2EDeAEURjNzhDcyvBZlGHtFw
   Px0TogrqqFYKcW3A+iM3UILQbUiSKS07ntfy+a6hXxiPYG37jrOV2iJEb
   mWs/0rnSVph3sbRxtSh1DkiUb9ghrQ5o0JPLSdIKWoV43BbQ9tX4f+gOc
   0=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 69925523
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D1Hp5qKhO4BK3SJQFE+RWZQlxSXFcZb7ZxGr2PjKsXjdYENSgWAHn
 zFLUTyGPv/YY2WjeN92bIu19EsHuZ6Dzt5hTwFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ix867quST4xB+qWg8AhCBBiLDBiZ4QTrdcrIVDn2SCS52vvViK0htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGv2WjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2CiuKWAF8gn9Sawf5WL2yCEg94XWMoTyXczRQvgEt1Saq
 TeTl4j+KlRAXDCF8hKZ+3elncfTnif2Xo0DGbn+/flv6HWPz2kaE1sSWF20sPS9ok+4R99bb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6GAkAUQzgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YXCX+6qQrDiyETMINmJEbigBJSMH/t3irYcbnh/JCNF5H8adlcbpEDv9x
 zSLqikWhLgJi8MPkaKh8jjvijO3r5nNRyY/5xnbU2yo6A90fsiuYInAwUDD7OxLJYKQRESpt
 nkYl8WQ4eYCAIvLnyuIKNjhB5ms7veBdTHZ31hmGsB58yz3oib/O4dN/Dt5OUFldN4efiPka
 1PSvgUX44JPOHytbul8ZIfZ59kW8JUM3O/NDpj8BueiqLAoHONb1EmCvXKt4l0=
IronPort-HdrOrdr: A9a23:/KbNH6ic8FSKMCsJrISMwZG+mnBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="69925523"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuo+/hg+LXd1reBELxcvAbFpLgB+gCq5e/S5D/hUlxzSVm/GMWLEPfdfQrohIWZIFe5Pn0/mFuMa+a/YiO+YAUIDNffzxJGYkw+u7VMAAcLU0PcU1t0IRUP1KaT2SWsIjkJoiDyErWz6t4OzSE6Rgq6/aI7YevchWfgJhOjM5EzDYDvf043XTkv908O4rB23VMgMsbN8oECsQlV9H9L+lkUipRXlfcGCqedjqSPjVJVjoUPN4+GJZcThWfZ2nWz1mSdQ6rufL4hvUsw3md8kr+E+wxuhKmBY64flAMED3pY2r1sUh9R+LGSzAamS1PYuUCE5Mb/c9pJfB4aK9JrGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tB7mwREtH9hXWZOjxAw4PFbuWSk/rwMnHYktINV4es=;
 b=VXGmHsX/t+Xq0586B5M1W+TA9MDlpz7W9YOG0n3+LbR8PdTw+I71C0HmGfFbrOivh/8cV6Sj4i5GF3MN6ihDoY/YsFhNj3QVGlqoNEL0dGbBNXHwZlwlYQT8Edi54aiIn9cVf+AHZacUQ+FgTN3zrdr917MKYJlnZEfvAYhdW5I/tqR4rgmsjgECkn5RIJebQjU8DvN5TUsBeRktNQec528G+3XxwsL9R/SCLl+zzAHryET0EArFmksTOZOqE0ELU6xG7LIiDvKj8nDXN5C1bVC+c9vw3UxzPyY2mN7B6s5OepdPRimTJ6maLJLlxQTLuS6RKpGVPXHTeWIKh6+1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tB7mwREtH9hXWZOjxAw4PFbuWSk/rwMnHYktINV4es=;
 b=jLAabFM6COLcG6ql9TfYub5u0PFAhDU3fTbAGPaMm18D0rLimbqheetgZSz+IcBRH0ShCV37XpIucSqr+Na4wgd9nZotiuFVS5aLFySSDstU9hp8o0QjVdsGBT0OpTBloWspnrG7+626k1HHOk261Gx9HWsBBAdxT4BpgbjZka8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 10:17:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
Message-ID: <Ymeqg+UmOl2mN5Dz@Air-de-Roger>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <YmasHAT0YkeJVMbv@Air-de-Roger>
 <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0067.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ec7c20-8ba8-4f75-f14a-08da275d2a4b
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_
X-Microsoft-Antispam-PRVS:
	<MW4PR03MB6428408A04146D784747FE758FFB9@MW4PR03MB6428.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pm8sCyoDq+E7FAb0LG/uu9RzS87ajErgvMCxseqZUwO4SVl9GIIqV9zTrEfQOiOwvqykTC+4ANWr8wpr6NCeTFhrej8EYttZjRWs1PwDYhySrraIjpQeCpMZtVlakye7ISc2KDtoF7jK0I8Ppem2IFQT2ztU/aADjn2YY4mJtZ3V3q4xdVwPwntC21AjsvvLKtgd3yr4yrm09n04pbwexbhOiBaQ+AWtmf0gW/q09UxpAg8rlPHUq+l993tt9ax6VBduojO6wpX6yZsbwiJTRpfazJif3isHjF/9+yuWU0Dra6DGi+UrK1ESTZ52/Q9RqyXJT/xg2xYJyo0Z6eFqn1kWOtbik27rtNlmExUFERypGhGevn78/MNW5TcBLkYawEfnUnoqfqtc/oWjkodjThVBEEsqiCgr+3eobifFMH1ndgX949h0o2likUgdniY4FXv25rwNYWXrfTymYLXc91j1mu9UUYAvm0/wCGeNo8Ws5czY5EVWkDvlR9MEjiFd9FWbU/T2g9Qs2gFMCqTxYuOgxtn/TZ2rV0K6jhHbg5P4Bm201fFRqDGumqsdgCuAQAnHB0yk4YpCoPf3qTf/fpsMUOSFghldV07yvyU5H5fdJ8/aSTGNyvsNunge7vsy/yPV7bIZr9iUCgM4Wb67rzCp45s9ThEloSURSEW7gUbcMbXWapuaowjLX9yVBpRdO0Maj+HD5Xt8a7HTnRGj5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(316002)(33716001)(7416002)(85182001)(6506007)(53546011)(8676002)(26005)(508600001)(2906002)(82960400001)(6916009)(9686003)(54906003)(6512007)(4326008)(5660300002)(66946007)(86362001)(66476007)(66556008)(38100700002)(8936002)(6666004)(83380400001)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW53eVE4YzIwUUFYQVpYZXpWREVMTEl6cTJaeTZabXV0SHRrUUJKelRKd1Zp?=
 =?utf-8?B?YnpOSWVCRTFFaWc5REErd093a0RmcU9lQ2Y4MXJQS3RjTEdqNGNHQmx1UmN0?=
 =?utf-8?B?eGQ4cTl0Nm5xbk5TYUw3UFpWbTFuM0l5UTV6MDhiL3ZQTFgrTE1NNEZLcFJh?=
 =?utf-8?B?a1NDYVlLVk95NUY0dXdKOFh2NHNyK3VqaXJnTXFGSjg3Wndia3hRZXJ0Vllm?=
 =?utf-8?B?NGpBeDVUQm1tWm0vZkFUTU5lTXpuaVgrY2ZYMlFpdkY5Q09Sb0M3UnlBZUlC?=
 =?utf-8?B?MFZIRThUZUl6bTZGM2dVYUpzMm10bFhXKzNNY0lreUQxWjJhYklTb3RZaWMv?=
 =?utf-8?B?eXBJMnpLRnRQNlFMU29EQTV3WXp3L3hjMTRzRC90NzVTa1R1cFV0aVVUNmpi?=
 =?utf-8?B?MDU0Sm5MRTNqNHNKa212dTQzcS9mTkpFaS9iNkQwVzNqYnZxU0pXazVvcGVT?=
 =?utf-8?B?UnEvL1E4ckI2ZlFBYTg3aU5zcWpJYUtPVzYyMUlmTkFsQ3VhRGxnV2tPRm1n?=
 =?utf-8?B?MFJnQWtJWmtDaUl6NWFrL21QdFkvaFBYNXRkNk94aEJ3dmRCU0d4ampoTXJs?=
 =?utf-8?B?UDBpcTlhdUpkVXByOElFVVBZN2FDR1YyQmtQTjJvMm9MaG9nM3M4RkpLTmhj?=
 =?utf-8?B?YmhCcDY0eWo5WTk5K1pPa3FyVkRDR3E0cmhZdGs2bktxWGJMMzgwM1ZqbUo4?=
 =?utf-8?B?Q3pYRitOYy9mVVExVUs4aHFOQktMaFhQNVZNL08vdWozYWxKQkZyVWNYRTg1?=
 =?utf-8?B?T0hJWE51V1NDTmxjcjFWRWxxOXlLdUVSNnoxMGlkOXVzL2R3ZlRjNURvT2N5?=
 =?utf-8?B?WCtUM3A4b0oxVjFyZko0T3RaK01vaWIwd3AwRXJnV1Avd01WbjRaTWkzcmk3?=
 =?utf-8?B?QW9YQkJ6UFE0MXNhTHY5U3phciswVWZqd0syU2t2aFFhNFpFUEswMzF6NEZz?=
 =?utf-8?B?QkU0ZjZ5NkVQd1FmSlRIQWdURzhyUWxlS3lZMzk4Zll0NVoreUpqSGZ5K1hI?=
 =?utf-8?B?dHB5OUVodmdiY05DS2t3SWZkTnp0ZDRSZit4U3VFUlNESlhBU2FTMC9sQThq?=
 =?utf-8?B?Yy8vS2tOcUhYUlJzKzlsT3pDQ0RKYUxRbXNuTTVVMDkwMDZHUmw3aXVrM0d1?=
 =?utf-8?B?aHJ2U01sMm5uMXh2MGcwc2NTR3JvME01VEtXL25zVm1sZW5iZVVOS0FFMnZV?=
 =?utf-8?B?QVQ5UDlkVWkrY1RVY20yeFFOUTRzS0JybW1mV3FpYzRvNHpMb09PcEdOeGNB?=
 =?utf-8?B?VWlYS0hYNTZwQmF4UGI0ZWlNcDNGRnVCdlU3VUUwd2dhekNDdFhxamx4cVFz?=
 =?utf-8?B?SGZ3YTFHY2lXaExIK3FlQkJ5Z1Z6TGQ5aE1VQk5IdENLYzRMUU40bzVpSEF3?=
 =?utf-8?B?blMzY3VObVM1MlhiWnA4QmJjTW8wK3R3SXQ1ZkxhSDFVWGhEaHBBd1hjL1Bw?=
 =?utf-8?B?MERRZ1paZExKK3ByZDNTTm9UdWZIUWM4WXdXY3VwckRtbWhtbkNJOEJJa05H?=
 =?utf-8?B?SnY3TStyaUNrejR5cDVqb1k1MXBoa1hEOWZrNUlhRW1TTWpkUVdEc05kckN5?=
 =?utf-8?B?TWl2QThmN21qd1RHWWdEZHJoTkZzM1NJR1NSYUtLTFh5NkJET0phNjFOZmlH?=
 =?utf-8?B?bkFESzNFVkFsbExmNmVwZ09kSHJweEJIWmUrQUJIcjBvUjJueUpkUmFjcnFa?=
 =?utf-8?B?OTJDcmUrZWh2SHpoN2pmZEZSdlhxbnpIbzVkTFpTZ1ZEWHU2VzVzVXhrd3VK?=
 =?utf-8?B?M1YvbmJtby85djRZZHl0REVlb1J4YUIrdEc3Wm9KdjJzYU83MG82MXZrN1Rl?=
 =?utf-8?B?Y3BYMUh0ZWExQUZReXZDS1dqUmJVZ0pSZWV5c3pWNXRUdEZ2V3NaRnFKS0M4?=
 =?utf-8?B?MnNyNVdnNFFsYm9OMTZJdk5qZ1JvSDhzVHZaZE12MW93MkttdFlHeUNHeFdM?=
 =?utf-8?B?WmpwZWVYNWlxaFJQUlZMZHd4aFdySzI1aDU2aVZrMWFaNC8yZ1EvVzVuWUpJ?=
 =?utf-8?B?b3k3c00vQ1AxWE1Ec3ZUbjhzVU5QWERrcUhqL0dmVFl6QmpUYzFYMjVBaG1U?=
 =?utf-8?B?OWNtVWJXTVpJVUFjR0hvY1VYV1hNRTdKcnBTZE5zR2R3U3BJMWk1T3dpNENv?=
 =?utf-8?B?OG1teVdscE9oQ3ZSR003NlA3a21IUTZoN0JjcUQrYTArZTlnU0tNOUxRa0Vr?=
 =?utf-8?B?ZkhoYVdYK3NjNzVCelp6T1NsRUttcXU4b3JxQktsNU9hTXlBcUkxTVJoSDhs?=
 =?utf-8?B?RGd6LzhLQWF4SzdOQ2R2RzZuTDZrVyt1SC9XWlhkTUdhSmc2Yk9PTU5qTS9T?=
 =?utf-8?B?eXBDUTdmYVc3QkpyOSs4NmJMREZBQ2tSMUIybDdieXBXWEdNbmU5QmdSY3o5?=
 =?utf-8?Q?Cr50TH81ehgbiA3I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ec7c20-8ba8-4f75-f14a-08da275d2a4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:17:12.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8FaY5ialNLjK15jvKOD+TCFWgd6N0dadnbquIfbBRxFl8kKULNbrAnMf6tNAyXOTdvwnTThvbkA0lo14xBV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6428

On Mon, Apr 25, 2022 at 11:24:37AM -0400, Tamas K Lengyel wrote:
> On Mon, Apr 25, 2022 at 10:12 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Apr 13, 2022 at 09:41:51AM -0400, Tamas K Lengyel wrote:
> > > Allow specify distinct parts of the fork VM to be reset. This is useful when a
> > > fuzzing operation involves mapping in only a handful of pages that are known
> > > ahead of time. Throwing these pages away just to be re-copied immediately is
> > > expensive, thus allowing to specify partial resets can speed things up.
> > >
> > > Also allow resetting to be initiated from vm_event responses as an
> > > optiomization.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thank you!
> 
> > > ---
> > > v4: No change
> > > v3: Rebase on simpler approach after dropping empty_p2m feature
> > > v2: address review comments and add more sanity checking
> > > ---
> > >  tools/include/xenctrl.h                |  3 ++-
> > >  tools/libs/ctrl/xc_memshr.c            |  7 ++++++-
> > >  xen/arch/x86/include/asm/mem_sharing.h |  9 +++++++++
> > >  xen/arch/x86/mm/mem_sharing.c          | 24 +++++++++++++++++++-----
> > >  xen/common/vm_event.c                  | 15 +++++++++++++++
> > >  xen/include/public/memory.h            |  4 +++-
> > >  xen/include/public/vm_event.h          |  8 ++++++++
> > >  7 files changed, 62 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > > index 95bd5eca67..1b089a2c02 100644
> > > --- a/tools/include/xenctrl.h
> > > +++ b/tools/include/xenctrl.h
> > > @@ -2290,7 +2290,8 @@ int xc_memshr_fork(xc_interface *xch,
> > >   *
> > >   * With VMs that have a lot of memory this call may block for a long time.
> > >   */
> > > -int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
> > > +int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain,
> > > +                         bool reset_state, bool reset_memory);
> > >
> > >  /* Debug calls: return the number of pages referencing the shared frame backing
> > >   * the input argument. Should be one or greater.
> > > diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
> > > index a6cfd7dccf..a0d0b894e2 100644
> > > --- a/tools/libs/ctrl/xc_memshr.c
> > > +++ b/tools/libs/ctrl/xc_memshr.c
> > > @@ -257,12 +257,17 @@ int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
> > >      return xc_memshr_memop(xch, domid, &mso);
> > >  }
> > >
> > > -int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
> > > +int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid, bool reset_state,
> > > +                         bool reset_memory)
> > >  {
> > >      xen_mem_sharing_op_t mso;
> > >
> > >      memset(&mso, 0, sizeof(mso));
> > >      mso.op = XENMEM_sharing_op_fork_reset;
> > > +    if ( reset_state )
> > > +        mso.u.fork.flags |= XENMEM_FORK_RESET_STATE;
> > > +    if ( reset_memory )
> > > +        mso.u.fork.flags |= XENMEM_FORK_RESET_MEMORY;
> >
> > IMO would be clearer to init mso fields at definition.
> 
> Not sure what you mean exactly, mso = { ... }; ? I think the logic is
> pretty clear as-is and I don't have any preference for one style vs
> the other.

IMO it's clearer to initialize the fields at declaration using
mso = { ... } because then you avoid the memset.

> >
> > > diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> > > index 84cf52636b..d26a6699fc 100644
> > > --- a/xen/common/vm_event.c
> > > +++ b/xen/common/vm_event.c
> > > @@ -28,6 +28,11 @@
> > >  #include <asm/p2m.h>
> > >  #include <asm/monitor.h>
> > >  #include <asm/vm_event.h>
> > > +
> > > +#ifdef CONFIG_MEM_SHARING
> > > +#include <asm/mem_sharing.h>
> > > +#endif
> > > +
> > >  #include <xsm/xsm.h>
> > >  #include <public/hvm/params.h>
> > >
> > > @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct vm_event_domain *ved)
> > >              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
> > >                  p2m_mem_paging_resume(d, &rsp);
> > >  #endif
> > > +#ifdef CONFIG_MEM_SHARING
> > > +            if ( mem_sharing_is_fork(d) )
> > > +            {
> > > +                bool reset_state = rsp.flags & VM_EVENT_FLAG_RESET_FORK_STATE;
> > > +                bool reset_mem = rsp.flags & VM_EVENT_FLAG_RESET_FORK_MEMORY;
> > > +
> > > +                if ( reset_state || reset_mem )
> > > +                    ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));
> >
> > Might be appropriate to destroy the domain in case fork reset fails?
> > ASSERT will only help in debug builds.
> 
> No, I would prefer not destroying the domain here. If it ever becomes
> necessary the right way would be to introduce a new monitor event to
> signal an error and let the listener decide what to do. At the moment
> I don't see that being necessary as there are no known scenarios where
> we would be able to setup a fork but fail to reset is.

My concern for raising this was what would happen on non-debug
builds if mem_sharing_fork_reset() failed, and hence my request to
crash the domain.  I would have used something like:

if ( (reset_state || reset_mem) &&
     mem_sharing_fork_reset(d, reset_state, reset_mem) )
{
    ASSERT_UNREACHABLE();
    domain_crash(d);
    break;
}

But if you and other vm_event maintainers are fine with the current
approach and don't think it's a problem that's OK with me.

Thanks, Roger.

