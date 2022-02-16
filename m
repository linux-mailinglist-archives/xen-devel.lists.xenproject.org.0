Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651E4B85C8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273929.469258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHad-0007Gr-R7; Wed, 16 Feb 2022 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273929.469258; Wed, 16 Feb 2022 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHad-0007Ed-N3; Wed, 16 Feb 2022 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 273929;
 Wed, 16 Feb 2022 10:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHac-0006Q9-FD
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e511560-8f13-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 11:31:12 +0100 (CET)
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
X-Inumbo-ID: 8e511560-8f13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qxuQethwfQpd/T7pRowavpDI1K+1cW3pPru2nYffN4w=;
  b=M6sHPKZlDaNeNu3A0KUjstX4UJr0fTttHj4+oM6OZTUaAt71+1Kc9ZCG
   11RT6Vb6ly2od0RqLp1eshprAPd7I5c3pWXBBzKtuOttGiED29pcnqN5f
   tkDymR9wcchVCMLmzkqrNA6P7EAkvRHiQL8kP84moVnb3LlSl58o+modT
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5UUH/pGaBEsRVlYbTpZCdYq6JNxUhg8Jt/SXXMhMVSgSoqglBWAJscGkv0uGKOQOFztYHdrrYv
 xGcOlsA7kB6/GVZwjDCVbtPsVHNVauQ6+rU04S5JS3yES5dHiYNdMzGvohyhE8okxyxlGqmqK5
 A2iWXKU+8LrtT8U/tdYJQiKe+52+ObI70WQkanmKNjINxndjlq4Jvdch6+M4ogb01XApOYyiAG
 NSu2IDAMyoShcwUlLPmi4KLaigulYY+/F+sg8JpdIxdMCXaFrA4TGh/denCGHtpQrTX+R42KN2
 dPib3g8d3oQuQf7B451t44ZE
X-SBRS: 5.1
X-MesageID: 63768772
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eMcmuqlMvDGQ5msBefar5s/o5gwgIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKD2yEOvfbYzekeNAkaYrg9RsA7MTdnd9rQARvrCo3RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PF9i5DheCMYAqvFwtw7CERVOANfNpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr2Z4eQqmED
 yYfQQFLNS2bRSUUAQZUWZQ8rueqgH3zejIN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKWx6/pCkFCVgGsJB3U+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmB1a/LuS6YAGYeRzJMYdBgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznauZdHP+EquzJHziq+
 xbR8SUVpZQYtJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJczVzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meO4Wu9B7cJZRNGiJObharrVqzGKoC6SLzYugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UypGWPk+lmvnFr5HuVPO+szY7TmOLXwc5075uYdymVbPEetVWLdwRrxRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXZ8bQzziid5ONvHAWV2X8JfQITLPddLlJZcZ
 /IEZ9+BErJITDHG8C4adp7zsMppcxHDuO5EF3PNjOEXc8EySgrX1MXjewezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeKBf27YxnCy3tlftrccsCHgrOm2mB3
 AGMDBZG+eSU+90p8MPEjLyvppuyF7csBVJTGmTWtO7kNSTT8me575VHVeKEIWLUWG/uof3wb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYg3yWL16I3SA0c1ejYF3x+dU6VmsR
 0aC2thGIrHVasnrJ0EceVg+ZeOZ2PBKxjSLtaYpIF/37TNc9aacVRkAJAGFjSFQIecnMI4hx
 ut96sca5xbm10gvO9eCyCtV636NPjoLVKB+7sMWB4riiwwKzFBeYMODVn+qsc/XM9gcYFM3J
 jK0hbbZg+UOz0XPRHM/CHzR0LcPnp8Joh1LkAcPKlnhdgApXRPrMMm9KQgKczk=
