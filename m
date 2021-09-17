Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851740FD14
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 17:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189492.339232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4a-0005t3-Ls; Fri, 17 Sep 2021 15:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189492.339232; Fri, 17 Sep 2021 15:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRG4a-0005qh-IV; Fri, 17 Sep 2021 15:46:44 +0000
Received: by outflank-mailman (input) for mailman id 189492;
 Fri, 17 Sep 2021 15:46:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Eq=OH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mRG4Y-0005qb-FB
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 15:46:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d4d07b8-3706-44ed-9b18-3ac40607897d;
 Fri, 17 Sep 2021 15:46:41 +0000 (UTC)
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
X-Inumbo-ID: 9d4d07b8-3706-44ed-9b18-3ac40607897d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631893601;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=PGUmvzpBb5O/wQ2yH12dj3ZbbsJPWrk2hWzsrNzemoI=;
  b=BRfOnopOZe76wLRBTyR9CN69WVOS9bWY0eoTtgii1jfvralWT7ZR8EcM
   Wmk8l1BM2ruIM2BEgo07+T0iKE70NXgBrR8EYgmzS8QPlpwSIIRt80xI/
   hUccGfJJTTsIuSQcl/qM6Yedidw/1hZZEVOBYiKNN4Q7l35whSqjaWLGE
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yR0fiyfSD5z6IqPd7DEjuanhF4Md+MKP4hQkHjTfPSCkf6ARIx70CN6o3YtDMdJzznqPAw2/cU
 b/qEMdZZXwUckdWLKL4dttPSZfTFlRRyo0lpUqsaxCTRApJCfxewlvoPaKxHf4WW9lmB3hGluP
 96AM9Vwb2YqHX6W6FE/wAfjTbm1dxR+Do9wTBMPlvUcM34/mu2safN6eJdpeqyWVrSrf7HXG0M
 JRJyY+baKy56ZvDFQe3/VxrG1tF0Rke8Dpdl0yfbrGPzjAp/vKbhFh4zpQpai3v90KvI+e/d0E
 JixZff17f/7FX7YBO3GQeeNw
X-SBRS: 5.1
X-MesageID: 52991220
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QJyoN60IRbn+jHXE5vbD5X92kn2cJEfYwER7XKvMYLTBsI5bpzQGx
 mZMWzuPM6zcN2T3e41zYIu18k0Pu8DSxtJgHVNspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrFh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhkOJ/5
 pZglZKJFA42GIjimesMAisIHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIUJjW5q3Jgm8fD2O
 tESMApqQT/8SjJKYXQ6DowBmv6aryyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcLwVELq05/t7mmq5z2YYCAAVfVajqPz/gUm7M/pTI
 lIZ0jAjpq8z8AqsVNaVdx+lpH+JuDYMVtwWFPc1gCmM1aj88wufHnIDTDNKdJohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpsLxMSH9x
 XaNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdm2X4C06Sa6rXtGh9n7+w/dPPderHlbU6
 RDohPOiAPAy4YClzXLWGbVWTeDxvZ5pIxWH3gU+RMBJGyCFvif5JNEOumkWyFJBb55cEQIFd
 nM/ru+4CHV7B3KscaY/SIa4Ec1CIUPIRIm9C6y8gjajZPFMmO67EMNGPhX4M4PFyhFEfUQD1
 XCzK53EMJriIf47pAdavs9EuVPR+szb+Y80bcugpylLLJLEPCLFIVv7GALWM4jVE59oUC2Kq
 o0CZqNmOj10UfHkYzm/zGLgBQlRdhAG6WTNg5UPLIare1M+cEl4UqO56e5xKuRNwvUO/s+Vr
 y7VZ6Ot4Aem7ZExAV7RMS4LhXKGdcsXkE/XygR2bA70hCB8MdjwhErdHrNuFYQaGCVY5accZ
 9EOetmaA+QJTTLC+j8HaoL6opAkfxOu7T9i9QL8CNTmV5I/FQHP5PH+eQ7jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRW+6pVuJgzwkuQzf5MGJyLcy2bIz
 A2RGxoZ+7XA+tdn7NnTiKmYhI61CO8iTFFCFmzW4O/uZynX92au26FaV+OMcWyPXW/44vz6N
 +5U0+v9ILsMm1MT69hwFLNizKQf4drzpuAFklQ4TSuTN1nyU+FuOHiL28VLp5Zh/L4BtFvkQ
 F+L9/lbJa6NZJHvHmkOKVd3de+Ez/wVxGXftKxnPEXg6SZr17ObSkEObQKUgSlQIbYpYoMox
 eAt5Jwf5wCl00d4N9+HimZf9niWL2xGWKIi78lIDIjugwst61dDfZ2DVXOmvMDRM41BYhswP
 zuZpKvenLANlEPNfk06GWXJwecA148FvwpHzQNaKlmE8jYfaiTbAPGFHewLczlo
