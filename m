Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434714CA878
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282323.480992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQG1-0006VM-G5; Wed, 02 Mar 2022 14:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282323.480992; Wed, 02 Mar 2022 14:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQG1-0006Sa-CR; Wed, 02 Mar 2022 14:47:13 +0000
Received: by outflank-mailman (input) for mailman id 282323;
 Wed, 02 Mar 2022 14:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPQFz-0006ST-5W
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:47:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a25b5400-9a37-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 15:47:09 +0100 (CET)
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
X-Inumbo-ID: a25b5400-9a37-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646232429;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=l2fKHUNR8w4EvUvmQuOSeXQW0vDZjPSA79xur+RTt3Y=;
  b=DP96mbs74YCjZdUO/xFd1RdsqfYwbEo/r9vJAx/d14zVRjactkzbaXyC
   CV1SArjQ/Jf9eja113F6EGktlLrkbM9zRC41GYyHIgEp7Ez0vrVGO0enY
   ATFLV4Wa1kzdfebKjjM4ddfgenjoLtsSU6OWKdngBy3pCx9HI8liK7QEO
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65312074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7K5+9arGMsgph6PDNydovq9TJdJeBmIOZRIvgKrLsJaIsI4StFCzt
 garIBmEaPqMZWv3fNh3PYzi8kxU75bWmoJlSAY+rng2RH8R9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Ymq+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBNbDRlbsjfVphGHt6HrF+2JPgAlG/rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdCMGA3M0iojxtnH3UsDJ55p72R31rbcTRFj3TWpLc52j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUx9RyAlZT6oD+SXGwnUgZhRPsFnc8pEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LEhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bphdJ2exM
 RGK6Fk5CHpv0J2CN/Ufj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qtZCfQhXdiFgXfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:MJgfz6hXZqpj2Chx/Rk5afc70nBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65312074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TF2wBY0YcSyqQijF9ta4EpDlIrF1BbULCFYzXcZbq2M9puj6CByAh2xZWglTbyRHx/fgeoGqB8NM/XWEjHz0qQ81rmnD+jTmC3Z9ztgqcez/TXt5By8IO2vk7oWtqQ6BsoHOsZ6LQX4qaT4DJ+wcHeTB/BBEA9LrkgeZpCfuFWqyPs+f7PpKmlYJT/Sp/MISRBNkpVRpeVKCw01NiAlLa8PcZplvCLpzBuo1UI/x54AA1UvqAUAATIOqaHd1QXlZ8YVaVMBvrg9l3EGNR3oydFJHKF5LS+pp0whKyCjKolXHkM749/UGWKRpm7TxNaZaYinCl/J8iCiRJVHRN/w89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc4rH5d68sevqwCU4eAMHZW/2LzR/VzyyWf5hgoFskk=;
 b=SlO82EZUJgvgANfIzO5T5as6j/X8Md2Kv64SmwxBMzHUj2EBaj/zOjI0miRFhnyzfvBWfPWkWVWqBoV0R47AZnBmHFBIdqDtIJaE0ul0zREhcxrwGqCTqPLtMyZCK90mX3k7eiXB8EnCI5Fu0zG3QKd8UM7DJbDJyreyiotyYqWFdKgrSXaBuZB5p182LKCUxP0YnG7a5JFCt5Mx82HxU5LBkf8PZJlhXohiIxYkKx9/kEUAN4J7UfEjwBhI7ALU/Nt6o7UdQN5rh5aYewV/jDrnlWxE0NV016nFHb+jSS6KxhL3Iqj5XqJV/Xa42Plh1eBSJiOLPfOxSJX/qMELFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc4rH5d68sevqwCU4eAMHZW/2LzR/VzyyWf5hgoFskk=;
 b=pq8iZ1C+WUkk/Ihq67HQGLKpvlBVfvVGkSiL4P/Ko7+iU6xKMNn/DyrQvtER3YjPpSNUHXSAYZR453DDYuedtxreeSncw+34PA/DFozm/IMgDeCr1zQmK9UlPUplx9WrBzj0e3wmu3/cpyLDlDdh0T/8Aa8xrztwQDiPoPe2LIU=