IronPort-HdrOrdr: A9a23:zw2NzaCBFdlHGiHlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="63768772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIfh7YMa0TpVXz1blYI4bBZwY2rlL5JrXyB35aPVYn6p2JQ+uU5fJZA7IsHcxQCx9GMKi2hz46oU/cUXOuuwoQV90q3LRPQ+tlznnfLfTlgVcDjxWKH0s9+KIyKt+n3tjfoPWFyIrGmp4e2BLI/D4ZvfAV60T95NoQbfqK+lVPXzSBKJtcSpMhFI/heTzFS69cxKLa7ctkueA/1lBZVgtP3RwQBlp7czllOiU7oHZDNM7LcAoYgX7eq+dkS0Xp6rWQiAz0iGccJ3VUHJbGUOdodujc5uZ2RkZdSykW2/8bdV6+UxTcFhfaESNBKl760IH81aAYrqWGwy7CeiIeomhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBfiZgeoEobC8xSnV92kybukGWhlimNIsfw/oOQii3E=;
 b=AJCQ4he8iuQZaTnHzpCeZVNvdQxouBB6WDyCohKOh4UG7sBpr842JLfao0w5qlIDSLTqD+VeeU59e3LZWWoUfB5/nFvg8sDV6qg8NvC6Ng7cW3OoFN5fUPtsr47JIyr1oM3vEtjcvV7fU71kDXleIbbnWhBKhEq+ctLlpY/wkrAHTT1b6A+jtLX8gNAPzYO70+ipJHW0TvYkzwhM/FuNq6P1iAORKWVeUiD0ke38fKgY3ZNF5zZ2sZG8ay4JDYAxFtHEZ04qgi5vY5bzjEMngzJtMq1Q2paleZ0Yrsx9Ui79Vxz3zTevei8OVeTNvAt3qknVoQrpyS2w7EoR5F/4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBfiZgeoEobC8xSnV92kybukGWhlimNIsfw/oOQii3E=;
 b=U18ys0vn/HVPNPrPBFEy6ER7io1JgTzdWTT82u/42wGcpfcwbaCFRlMikwNxwMr+WaPh6bCrLYbv/c1ap8ZLOtLbDjiY6iN0mHv4JJnFBI+MygcaBbCCVKodfVKKqD0C3r2nD/u1o9WxowYj1wgOjWGJvL6VGAJ4PZOJZUX4fIY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v2 3/5] x86/vmsi: add support for extended destination ID in address field