IronPort-HdrOrdr: A9a23:ds0jWaOKZt6OiMBcTyT155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwO080lKQFmrX5WI3NYOCIghrPEGgP1/qB/9SCIVyAygc+79
 YYT0EWMrSZZjIb/KWKnjVQe+xQvOVvm5rY4ts2oU0dKD2DPMpbnnpE40ugYwZLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUSzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4IoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKmQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgQdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfBsRLQkjQNo+ao7bWHHANhNKp
 gtMCic3ocbTbqiVQGZgoE1q+bcG0jaHX+9Mz8/U4KuonxrdN0Q9Tpr+CUlpAZxyHsKcegx2w
 31CNUYqFhwdL5kUUsEPpZ4fSKWMB2FffueChPbHbzYfJt3Tk4l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="52991220"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUh5kXr6VKYOU4qhsdIlySm8bKO0XklUPBM5WEcxzSKa1mjeHCgA9DSMvBBipNfr0lfkHX5CDqd9BblbVSGKsI2IC6n/zTEjbLPxpNkxI562cGLOoZf9IYTfoaH1/l/COuQYGG9lpel/xxNZwxrl2fOILyh61Vrj+elqJfUD8US6IGUT/P/bhJgS49HUE2/2HWg8XrXqbjrcRwZL0Ma8jA8NxqBZ+OI0XxIsZ3PVVAvpbaCGWuZTnOP7FHoG320VO3R+fWDo0cP6dpZgilKFTCpjA6tV0SxvFv0NpMLWHB4wdfLJwuTo41cezKD0rUxjt1+vZyMFDq5vHbJj2qVvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p1G4HGjwj7EyEDiHSa/jjXUT15nvGsX+uxA+Os5xktY=;
 b=eVUQoFpgBFqoKUbKanmiyiTyMnUSYbsVjrE3Q8jg3Pu1Wefmmp6a28PG4ygNNvl0AnuZ5EQLYcNZ3e3r6mN1vLmVcXtllNCgHNQPRB8vomUBioyR9Bq1OdtRk07IYdE534PG+5HvlIq9ncQXIbkvzkRCZfXxzhfKwYlxiFN9vNlPV1AEOuqxB9nxe0K9ZYN8OI7FRLkUC1v3/5jvTxljVAHTAJwGsJMg6ce+CTyBu3YsQrnIw2PQs/Z+iZaT+Octyidv9ZxjKmhrhZr0lX2OHLsB69wginlQcsd4HnpLbjn8v2XvY9KDocqjdtSXCeuUwCUkp4J0MrtlRjDKWmEqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1G4HGjwj7EyEDiHSa/jjXUT15nvGsX+uxA+Os5xktY=;
 b=gDQ5gmxCUiCjT1G1KpcNSTKi/ETS++PtGFVicyNrz25doQpD8NEQ5t6xXIWmv/5D28uaG5a5lj79b+rdPIYinXWtdycSSolW8bU5HbPaxC5lUyqLvmvYxojh7KP6W30wJQDHVhZFBsyueQrGzua1DqWef1DfT+gCLQoqK54XanM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/6] gnttab: add per-domain controls
