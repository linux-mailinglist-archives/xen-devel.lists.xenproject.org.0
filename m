Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7354690E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 17:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346493.572308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgE9-0000A1-4b; Fri, 10 Jun 2022 15:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346493.572308; Fri, 10 Jun 2022 15:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgE9-00007x-1D; Fri, 10 Jun 2022 15:07:09 +0000
Received: by outflank-mailman (input) for mailman id 346493;
 Fri, 10 Jun 2022 15:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzgE7-00007q-Nb
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 15:07:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc08f6b6-e8ce-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 17:07:05 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 11:07:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL1PR03MB5990.namprd03.prod.outlook.com (2603:10b6:208:313::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 15:06:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 15:06:58 +0000
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
X-Inumbo-ID: fc08f6b6-e8ce-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654873625;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=gLjesH+T+vskWvkJfj6lxRgqCjz0WxAY6hopuCRcj3Q=;
  b=FRGkTXG698kcW1zeKubHvEJRM+JVlja17SD46WCcurahR7oFSPmMGTsg
   BUMq2HQEVujW6AhI5Ga/uXK4NjfeqZuIhpOunUs7IjEok5BzWdG1Slo60
   6SJHsTCYRAsWEUG+ZS18JAExgggIL/xMEOFshrGQXFxv54XPMlGJcIArL
   E=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 73336691
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5hSOHaIDBimjoqYoFE+RzZQlxSXFcZb7ZxGr2PjKsXjdYENS1DIGz
 DceW27SOK6KNjbzf9t/b4Wzp01Uu8XVm9IxSFRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Ncw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NEStIeTRi54AqCWyP5Eehp2M3xXHKITrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2RjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKkKGMG+Qv9Sawf7UGJi1N8wZbRNfnqXIGAVcFXvUuKq
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKeq2y0MC1MdWsaP3ZcFk0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:qcncgKk0cXzxlOk5sXrzR8tG1iXpDfPKimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhRYtKPTOWwVdASbsP0WKM+UyFJ8STzI5gPM
 RbAtVD4aPLfD9HZK/BiWHXcurIqOP3ipxA7t2uqkuFIzsaCJ2JuGxCe32m+wBNNX57LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HqVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW0PRozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDGnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZxB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MYiFXtuYdg99R/Bmc4a+L
 EENrCc2B8WSyLQU5nhhBgi/DT2NU5DXitvQSA5y7+oOnZt7TNEJnAjtbMid0c7he4AoqZ/lp
 r529xT5ddzp+8tHNdA7bQ6ML+K4lKke2O8DEuiZXLaKYogB1Xh77bK3ZRd3pDbRHVP9up7pK
 j8
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73336691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWaYAyPX9tWgaYTn6DEYlAzgsi4cKYfbuhgncKMqKuaR+a+0ARcuY8krHcBltd8sObP5GeeEljk5HxWQX5zFMkdyp2DvOyfyv3XNHQ4Kkf1Trs1x/V3uCFHrnAekAoDX6xZJJwMLIsArsgwCHla5gFl1gE0uQb6ASDOyUCOuCUn43DgOhAZvPXIyZuYlTJJ5j6UcnEHLU75bYwnJ1GSfKlvG4XkhsAa5sGJ5I1VErJQPfxotmcm2nxjCmgFRV0pNqCidK8lBUkRyRIpr7okvf60zfVvU9Seiicu6NzJ0UM9PeLsL8qepcElXeiYopFy0MvUfBjlsqPhVyZiKBOdpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDxbl4piy7/vppSjjPgZ0j1j3gPTXxcYrvotx+cUcJA=;
 b=UJ5DmxGH50OD7boF956SJNrpZvaS/sMMzMIVE9ittV6ZFRG0uGX+MJJJ2vLvXTtxcVfsS5A/lYxjzYf1EfkJqzO9kQuPGjSbQqAlaFGPqTpqPjlDJrUBDPbCgunqFs+eZSZJVeaKUOq3H2QoEQqxR4O7u59ZniCDo+0fsm08z/W0zTefki/FHOwLkNRwOXhmwOiypb3aT+rQ5vwcI52Eh9JGqldhCclX0EITDBoPTc2gLJLVAyGPPRQlxtO0v3Z27mGK3FpVufiYqELzDyf5hu6bxB7R3QvWdYXa8axxGQ32yCLznlYPDPmspCSn7iKzCY7V+zbHcJMi/eQPEszi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDxbl4piy7/vppSjjPgZ0j1j3gPTXxcYrvotx+cUcJA=;
 b=gvm7D6vXLJqqZenfA4FJULdAgSALwOpKBWcJAGqTdUeuPvST78UjqRuPxoxn62WQNqyfHPDp6Zr7+3Q1u6xZDHuI8Wz5aRFuoGUIOJH6QKV02/7N7eyQ9Tk8zZHDzsO10nsBgBr8JOwsAVQs/Ts+Q03FvlZmcf0oq7LR53nVlT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/console: do not drop serial output from the hardware domain
Date: Fri, 10 Jun 2022 17:06:51 +0200
Message-Id: <20220610150651.29933-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42daa9e5-950b-487f-a280-08da4af2dd9b
X-MS-TrafficTypeDiagnostic: BL1PR03MB5990:EE_
X-Microsoft-Antispam-PRVS:
	<BL1PR03MB5990F978482594853C9137638FA69@BL1PR03MB5990.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0AiRMAzlfZjOI+IjKQtnhib43t6kR0ZvVD5xrhYn9lPav0I0vFShnzhy3bDHUECx+/213URsMyZJrZwpmjF9o9NEsUmzn0fUfR5UDiSJxOtW4VUQP5s4xRqlSPe7qJD4l4Cs6J6b4PRkmJrgGhg+Dt0H7rkXf4HgOoo+Ko2kLRl6bp9jmOxWMNqLlxEgYe7qEQpj8lQ3eRvdaKYJZH0/CO23qwimiWkrhWdqxgc9uL2llEaGhoRFLvYysO05AmJ3SbkKBOdbCEnnoOhGxXpKQxIR0fRuyodbcFwmWwWd+4FtwwlJr/Is4TqmbIqhUGPHIvjWH6qBzP8FcdoANbxLnMo6dvFYEiPBCsc98J3femCwEF98eQ/GvUSnIhfEyPTsf3U7KkckXZ+6FIEQfoao/A8rlBwgPHwp+YvWklcwLDWIGZuUvVz9ZpNANtYE/5ar8kJlNijWmi3W4TJrvUPN47C6TNTi/ghbICPpT3suHjXhGKG2Avt6rBIoPCt91Kz6v3NQK37IzNNsW4sBOdTTkehGqHTG79jpcNgWSjl2xkw+oww/FEgdaFFl1kfTIykERUi7lMV+RkhmOjndwZ7ohw5QJFoKyu4o3puVY66T05KzeovA6KAbAvGV07DdCtywG8EIjydPK41pJI1odVGWIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(5660300002)(316002)(36756003)(38100700002)(82960400001)(8936002)(2906002)(6916009)(83380400001)(66946007)(66556008)(66476007)(2616005)(1076003)(186003)(4326008)(8676002)(6486002)(6506007)(6512007)(26005)(6666004)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1lrcVdIaWZnZ0JBSUk3emVKL0RUM0VYYnV5KzhPUGpOODBVSVlFVStGdFpX?=
 =?utf-8?B?ZHlCRFA0WEl4bkpwdTRhS2Rqb1pwTTlZcFdDRnFBMFdna0tsZlJtaElUTEdT?=
 =?utf-8?B?TU9sbjFaL3R6S0lFcHRzRlREM0Z5ZkxlYWZia0pqSjVpTitFekd0NVN6WXk0?=
 =?utf-8?B?YzU3UTBaMWxHUlh0RE5DT1UvVGdFdWJJR1RrNE1nWmdRN1hVQlczQUc3MVZW?=
 =?utf-8?B?NTQ1dEwwMDFsV0UxUkp4YnlLdjBvbE5PMkEreWZKU3VQWGhZQnJmOWZ6R2U3?=
 =?utf-8?B?b3lVNXhITGxoS0tSaDBhWHRyV3d2QnFoTXowYk9hTiswdU9STzdvNFdjTTJE?=
 =?utf-8?B?cWxJUkRJRUlwVVRXUzB6dmF3WnJ6dWxnYUhUZ29pMUd3em5nUVRXbUgyQ08y?=
 =?utf-8?B?enI1QWhFeE9nc2psMG1hcDNaMTNpZDhlenExRmZkR2xBUUZZNXlrdUxIWUV4?=
 =?utf-8?B?aDhHSlpMVjVPUjRHZlFMSmlOckxIbDcwaWExbnJRTmx6eHUvOElzcDNUTWlK?=
 =?utf-8?B?S0R4R2ZIU2Z0cUZ3WVdDdWdwbi9udlFRbGIxNFM3MnF1QS9mWk1BVU9QcGFX?=
 =?utf-8?B?SkRpY1E2LzY4eWZObWZaZjhIT3UwTEtwQmYzeFRjU3FxMEp3bWg5K1ZFS2lk?=
 =?utf-8?B?ZEdyY0IvUzU1emk2YWdBQUVCOVhKU0dBUDZRYmRFa2xoQWVSN0JRM3hvL1Vw?=
 =?utf-8?B?dVR1eExESmR5SjFSTmptQ0IyVE00RXh3UUNpRXA4cUZ5NGo5dzJYK2J6Ky81?=
 =?utf-8?B?dmJ3OXIvYXloSjlCRHNxVXROTUNUMkRRY2FpMTh2MmNMcVNSM3czNjRsc1hm?=
 =?utf-8?B?dDBXNG1Dd0NmTkFSMHBSQTkzU0RHd0h0QW5rb1NoZUZlekg0a2g5bllqeXA2?=
 =?utf-8?B?NEMxOElhU2VpdGxVNWUrM2RRSkZVVUJVc3MyVUtGYWJNVHNaSGduMXhjRjlG?=
 =?utf-8?B?UVl3RXVBblRtbHpuZEROMEx2WDhnZy83ZzIyK1ZXN2J4dWtjeVh6c29RNjU1?=
 =?utf-8?B?V2UwQ3hYSVlydGNsY2hPL0FUS0tzbXpwV2hGNElISUM1b0U2SWpoY3RSUHZF?=
 =?utf-8?B?dHN0QkpxTHhFbWIrcEcrNjNzZkJlTkZCM3gxY0dUaFBrM2tHQVhlYVAza2h4?=
 =?utf-8?B?N1ZnQWdRcnpFL1JDNlZndFRwRUFFVU44RURUVEJTa0t5TlJHekpZcUpWZjJk?=
 =?utf-8?B?N1Iwd2E1ZmZDcEFOYnUza0IyeitsSVFxQXNHQ3h1YmQzaWJUZ2FjSHNXMkRH?=
 =?utf-8?B?N2xjaExXUVR6ajFOSk42Y0ZiOW5rSjdlNFNVN3Z1SHpYRVhBWHZsVDNHUHpy?=
 =?utf-8?B?QmowRlp1S3dNL3pscWVQU0hxeCtnd3Zvd1pINWpRMjZFMjZFWEUwRkFZOCtP?=
 =?utf-8?B?ZjFvK1QwVzFpM2doN2czZHNrNzVhQVR0VDd1b3FjTFdENmtiSC8vRHNXNlRm?=
 =?utf-8?B?eVA3TVdGNmJSM1ExeU9HSC9JRXhrcG1lemcrMWpsNURTVTRjZCt3NXJtTTBY?=
 =?utf-8?B?SklzYVNjd05vWVVuV1g1OWEzWXRxN2JqY1UzWUJObmJPMndoYUNIa0ZjUVNn?=
 =?utf-8?B?Ymt2YlhEb3MvamsrWkFxVmYwcWdCcTcxYnNtaFI4ek9yOWJ3cmR2cEdkWHRR?=
 =?utf-8?B?RDIwdTRPVTM1eDdpclVxblhUY0RTS3BSR3V1Wm9JdnMxSS80MURnRkxtTms3?=
 =?utf-8?B?NndKMUNNOWNkSUF0eDZZT0s0UHZISkcwb0pQQTJncGd3dG9MQkQyZ29YSFhZ?=
 =?utf-8?B?ZnJCWmJacGZ2cDFXNnBPY3JiTXIvM3NlUDZINXBWb3FiSkNMTkxXS3JMaElV?=
 =?utf-8?B?MHdLL1l3M29XWDhQVGhFN1RQTEtpTFZieTN6YWFCeEVMQnV0dDFtZnluLzR3?=
 =?utf-8?B?dTRlalowSHZnWWMwTzVET2V6ZEZWS3JVL1UzV2UyNllPcDl2cDFDV2xVcGlE?=
 =?utf-8?B?TzVSK0hBV0l1cytmRWlkcXIxM25RWkxUcExSR2JUa2FWc0ptUGIyMTJDSWhZ?=
 =?utf-8?B?STdwV24wbXVYTk9uRzNCYzdWMDFrWlFhVHBBZHV2MTNnZktxWlZ1SHNYTHln?=
 =?utf-8?B?bHNwVnRvMUExNGhnR0ltZHJDb3d4SXZWVHVrMXB6YkZCL0Q0L0pCcjN2TDUr?=
 =?utf-8?B?Uk9mVjBvMWtZcU03b05rQ3ZQOXdOdGxIZWp3MWdiS0JoM2RHQWVIU09TMExN?=
 =?utf-8?B?RElTTDgxcG8rdllVSk9PN2tsUjdpdUc1UHVBMXg4NjVRU3VjdEtrckpwNHBM?=
 =?utf-8?B?bHk0N0xFMmlmbWJ0RVZGWVl5THhiVTRwYk1JdW1QV0dHVWpQNjNVSWhwK29r?=
 =?utf-8?B?ZGh3V1hPcUJEQnN0VExBRHFPL0t3T1o4eVNLRVZLZnBlem85anJ5Sk85UStt?=
 =?utf-8?Q?Cpmt6/we1VhR9geY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42daa9e5-950b-487f-a280-08da4af2dd9b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 15:06:58.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDRA+3F3NB2LWckew0C76ptc2IsOsIqPY26vCrNNHrS0xhPerO9TUYgh7OEWqweqqadSxAyppEnqK6i9e5Y3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5990

Prevent dropping console output from the hardware domain, since it's
likely important to have all the output if the boot fails without
having to resort to sync_console (which also affects the output from
other guests).

Do so by pairing the console_serial_puts() with
serial_{start,end}_log_everything(), so that no output is dropped.

Note that such calls are placed inside of a section already protected
by the console_lock so there are no concurrent callers that could
abuse of the setting of serial_start_log_everything().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/console.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f9937c5134..13207f4d88 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -614,7 +614,10 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             /* Use direct console output as it could be interactive */
             spin_lock_irq(&console_lock);
 
+            serial_start_log_everything(sercon_handle);
             console_serial_puts(kbuf, kcount);
+            serial_end_log_everything(sercon_handle);
+
             video_puts(kbuf, kcount);
 
 #ifdef CONFIG_X86
-- 
2.36.1