Date: Wed, 16 Feb 2022 11:30:24 +0100
Message-ID: <20220216103026.11533-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216103026.11533-1-roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0347.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::10) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4795dab4-8efd-449e-e579-08d9f137702c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6256CD733284D03796847FA88F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YVWifTXL7IE5EOwo4WPERPxbr8F6V+r4qnEwt0ktehPM69LQQxvijuPy3EuoNXRHnFOYOyJ2oq9jlN4/Rq/Vbtxd+ktcWaFJTivvi6YtVhindWGjSRR4b+/2Z4ryZlfwfi8on9KBGqq12XiH/eFviikGwnflnr/fg6VTE573HbBBq6OS37upnliEo3OvxSONVaeCjrODS5DdJpoyuPjElkeIn+sEPeseyHYe7x/xBhufxRwRJ42oVTFrA/Wd6fsvDafhL8G8YyoD5vqWktVyx1PKzVMRX+AkxKyIbLkEI0oqegRGxdeGA2/2QCGJighOABIJNxI9WL9jf8gtozbYhocfGUJb8A0w/Up24/tgVYI3sPQvvKY77ntq5XyEppaamfzbNiAhxJA8MAulmhNgkGHx+qsGw6u1w206nMEV66087Rb2v0RqpVND0f/kgtk8FB/4fuKibXqG3I0cNt7bc0zOMwzr2WPo0nR8XLRwn1GYDhIZDIWTbTe9qA870pEnskgjB36zjaFiiaQaPIvFVHBXVhqocETYF8LnpONxGjiCzurUNDGIC9NoyZ/xE2686113roM2D+r5yj0xnBdiR7JCAKw/OzBX2T+E2LpaDsJSFADYGafmQZAyWbQHJVUoZNsos2j0Jj2pom0c9FC27A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(82960400001)(66476007)(83380400001)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(30864003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXRUbzlud0Nob2pLTDhOZmJNaE9Ld3lKVTVWOGQ2L3MraHJObFZ3eGhGSjlG?=
 =?utf-8?B?enhJZWlFMXN1NVRyYzNsWCs3MDhJalVxVjJvV1lVVTdLUy9WYldvTXBnWGJP?=
 =?utf-8?B?VEVGVjVIM1lYRi9pVkZtRExjWEEwclE1aVdjcStBb2hKZzNsVFM0bzhYMC9M?=
 =?utf-8?B?dm9SVWtINStDbEVZQXMrUU05dEsvaDB5UEFkZjJUSzRIVm80MW9KcS8xVkdp?=
 =?utf-8?B?TmxMVTJ0N2ozWXd4akZXT2hwbW1YMDhRRDR0MHNUL2hhZFFBc2hGZExoTEUr?=
 =?utf-8?B?QXdUMGNiVnA1RzNhN3pwOTYzVkVuWWRHSXNtTnozd3E5V2dPb0dHOWxHcm80?=
 =?utf-8?B?V2NMckN5LzBKeTF0MUJ5T3VYdU9DR2xPOXRKTk10dVdiVVIrbjdEQlcyZ093?=
 =?utf-8?B?aUFKaFBzWCtUMWQ1WXp2d3ZuSHJOTGRtZDVjUVRGai8rWHRMMU1McUo2S0lW?=
 =?utf-8?B?bWFXWG42aVlRKzdGYWRvMklnYkNKOXBqUi8zUldGa0tPK3FyaVA1OThPRENS?=
 =?utf-8?B?OFRFR0hpdUhrazR2eUdQZkltOGJOdG43TDdFcEJkb2ttaHF5T0FoellNQlRM?=
 =?utf-8?B?MkVURFhrUHNobnRGa0pjcGlHVWJxVWlxb093M09LdDNBZ0ZTZUxIUG9OdzVL?=
 =?utf-8?B?bDlVMU5iYitCN0Q0UnFud1pyczV2WlhJdWlhbmZwZWhDRlhwRlhOYWQyK1B5?=
 =?utf-8?B?NnFweU5aTWxhUlVlMSsvQ3AxUDBTVGtMcmg0bGVZanFoWUVpaTFXV0RYRXdX?=
 =?utf-8?B?R1dqSTdkUjRKS3dXc0VjVUNVTUlJSm9ocDE3ZmZDOE5GYzlMaE5OeTZlRHI2?=
 =?utf-8?B?U2ZxQWVLK3VtUHBkY3J2TFkzZE9adnNSM2tadEFjbmtra1NCWWN3d2VFZjVj?=
 =?utf-8?B?RnNnclhFWUtxZEJkZWNPem1kUjNJSWk3VUJ0a2dmN2RVTWd1aHVNMmhMdFFn?=
 =?utf-8?B?VW1JY3c4MUdvYlFIN1JvazI5dFhGdklkaTVBUEQ3S1BlNmRrRXZSc0kxZEU0?=
 =?utf-8?B?TlpHVEtCaDFiUEVwUWpTTDgrWGxqUzV1VEZwNXNJVVpNTVNFZHh6OFRiVGJJ?=
 =?utf-8?B?T043UUxyZjl1ZkdVUmtYKytiWTB4djAxYittY25HZjl5VUZWMWczRUxBaTg5?=
 =?utf-8?B?SEsvWWMvZ0JPak9HZjFicDNQUHR3eHhnYlJnUUVyWVBFYmhJb1JlanlGYm16?=
 =?utf-8?B?T21Ya0J6UGg5RDc5MXQ1TFpLNDdCRXBGNkhRSjhxZnlJWDlMVjk5a2dLUVdM?=
 =?utf-8?B?SkUyb3I0dDJWQUx4Zm5uWVRFMm05Zkxwc0taeFFMaDBJczExRkJ3MThudHhM?=
 =?utf-8?B?eHlmN3RvV1kzdUFFbEVnV3EzcnVvT054bkRyWTRhYUhyS241WEJHcTVaZEtx?=
 =?utf-8?B?QnI0bXlpUWFBQ2duZUpyejczZzhod2pVa2t6ZDZ2cGZNSzMzZmZWdWR4cHlI?=
 =?utf-8?B?ZUZwSHBxTk5hTDhTVjdYRWV2MFFUZFNoTWZmY2RwYWRsZ3E3TGRZWlYzM2ps?=
 =?utf-8?B?ZmhzOTdURDNyY0tGenRSWVFGVVJSeE1Nd1RvWkd6Ni9KUVlNUlRUa3RjRlNO?=
 =?utf-8?B?VHlHL0EzbCtKOXc2Z2JVcWQ3UUVwbFJhUFhCb2wzYnB3TUtURWFyYkcvcHVK?=
 =?utf-8?B?eXlYV0hrZXBqc0t2Z3dDS3dzUlZqV1dYcGw2bGs3VllVRTUzaVhoN3RhZFFX?=
 =?utf-8?B?SHEreGY4YkEzVEVML0dwV2NkZVFTNFM5aDRxWFQ2R3ZDTWZGUTYzK1NVbjV1?=
 =?utf-8?B?dkN1a1lVQWNpVCtlVGZiZ3pjWjVRYTFqWk14RVV5U2QzaDRKUXc4b29ZWUpD?=
 =?utf-8?B?K2hjL1RMbnhkN0FxMFg4QlVXVXdpTnNLM2V3WnVhQnNBTmFIT2d3RVU4M29z?=
 =?utf-8?B?eVJOcjBocDZjdSswbGlIK2dVVjFya3pZd29icWRyRW9kYmhWMmkzWk1XNW9I?=
 =?utf-8?B?SHk1ZHJnMnlMNXk3ck82RzVyVThoelRuNUJCeWk5aTRvT1p3dWhRWEtUeDM0?=
 =?utf-8?B?dHFEd0lxNUI3dTBacWlHZlpBbE9xUExlMjRwSHZwUTQ1TnczdzgvV3N4K0Iv?=
 =?utf-8?B?a2ZpbXNxeU43eS9PWEY0Qjg1eWFzbFlwajVHOTBCS3ZaeW9Wd085aXZkSlVM?=
 =?utf-8?B?eXB2VGdRenh1SHEwM1BKbXNxVVdYd1Z4Unpnbjc3WGY0WFEzbW43YlBkUnpW?=
 =?utf-8?Q?WTr+eeFBfTMua+s9ujd3QAI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4795dab4-8efd-449e-e579-08d9f137702c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:31:05.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oofrVM9duc4RJd50aJ4155qdwSeyM6/PzwtMT3n2sxyegzuqHF8Uiwq1ihL9hQ2v4Fw7qz5mK7ygWm5MPGgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Both QEMU/KVM and HyperV support using bits 11:5 from the MSI address
field in order to store the high part of the target APIC ID. This
allows expanding the maximum APIC ID usable without interrupt
remapping support from 255 to 32768.

Note the interface used by QEMU for emulated devices (via the
XEN_DMOP_inject_msi hypercall) already passes both the address and
data fields into Xen for processing, so there's no need for any change
to QEMU there.

However for PCI passthrough devices QEMU uses the
XEN_DOMCTL_bind_pt_irq hypercall which does need a modification to the
gflags field in order to pass an APIC destination ID greater than
255.

Take the opportunity to make the domain parameter of
hvm_girq_dest_2_vcpu_id const while modifying the other function
parameters. Also adjust dest_mode when touching related code to make
it bool.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do not expose extended destination ID support.
 - Use d->arch.ext_dest_id.
 - Add comment clarifying the usage of MSI_ADDR_VIRT_EXT_DEST_ID_MASK.
---
 xen/arch/x86/hvm/irq.c             |  5 +++-
 xen/arch/x86/hvm/vmsi.c            | 43 +++++++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/hvm.h |  5 ++--
 xen/arch/x86/include/asm/msi.h     |  7 +++++
 xen/drivers/passthrough/x86/hvm.c  | 11 +++++++-
 xen/drivers/vpci/msi.c             |  2 +-
 xen/include/public/domctl.h        |  1 +
 xen/include/xen/vpci.h             |  2 +-
 8 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 52aae4565f..e10e085a55 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -383,7 +383,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp = (uint32_t) addr;
-    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
+    unsigned int dest = MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK);
     uint8_t  dest_mode = !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode = (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
@@ -391,6 +391,9 @@ int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
         >> MSI_DATA_TRIGGER_SHIFT;
     uint8_t vector = data & MSI_DATA_VECTOR_MASK;
 
+    if ( vector && d->arch.ext_dest_id )
+        dest |= MASK_EXTR(tmp, MSI_ADDR_VIRT_EXT_DEST_ID_MASK) << 8;
+
     if ( !vector )
     {
         int pirq = ((addr >> 32) & 0xffffff00) | dest;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b4..4af550cc2a 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -66,7 +66,7 @@ static void vmsi_inj_irq(
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    unsigned int dest, bool dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -107,11 +107,14 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
     int vector = pirq_dpci->gmsi.gvec;
-    uint8_t dest = (uint8_t)flags;
+    unsigned int dest = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
     bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
     uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
     bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
 
+    if ( d->arch.ext_dest_id )
+        dest |= MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK);
+
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "msi: dest=%x dest_mode=%x delivery_mode=%x "
                 "vector=%x trig_mode=%x\n",
@@ -123,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
+int hvm_girq_dest_2_vcpu_id(const struct domain *d, unsigned int dest,
+                            bool dest_mode)
 {
     int dest_vcpu_id = -1, w = 0;
     struct vcpu *v;
@@ -636,15 +640,21 @@ void msix_write_completion(struct vcpu *v)
 }
 
 #ifdef CONFIG_HAS_VPCI
-static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
+static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked,
+                               bool ext_dest_id)
 {
+    unsigned int dest = MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK);
+
+    if ( ext_dest_id )
+        dest |= MASK_EXTR(addr, MSI_ADDR_VIRT_EXT_DEST_ID_MASK) << 8;
+
     /*
      * We need to use the DOMCTL constants here because the output of this
      * function is used as input to pt_irq_create_bind, which also takes the
      * input from the DOMCTL itself.
      */
-    return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
-                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+    return MASK_INSR(dest, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+           MASK_INSR(dest, XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
                      XEN_DOMCTL_VMSI_X86_RH_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
@@ -698,7 +708,8 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
             .irq_type = PT_IRQ_TYPE_MSI,
             .u.msi.gvec = (vector & ~vector_mask) |
                           ((vector + i) & vector_mask),
-            .u.msi.gflags = msi_gflags(data, address, (mask >> i) & 1),
+            .u.msi.gflags = msi_gflags(data, address, (mask >> i) & 1,
+                                       pdev->domain->arch.ext_dest_id),
         };
         int rc = pt_irq_create_bind(pdev->domain, &bind);
 
@@ -826,8 +837,13 @@ void vpci_msi_arch_init(struct vpci_msi *msi)
     msi->arch.pirq = INVALID_PIRQ;
 }
 
-void vpci_msi_arch_print(const struct vpci_msi *msi)
+void vpci_msi_arch_print(const struct vpci_msi *msi, const struct domain *d)
 {
+    unsigned long dest = MASK_EXTR(msi->address, MSI_ADDR_DEST_ID_MASK);
+
+    if ( d->arch.ext_dest_id )
+        dest |= MASK_EXTR(msi->address, MSI_ADDR_VIRT_EXT_DEST_ID_MASK) << 8;
+
     printk("vec=%#02x%7s%6s%3sassert%5s%7s dest_id=%lu pirq: %d\n",
            MASK_EXTR(msi->data, MSI_DATA_VECTOR_MASK),
            msi->data & MSI_DATA_DELIVERY_LOWPRI ? "lowest" : "fixed",
@@ -835,8 +851,7 @@ void vpci_msi_arch_print(const struct vpci_msi *msi)
            msi->data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
            msi->address & MSI_ADDR_DESTMODE_LOGIC ? "log" : "phys",
            msi->address & MSI_ADDR_REDIRECTION_LOWPRI ? "lowest" : "fixed",
-           MASK_EXTR(msi->address, MSI_ADDR_DEST_ID_MASK),
-           msi->arch.pirq);
+           dest, msi->arch.pirq);
 }
 
 void vpci_msix_arch_mask_entry(struct vpci_msix_entry *entry,
@@ -891,11 +906,16 @@ void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry)
 
 int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
