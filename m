Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C94FDA9B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303611.517997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neE6N-0000SB-3f; Tue, 12 Apr 2022 10:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303611.517997; Tue, 12 Apr 2022 10:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neE6M-0000QD-W3; Tue, 12 Apr 2022 10:50:26 +0000
Received: by outflank-mailman (input) for mailman id 303611;
 Tue, 12 Apr 2022 10:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neE6L-0000Q7-8W
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:50:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 599b0f90-ba4e-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:50:23 +0200 (CEST)
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
X-Inumbo-ID: 599b0f90-ba4e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649760623;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xkgtlKDUlbn6rIvY8DrdI2zgvRHYxje6xjIFZQM4Z2g=;
  b=gCQM9/qz+j+v+2PxMIxzEpVgAqVa8+5zqmUQ0lrACBkIIxaEfuBw6q2g
   qXTEQ5k4fvBU8Eifhy9FaFlBLaez0vNWUkqLj2poYRwM7r5jlCxwewXZP
   hUT75Mtyfx/fAxrOkUyE/07sgD3kR55t9utEF0mI6frdoTR3ulysP4DpR
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68068565
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gJvCOqLpnslod5gkFE+RG5UlxSXFcZb7ZxGr2PjKsXjdYENSg2EEx
 zBJXjqBaf/YazP1foh+PIW09xkPsZbWztNgQQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tcy2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PV17p+iYyZ1Ap3jqNYGXzhbEx1RP5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg3p4eQKiDD
 yYfQRZpUk/xTg9fAwoWFpxmvdq4r2v9fhQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywWUGGkCCCJAYdoOtckqSDhs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewckdVAG8fPC/L0DoSL9VdpCE66Jod/MTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vWkWyKRBaJ9sldrVj
 Kn74105CHh7ZibCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6xwRd0wPFvY
 MrBLK5A6Er274w9k1JaoM9Hj9cWKt0WnzuPFfgXMTz6uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3WMiszN+61Bc8XQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN02V1gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:OeyKsqD4jiviz0PlHeg1sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkj+Ka+Adww4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJJGdZc8qPSMex7wqDL3QSuvyAfcZek600ykke+C3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68068565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnZq6RXpt4Z2XQpFH9DPnuP5oNsRHFmY4Q5Yo9HrV0TedUzmjm/y41j757Mm1wxjeaYyGpYWtT0ipDoiscMTYWm3REWXeQEHg7w5W2taNEZjYavuAooNMjjhIGlAfDW+Pzq7UiFVOjCsc448e9tfpjc3vHdbTrDvt9nXouzrIakExU0fkt0eFojbyBIESgr6Lhh9QCcKTl6R9BFjs8tMUBjDP7ZfJMCRHYHoUAKIA47quDDwKqbPJn/DdKA4RU88KfWPA4tvqbZBISqZLhDqSfriO/wQ8/SEYL0MoGDIrwXfNrT/xNLmgqwTpNpFeoblr/Er7wi0+hQ63NdO19BTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZidaaqWsBZw+HSoEiwUZExyB7+RrDa+U4o0PoOfqZE=;
 b=gXPm63DDpWGk0tAhw42bX02OfUrXGs3t4CpqhHYoDMaqDQcoAmpAk5HKflVub9yj5/moB7ZQMdmRSCUBaaP2xJbvva7E8stlfY157HC6Lwy5H0AStbm5Xlg0Qzr+TzCXUhMeDk291Xu+Wi7ELzsWnZI5c08AdM48d2Ifv6gPDFvElZ9HwoV9EKAm276cLC53nViLBESNOKKiYq5Y6Cq2NF0CG5FS+YGh4QXwW+KV+5ZzjjWzMe4XvI8Z2Mc7YscD3P8H+L/+coiglGpX/SyVX5mfse+q6kYbhpndabYNHboUB7csh7Mq0IXHIOraXh/9/u5dTgzyLfNzLfvdlJxtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZidaaqWsBZw+HSoEiwUZExyB7+RrDa+U4o0PoOfqZE=;
 b=dB2DXy9p0+d27I2/kndcLg+/0tYrzpstX4N5cxTu5R5zRyn/Lf/E0UdxKk9OEfbVjInBtBKFXcMGyqSN8bCxIps3E7UB/mvaDGnnKd/bdLoOnKa03IzzcyxxAuoQsOrlhAQBIM0hz3iC4scK4iFEqLeqxpeUUCHA1a9JF7b4p6A=
Date: Tue, 12 Apr 2022 12:49:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] PCI: replace "secondary" flavors of
 PCI_{DEVFN,BDF,SBDF}()