Date: Fri, 17 Sep 2021 17:46:19 +0200
Message-ID: <20210917154625.89315-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ffa6118-e16d-4ee2-ef1b-08d979f25616
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60005B5B16CF079CBC038AB08FDD9@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9Ng+5tqNzIMrni9IA2JnlfEYKmhrfIa0v+dFIFqXCdBf0ol4753SzbRCntFwmarqgZhFBBQ9hQxHvMEMDKPYSbMjJRtcCz3iY1gelVZALPoHtJuhepTrC+80BlrK3opjGFmb/3qDt60gmvu7cALIVYD2bc4sCfEeKWaj8cJis+HOJdLMJCTw4ZMyiMwXXNwMRGLT1qn3Px1CyEzBNr6yNQo+3AQK/qgHcLrICKq6KdrxzKM6ZDkAaU6R9CuDdno150SfKf9ONBv5VklakSfDbVPij+Nrndp5+AOFjp3iU7eoCwCLNWZgYyzbtNegdKq0pjznVc+1Q+D03DZ07LxrNtwPzaP9exmumAJTrznoJE6JZNTsbefXt8EnbhYdK/DLkkwStYZ81f0kZ8iZAtIKVU+MB869TnTuI82lVhkBrRT3wXZPw1GNqsdoljzlwnrZ13v1kEhgtwpldiLkm366x5/XGrdPsPaxnd6s93WE5bsFnAeSfZBe0yzaS3pHod4hRKUamm2i1x1yv1q73P93dWVN04zTAlBv1RktPN1LOQvT9KmW5dJsU7/3S9GBjMqXlni4hUPGDdUai4wyRqgVH4Rijql4D6+gCdD5VHJ8wrSD/QVbxRW7YYYMY/M94FVRtXrJs1HRMlkkF7wxOWtfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(4326008)(2906002)(186003)(478600001)(6486002)(2616005)(6666004)(956004)(1076003)(66556008)(36756003)(66476007)(8676002)(54906003)(86362001)(66946007)(316002)(6496006)(8936002)(38100700002)(5660300002)(6916009)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REF6VlBXMEl3emdUQmVzMjIvOEdGZlZYSFJMVThZSnBhZCtGMS81VER0dDdC?=
 =?utf-8?B?V3c3S29QK1A5MmN2TWMrRUx2S2tPaG1zaUtDV2VpT2V0dVJNbjc2d1FSejVl?=
 =?utf-8?B?aGdML3RzekdXWnJ0Y0ZLejI1aE9qUTVRb0pTRGNJL2d3WUZ4WGNlN3d4YmFQ?=
 =?utf-8?B?a21JNDk2VVM1OWJaNS93a3pBL1AxR0JscTdiams4RE1PRm1UQ2xpYmNDUGc4?=
 =?utf-8?B?MnpMUjdjSjdOTERlSDNJNmRWOVRyVHljQ29ybldmcGxJZXZ6UFUwVVdNN0d1?=
 =?utf-8?B?TzBzcEkzVUZBdERPZEVLeVlndGtFUFl3MVhTUkNqTld3NDJEYytxOEpGV2xH?=
 =?utf-8?B?UmNESzJ0cDQvVW9rVGYyZlB4MjRTSkZQVkJuVldTVHRJYlF1VVJzN3dvc2lM?=
 =?utf-8?B?cDBQcENzSGRMcXRqTmlhWFRNRGhNanB6ekcvUVp5bHRiYzNSVXllQitHODdi?=
 =?utf-8?B?ZzFQQVRTZTlmZGZmVWRLVWN1REl3ajdVazBhUC9aUTAzaXorRDVEc0pLSCtD?=
 =?utf-8?B?SUZvb29KbUdBcVlPWUJ3dmRxazB2cjkrOHBTYmVlWnJOTE9SNHI3Nk5XT3pS?=
 =?utf-8?B?S2JtSXlkSG9HcnlLOFc3REh0UE40QStoQ2pWcFlkZWV2YXNXTjJSaUVPUi84?=
 =?utf-8?B?NUlma3FJN2podk4xQm11MytBWjdOUG9lOTh4bCtiVnZtQjVqOGQwY2c1WW5o?=
 =?utf-8?B?WGFZRWdlaVMwUzlVbExEMGVhbStWeUNMTVZNU0VHRVB0ZVVyL3VHTUpyUkpG?=
 =?utf-8?B?eUliZE5VN2RySlFraUhXblJGOW52ZXV2U0t3YjJQaUY5L1B6ZktNTDlMT0tD?=
 =?utf-8?B?QzAxNGVoOUhSbHdNZERpVjc1SHg5d1Vack0zamtrWXpHSUgrQzJJa2c3SitT?=
 =?utf-8?B?NDM5ZFVEZFl6bXdKWEllZkZVOWUzUWpTL0ZzeWtiYjN3SHhpZ3FQVEF3UHJ5?=
 =?utf-8?B?ZGlJTEFYdW03RzNBVGE0dlFYNW1MNUdHdUs3eGgxWXVSSnJWWjQ1OVdFdEw2?=
 =?utf-8?B?S3EvK3hGbjAxSFNHajZnVDEvN0M3cmhraGV4UWkxNFZRa0tDM0JkNlpTWVR5?=
 =?utf-8?B?KzZEd1VIZXV6QUpTRlU0eTgzMDNFa1ZzZ09neHVLT051cDZseUwwRGVlQTc3?=
 =?utf-8?B?OHM3M3hSa2xER0VTWndtNTgwMmF6bEVmVERIMlJHRk4vVGcyZUNOYWNlbUZr?=
 =?utf-8?B?bnZUcW54K3RMczNXYjlkRDR5dWEza2VGL3pMdDFJV2tTdVFuK3o3Y1p0M3RU?=
 =?utf-8?B?WXBWY3FBc29XNzNyNUY1SjZRL0dQRXJ1NXRicmlPSzRobkM1cE84N3F5MUJI?=
 =?utf-8?B?TUQvNGpHZnpqUU03Y3QzcmRFQmw3Y2xYeFpyd3dnZkFHaEhFOWZxajBGczE0?=
 =?utf-8?B?a2FINmhLa0YvSXVpMkZZSXVCeEhVa3ZJVWpCKzI2UTk3dmxxYVFTN0pBVUti?=
 =?utf-8?B?K2h2TmNPdTlkeGNYb1BZRVpobkkrRkhFNWNxZmdFTy9KRGFhWHlFM0U4ejRk?=
 =?utf-8?B?dmJaNDBUY3V4WTh6WnBTUCtnaHlsRm5mNGJHMjV3NEQ2Z015NDlvSVVqU1kv?=
 =?utf-8?B?dnBoVkZsUkxIOWdxcGdnWjNvbm5OU1dXc01HRTk2WTBvTU1YY3AxdENMU2Ex?=
 =?utf-8?B?M2V4eFd0dlBxL2Exbis0RWhYeS9TMnhkYm1JNDcwOGVuSUszdUFvTFlSQTNt?=
 =?utf-8?B?ek5oYmQ0bXZXQzU0S1F0dXdJQ2pRU3pjY2dJKzhGdUlrYSt6YTVrdUxRalhU?=
 =?utf-8?Q?/NnpfOHhqdtTD8LCCEXfweKga3ePodSam2vwQY5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffa6118-e16d-4ee2-ef1b-08d979f25616
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 15:46:38.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ/w264YLgtY3j8NhzZkDvTypZ5sEmE3ieTfBhHPTxzuENuzOxHVjzCTpr5n9vF/r6ORDrJADADEbYFN7Mq22w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Hello,