+    const struct domain *d = msix->pdev->domain;
     unsigned int i;
 
     for ( i = 0; i < msix->max_entries; i++ )
     {
         const struct vpci_msix_entry *entry = &msix->entries[i];
+        unsigned long dest = MASK_EXTR(entry->addr, MSI_ADDR_DEST_ID_MASK);
+
+        if ( d->arch.ext_dest_id )
+            dest |= MASK_EXTR(entry->addr, MSI_ADDR_VIRT_EXT_DEST_ID_MASK) << 8;
 
         printk("%6u vec=%02x%7s%6s%3sassert%5s%7s dest_id=%lu mask=%u pirq: %d\n",
                i, MASK_EXTR(entry->data, MSI_DATA_VECTOR_MASK),
@@ -904,8 +924,7 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
                entry->data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
                entry->addr & MSI_ADDR_DESTMODE_LOGIC ? "log" : "phys",
                entry->addr & MSI_ADDR_REDIRECTION_LOWPRI ? "lowest" : "fixed",
-               MASK_EXTR(entry->addr, MSI_ADDR_DEST_ID_MASK),
-               entry->masked, entry->arch.pirq);
+               dest, entry->masked, entry->arch.pirq);
         if ( i && !(i % 64) )
         {
             struct pci_dev *pdev = msix->pdev;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index b44bbdeb21..37e9d4c0fc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -270,11 +270,12 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, uint64_t at_tsc);
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    unsigned int dest, bool dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
+int hvm_girq_dest_2_vcpu_id(const struct domain *d, unsigned int dest,
+                            bool dest_mode);
 
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index e228b0f3f3..9d9509a368 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -54,6 +54,13 @@
 #define MSI_ADDR_DEST_ID_SHIFT		12
 #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