Date: Wed, 2 Mar 2022 15:46:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: drop use of CONSTRUCTORS from linker script
Message-ID: <Yh+DYGHtPHA/3qVH@Air-de-Roger>
References: <1791edb8-030f-1009-c392-ce793baace5a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1791edb8-030f-1009-c392-ce793baace5a@suse.com>
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f51223b7-429d-4e3c-67a9-08d9fc5b82b4
X-MS-TrafficTypeDiagnostic: BN7PR03MB3586:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3586618E5D15B841FEB359F18F039@BN7PR03MB3586.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXVlCtRsI5N+sflfPVC6t5PIvLdW/GYuCHET/dxSRx9tbisLme26hw4TUP8wMgmQaBEbVemN1ba9x2/hGB1LwLkbuEwk8e0TWLLT8q7iRQ0DHziJgu2jFShN9r0DhfmMcSGFrVyBCZA8BwYIoJxviAFxSf+iT4gbms4x5Gx9qiXxptgVz+t2pgVb8T1FsdMHsdTkcyIEbdW3hTLoDYMdRyZSVmyvouIUc8HJUKOpAuzrPjOSwK/4r7yBQi6vJMW3MCpuftQOYXZW0yN/R3uzeERVtino5OzWgpEaC76xP2B1kGbJUuv6nSdC8JB240Ugi+FdcWXdS1vPaMwAoKZLqPLXssSbQlDxwsWXDPTpnx5bkLwsumg1zN0dXf1yh4+quoUYqDJRhtuCwZrPC3KKGpc70aNzHQ5kZv3aDV7bHbeVdfm7fcNxdJm76CqajfRNXtKdf3I3SrCzNUi98ycEUYBgMwCJ34tmsuBLTBNYTMY7FX6qp5l7TMez5X7MbN6eRdgkkYq5APoon/ABUhI1i9AsokpIs1XuOosmKdYmuGOeKOxq2krtOqxyI+xEsAs7K9f4nY3AAvqDcD3ApJlMIgfTh6PQ3QEXW/pUFommbrC1e8zAXlsYDPvhB7WYciI87433gbxEt0nnYuKXd3Pqvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(2906002)(6512007)(9686003)(82960400001)(6506007)(33716001)(186003)(26005)(6916009)(54906003)(316002)(8936002)(4326008)(8676002)(6486002)(66476007)(85182001)(508600001)(66946007)(66556008)(6666004)(4744005)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2Q3UjdpODcySyt5RWN1NXNkemovWE9pWUFOTUE5TVFmYk0xazFwL0ZRaEtB?=
 =?utf-8?B?NUFxQ0FmTzNJbGRrdDh6bmRLd3V2MFY3VzY0cWNMb3NHMmpMYmExU0VXRnJQ?=
 =?utf-8?B?TDFzUk9RNjdqTXpRaEVlUm9QOXBWdVhaTDVlT2p3OE4rT0xvbytWMzZZdkxm?=
 =?utf-8?B?U0JDd21UR1pvbEY0Y1kvMVNOR2cxUElQZklMZUg4bk9UbXhlTmFVUnRuVU5s?=
 =?utf-8?B?QXh0Y3lSZkJnZk5UWDhKTjRTN2dxeHBEUHgrM0gxQWtVVk94K2tXNjBMeU5G?=
 =?utf-8?B?aW5IWUMwWWRJaG1SZWR1c2dEWTFDalpHMTU3dlRwNENhRHptZ2xSWVFlSGw3?=
 =?utf-8?B?U2U2K1VINTY5SWwzYzRWeDkzUXRJY2VBRGNDbkZTTWZiTVFPN1Z4TnRHNnNG?=
 =?utf-8?B?MW1uN2RKa25iVE94dG56WXcvWmg0SGpkSnVvUytCQ2VjS1ByWTJkeDRxY3BL?=
 =?utf-8?B?YlJJOWJnUmZpZm1MWU0rWUkyWFIwMTF6L0EyTkxFTFM1Q0JlclpnanJjOURE?=
 =?utf-8?B?LzY0eGZVUWhNOFdWSUlWTi9hYTM1dTZnc3l4MS9yZEg5UTdJcEltVG9oNTFD?=
 =?utf-8?B?SGpxOUV1SnUybG1WaWIxdVBiRCtqb2FnNUNwdWlLMXlFbjh5Q1B1cmZobTln?=
 =?utf-8?B?cmZlOHNNWjBaUWZsaGJ5UXU0Z2lTVWlZWU1tUXZKUmtHZjIvMHFzSTJRci9M?=
 =?utf-8?B?TlRZc1hrMFZKelE2QllEMnYyaDM1UUZFZUd0S3VVVmNaZ2VkT0oydDcvdWI4?=
 =?utf-8?B?RWROQTFqN05RVmV4aVl2eFpPTWdMbituSVZ6NXBQZkJHQm1ZMDM3Y2tiQVB2?=
 =?utf-8?B?Z2JxTnI1bmRVS1Q3TURVVlZBbTVDZFJsa0VXWVVzUVlpZ01kQ0l6SzhjNjly?=
 =?utf-8?B?MW5MZ1RjaFoyMXZFUFozTU5naTlIOEtFWFVnVUtOYjJ4MWdOS210QzJyTjV1?=
 =?utf-8?B?WmZKVEtqVzQ5ZVRRL2RSZlFyVnFiVXJ2LytGU1c3RmtOdnBrZCtoRWsxQXZH?=
 =?utf-8?B?ajR5OHpPTjJqRW1ST1FUbkVHWnRLZ2dTR2FFNzZhcnhZZVJmMWJuNGhKSTZh?=
 =?utf-8?B?L3BBRHcrYnZBTi91OEE4bmNjbytqNmpCNlFLd0FDK2N0dUoxSUp3OGo4c2Yr?=
 =?utf-8?B?QjhFVWFPTkN2UFdodHNuVzBtRFVXbm1LYlpIOUw3c1gvNGJ6MEpGTEk3RTdv?=
 =?utf-8?B?SEVDMWtEWmFCU3ZuMnBuTmswZXVvQjBPV2pKQTFyL2Q4TFQ2UzJDY2lIT2tz?=
 =?utf-8?B?RlowQUpSU0xSMVNlOUV4OEN6Vm9ObnNxMHNTYU95ckNOUW1xQVFVSHR0Z2JC?=
 =?utf-8?B?S2FmOTAzT0dHelFERzlFbVZzRnZRbWJUUm9BZzNvR0JhM2lMVTRvR1pwQm94?=
 =?utf-8?B?MWtxMkh4cHFOcTZhamJVaVFRRUNCQ3k1SFZGSkZYcDBLV2pGdWhsempKT2JQ?=
 =?utf-8?B?UFhNbzBUaEVCMHdKSE0zd2JMNEVBYU1CMnBzaE5ISkFtYkd0MWh1TFBXQnR0?=
 =?utf-8?B?NHl4d0h0MC9uOWxVYVFIU0wwWitLNnpaQzU0YjV4K0dyaFNKcERNcTkvVzhn?=
 =?utf-8?B?cTZpS1VXN0pUOWNramh3Q0NRTjhNSTBkNnpLZFpMU1l2U0lUN2hWUEVVbTQv?=
 =?utf-8?B?cGV2TVVRUXdJS3h3QlhMYWQ3VzBlY2lxZTZ4M2lVSDNMU3ZWOGdUcVlRNWpE?=
 =?utf-8?B?UGthTFRMZ09xdUFiUnBNSitYb1hiazlUbDhDK01wc2l2VlJwTmVwS2cxL1VM?=
 =?utf-8?B?T0E1alNSRG5tb3B0TVNKcFN5SWIvUnE1eGtiVGFPMzdqOEJVQkpGRGNLeWVt?=
 =?utf-8?B?OWpRd0ljS0drWVlBQlUrd3FWY2lIQTdFRXk2QXRFZFlIb2xhV2QxRGZGRFBR?=
 =?utf-8?B?M1ZBVjlib01Jd0h0SEJqajlpRUZmUlJKWkFsQzVXM0padFRCcnArNnRRL0V4?=
 =?utf-8?B?RjBvcjllWUFRMkVHOW5qbHZ5YTVwQWlzZHQ0d1N2QWhJcmFINUJ3TUNzUzE4?=
 =?utf-8?B?c2g4UkdlbGVtS08wblpzUFgxNmRING95eUllYzJnTkZ5QzB2R1NMQmZDUkpp?=
 =?utf-8?B?R05qV1VzZUpuZmU4Syt0RVEvYzNqSlBXZWhkRzdlNHRMUHIybWFxbGx0eXRw?=
 =?utf-8?B?Smo1dmx1bXBqeDEzZVB2NVRSNERRbWg4aWEyVE9VVGEyVUZucW5UZWxMUm0y?=
 =?utf-8?Q?xL8oYMuVx8n9xkTDMDvDub0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f51223b7-429d-4e3c-67a9-08d9fc5b82b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:47:01.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQ9w+R8qRrUFEEjV+hNlisAhho7FbV+bCWSVwm/okFpcwIqkXAyJ5qeUsfNt85/YRC+GedoqJGvFvr//OldpmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3586
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 03:15:29PM +0100, Jan Beulich wrote:
> Current binutils document this for use by a.out only. Plus we deal with
> .ctors and alike sections elsewhere in the script anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