The first two patches of this series allows setting the preisoutly host
wide command line `gnttab` option on a per domain basis. That means
selecting the max allowed grant table version and whether transitive
grants are allowed.

The last 4 patches attempt to implement support for creating guests
without grant table support at all. This requires some changes to
xenstore in order to map shared ring using foreign memory instead of
grant table.

Note that patch 5 will break the save format for xenstore records, and
should not be applied.

Thanks, Roger.

Roger Pau Monne (6):
  gnttab: allow setting max version per-domain
  grant: allow per-domain control over transitive grants
  tools/console: use xenforeigmemory to map console ring
  tools/xenstored: use atexit to close interfaces
  tools/xenstored: restore support for mapping ring as foreign memory
  gnttab: allow disabling grant table per-domain

 docs/man/xl.cfg.5.pod.in                |  12 +++
 docs/man/xl.conf.5.pod.in               |  14 +++
 tools/console/Makefile                  |   4 +-
 tools/console/daemon/io.c               |  25 ++++-
 tools/helpers/init-xenstore-domain.c    |   1 +
 tools/include/libxl.h                   |  14 +++
 tools/libs/light/libxl_create.c         |   4 +
 tools/libs/light/libxl_dm.c             |   2 +
 tools/libs/light/libxl_dom.c            |   2 +-
 tools/libs/light/libxl_types.idl        |   2 +
 tools/ocaml/libs/xc/xenctrl.ml          |   5 +
 tools/ocaml/libs/xc/xenctrl.mli         |   5 +
 tools/ocaml/libs/xc/xenctrl_stubs.c     |  12 ++-
 tools/xenstore/Makefile                 |   4 +-
 tools/xenstore/include/xenstore_state.h |   1 +
 tools/xenstore/xenstored_core.h         |   2 +-
 tools/xenstore/xenstored_domain.c       | 120 +++++++++++++++---------
 tools/xl/xl.c                           |  15 +++
 tools/xl/xl.h                           |   2 +
 tools/xl/xl_parse.c                     |  13 +++
 xen/arch/arm/domain_build.c             |   4 +
 xen/arch/x86/setup.c                    |   2 +
 xen/common/domain.c                     |   4 +-
 xen/common/grant_table.c                | 119 ++++++++++++++++++++++-
 xen/include/public/domctl.h             |  13 ++-
 xen/include/xen/grant_table.h           |   7 +-
 26 files changed, 341 insertions(+), 67 deletions(-)

-- 
2.33.0