+/*
+ * Use the reserved bits 11:5 to store the high part of the APIC ID, that
+ * allows expanding the destination field from 8 to 15 bits. Note this is a
+ * feature only present in virtualized hardware and currently only exposed to
+ * guests but not used by the hypervisor itself.
+ */
+#define	 MSI_ADDR_VIRT_EXT_DEST_ID_MASK	0x0000fe0
 
 /* MAX fixed pages reserved for mapping MSIX tables. */
 #define FIX_MSIX_MAX_PAGES              512
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 0b37cd145b..9c42ebe17a 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -269,7 +269,8 @@ int pt_irq_create_bind(
     {
     case PT_IRQ_TYPE_MSI:
     {
-        uint8_t dest, delivery_mode;
+        unsigned int dest;
+        bool delivery_mode;
         bool dest_mode;
         int dest_vcpu_id;
         const struct vcpu *vcpu;
@@ -346,6 +347,10 @@ int pt_irq_create_bind(
         /* Calculate dest_vcpu_id for MSI-type pirq migration. */
         dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
                          XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+        if ( d->arch.ext_dest_id )
+            dest |= MASK_EXTR(pirq_dpci->gmsi.gflags,
+                              XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK);
+
         dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
         delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                   XEN_DOMCTL_VMSI_X86_DELIV_MASK);
@@ -789,6 +794,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
                                       XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
         bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
 
+        if ( d->arch.ext_dest_id )
+            dest |= MASK_EXTR(pirq_dpci->gmsi.gflags,
+                              XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK);
+
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
                                dest_mode) )
         {
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed2..e1d8c1d6f2 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -297,7 +297,7 @@ void vpci_dump_msi(void)
                 printk(" vectors max: %u enabled: %u\n",
                        pdev->msi_maxvec, msi->vectors);
 
-                vpci_msi_arch_print(msi);
+                vpci_msi_arch_print(msi, d);
             }
 
             msix = pdev->vpci->msix;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 31ec083cb0..ba71ce1148 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
 #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
 #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
 #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
+#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
 
             uint64_aligned_t gtable;
         } msi;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e8ac1eb395..354b37ef9c 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -162,7 +162,7 @@ int __must_check vpci_msi_arch_enable(struct vpci_msi *msi,
 void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *pdev);
 void vpci_msi_arch_update(struct vpci_msi *msi, const struct pci_dev *pdev);
 void vpci_msi_arch_init(struct vpci_msi *msi);
-void vpci_msi_arch_print(const struct vpci_msi *msi);
+void vpci_msi_arch_print(const struct vpci_msi *msi, const struct domain *d);
 
 /* Arch-specific vPCI MSI-X helpers. */
 void vpci_msix_arch_mask_entry(struct vpci_msix_entry *entry,
-- 
2.34.1