Message-ID: <YlVZSR4zWGy9mLbY@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <75623ef8-5aa1-b864-7398-b7980accaf32@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75623ef8-5aa1-b864-7398-b7980accaf32@suse.com>
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07ca06f1-8a0c-4393-3a64-08da1c722aef
X-MS-TrafficTypeDiagnostic: MW4PR03MB6537:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MW4PR03MB6537C4430A897F938795C2908FED9@MW4PR03MB6537.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucTe6eBiw0+SPrwd8Agocf5MmC6UoY/c2hxdkarqvwh84Ubj+i2d3F14emgIZD+tBsv2ojuFIXQInRJU5ChB47W7E7/mzj6hYfcYlM4hTYbNweD6T/t0bNmdApqI+F8ep+/r+Sl7C6bL+VkECtD3tqG9mTjejJzbPkH5NdZBdUVdblGAaDUAgzfyPp01iaVck8gglfqEY/Y5S4qeNpICwGNNF35DfNBe08GM++RHeAZNXP9xMr4U9HRAS+26fWkX7gthrorfUJSj0dxX8A9DPJYxS/DnHJqfGLcZYpK8qezwEa0eNZdZqucc5W1BLq8MTkw5eJnybsHmzuy9SMjQo9qLVWNdc26bEbqzto1oXcd97t2/sdOowAK+oGgXjRAPnCMvFXxMQCWTw3KBA8XZI6da1qw4u6g93R3+o7qIlqrujaolDBwFTsgajd950m8hp4IXZgLxmzvcLMwz60zXFUvyPZVowV51s8gBH2Pu0vkrAV8HpsRXxLMZB69evFUS+ym3eX12c6jvRIkrhmz1TDuGEyHvry+snd8aNRbzSnf5WlIBKkL7zLOiPpzD6LC+K2ohzWJA+yrwtREXHPJtdDLQ7TR3mSiRnX4IxjyCG7MHxDh1/BhF5nm73ezw7IbqpOLU3TYaMYW0T5okd9q5lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(85182001)(54906003)(2906002)(82960400001)(5660300002)(316002)(6512007)(66476007)(9686003)(6506007)(26005)(508600001)(86362001)(38100700002)(186003)(33716001)(6666004)(6916009)(66946007)(4326008)(8676002)(66556008)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkN6OWNCdXk2RTdBdXhsRWt6eXBZUEZML0t5VW1JOEd5WnpDQ0JGdHRtblJx?=
 =?utf-8?B?ckZJL0FvMVBSRjZQajUrNFRqbEtINy8vVjM3bVBzN3pvK2NWMWtmNVBhOHVv?=
 =?utf-8?B?TlVuWDRhUXAvVlczRHUxQWVHLzAxRjdhNlBjdWgwZG1JZTUxTkxXSkR3Yi9S?=
 =?utf-8?B?S2trSEJybjdPb0JZb2c5QTQ0QUlzRFBUL3piSGdzS012VGZUZmVEQTNOTnpo?=
 =?utf-8?B?NWRCcWtxRnhNeUo4SmJBSlB5d2U1dXZTUXJvNXBRNWtGYkdCZmFvZEdYSkN6?=
 =?utf-8?B?MWlGVmY2WWtMVEZaTUk0NkhwTWVPOXJxOXVuUDNGZUhjVTkrVG1Ca3E4bTMr?=
 =?utf-8?B?VXl4cGhBSlA4YVBNU01VeWI3RktKV2JqYnd4ZFBuQktXbnlVcW0yVlhUU1BD?=
 =?utf-8?B?d0FNRkN3ajJFRjN1K1lhNGxQZTRVQTZ5bGVGM0FHWFpiTVZBaFUrMWFQUWVr?=
 =?utf-8?B?SklVMk9IU054RjExRytNc2drbHNXbHd5VTllTjBMT29DYng2THJLNHRPTnFP?=
 =?utf-8?B?SFlPdk0yL3c5UjNMUEgwTG9zd0tpMnUrUnZNd09RcUpKWkV4Zyt6QXJuaWxU?=
 =?utf-8?B?aldlbUtEdnFOQkFzQmhGMnkybTBjeU9RYmc0cTR6dlI2V1NlbEp3akpJUEUz?=
 =?utf-8?B?ekhReFdIK3ZDTnNoRm5qY0RiMDRocUlpM3FvQW85YXI1NDl3U0tVUkhzN0gy?=
 =?utf-8?B?RWhVdjlkbmlyTitRTFBzTEZEaGtJUS9yaDJ5SndmMjhEN25LK1BzUks1TGdn?=
 =?utf-8?B?cE8rb3krSEZma1FCc09zdFMzT0xuUC9CbVpuYmdXUTgyMjBibUo3cVhaYnJK?=
 =?utf-8?B?WXcrYWs4WHRaY3BxWEk2dFlpaXRaMGVnVWgwS2lmMXpmeXhRRWZFOEtuVEVt?=
 =?utf-8?B?TFN4ODdZQ2RhS2RWQlQzbXlLQTBkVnI0KzZjbkJGMldQREhQZ3BaVDZOdUt4?=
 =?utf-8?B?RU9IUmVaYmJuTG42RWJadnhCVFNZd0RmUERxeWNYVXI3dnFWd3VqWTBZK0FB?=
 =?utf-8?B?eFZ0WjZaazFCcXVPN3dwTjY4Wk9XelFISDV5NlV4T3EzdGdUSkQ5dnM2V3M2?=
 =?utf-8?B?OElBZEpDRFVYTmxtVEFsSk53SlZBdTRGb1NPWEJ2ZitBT1dZSkxOdzdOT0dV?=
 =?utf-8?B?blZMeXpvMmdjUWhUQ2YwUDVxbXoyNjE0dzByL0RFSHNrckV0UXBkM0VXa2Yw?=
 =?utf-8?B?R2VzR0ZoZERmV2d2eDNkS2d2MEYzUHpWUHZ1YUZNRkI4VlViVlpCMmx3K2ZT?=
 =?utf-8?B?UW81KzBFNzkzczFwSFhBeFRqZTE1Wjl6ZXM0UzVESXpBc3ZkQ1NUSHY1NWVS?=
 =?utf-8?B?aG13MHpoUDhtbGVjVnpwUzJ4NHJpRU12N2U1WmNPNHE1WXF2eU9wMXEwZEg1?=
 =?utf-8?B?dmpWbDZlblArWlgxbzdiTGpVVkRDN1d2dWQrUW9xeVIvUW1NaWtVSlhicU15?=
 =?utf-8?B?S3R0cGxyNkdLVWxrYkZ6Y0ZMZGhTODZtYnhycy9MZGNybG5RSnBiT0xNY0p6?=
 =?utf-8?B?TWxOVWJtR3NUZFJ5YkJpL0FDamRta3hnMVR4REFGMEd3TCtJa2Y2anA0OWlv?=
 =?utf-8?B?dkRPME5ZVFhEZG9vV3NTREFsMHhyM2JES1F4ME92RUxRRDI1SXZUMDAyUDNS?=
 =?utf-8?B?d3RmVkduelV4cmhyMnQyL2VNbjlKZklsS1NBZGVkZ2xEcHNwd2doTkw3M2Nt?=
 =?utf-8?B?eTUyUTl6a01iTE95bnhXRVJ4Y0NJelIvWEVGVnBwOVd6TUlBcWNNTHZqMGVC?=
 =?utf-8?B?aVhsZEZOWXFUNXgvNXdXVEpJRjVJVU5aNlkzSU1CY29hMk9hZ0Q2S0EvSnFT?=
 =?utf-8?B?NTZVOGpBTUhCd2pMbTBJWUsxR2UyWnFrNHBaU1Btb2FGczh2MTl2MktvWkxw?=
 =?utf-8?B?M1puS2Y1RWNVN3JFUVpvYWNTcEdUZU9JYy9xUFJhZkgvWmlBTm9kd240cVR4?=
 =?utf-8?B?ZEhkckh3TmFuNEZxdTVpZTh2UURNVkcxMEJrMDVpRHZUaVNxRkZCeUErRUhQ?=
 =?utf-8?B?TkhBVS90cG9RWlVsZWl5TTZaWUdnWHk3Z0F1WnRUcDlpZm9QbmJMOE1uQWhX?=
 =?utf-8?B?N3pTY3U4Ukgwa25nWTFDbGZML2xKNS9Ja3FSQThUVEVFNXNaQlRhbEV0anNU?=
 =?utf-8?B?RmtuaVYzU0Q2Z3F2b2lHR24rZWNNL0ZJL255SVFkQVVNLzVyV0dmblYvSWlJ?=
 =?utf-8?B?RGQ3N3prdjZWbjVlQ0EzQzVpQkUxSGdoSTdlNmdnYkhHN2wrdzl2YVI5UEd6?=
 =?utf-8?B?ME9NUzh0bk1oTEM2VEpJLzZwcTFaTExmdWdQS1NFT1FLUDJCaTlJSUNrZEl5?=
 =?utf-8?B?SUxDd1VmN1hyMC80MTBaTkxWSkRnWmM1TUFpNkVUQk41UXJXcGczUXhJdk5I?=
 =?utf-8?Q?EMQvyNvoJBVbu7JE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ca06f1-8a0c-4393-3a64-08da1c722aef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:49:49.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FKqzp8i5QlOEGohxI5wm5IjoM6sD3ssZlclXWAvJyXpGjcpdV04Az//IckolJYBBDQmC3BIg/8VEvnOEVwXNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6537
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:42:05AM +0200, Jan Beulich wrote:
> At their use sites the numeric suffixes are at least odd to read, first
> and foremost for PCI_DEVFN2() where the suffix doesn't even match the
> number of arguments. Make use of count_args() such that a single flavor
> each suffices (leaving aside helper macros, which aren't supposed to be
> used from the outside).
> 
> In parse_ppr_log_entry() take the opportunity and drop two local
> variables and convert an assignment to an initializer.
> 
> In VT-d code fold a number of bus+devfn comparison pairs into a single
> BDF comparison.
> 
> No change to generated code for the vast majority of the adjustments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Nice.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

