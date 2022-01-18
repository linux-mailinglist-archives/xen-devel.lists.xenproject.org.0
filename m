Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2349241C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258437.445051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m37-0008Iu-To; Tue, 18 Jan 2022 10:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258437.445051; Tue, 18 Jan 2022 10:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m37-0008Fj-Pp; Tue, 18 Jan 2022 10:49:13 +0000
Received: by outflank-mailman (input) for mailman id 258437;
 Tue, 18 Jan 2022 10:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9m36-0008Fd-4n
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:49:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4249e1c8-784c-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 11:49:08 +0100 (CET)
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
X-Inumbo-ID: 4249e1c8-784c-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642502948;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4NjB+Rw11wJQ0N/6s8l/xdKbUQeboG5ADxAazDoiumo=;
  b=gNo6m/NNjBzhZcRf+eZenpj+3XEFYv06z1to1lMG7GLMU6snDQg5BOiB
   UfB3h7jAxEaLLrQ8TAe5ATawBkF5zQnJAO/CxyTY73QXs0TS0RmeT47+5
   bDpZoFli6XtYCRojkFrAcej/ok6zHakAGbPAr0dtZmYtjAJaWjvm76f6d
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BxNoaZOB672/btLLRLCzdxljOBN52+BjBKXu24QRB274o12yHwrsqrG1quVW5UtZxkram6LaQZ
 K/VlS8gbOdwLujs+I7OD4wCRdwXtjMn26eia536uN3DoyTEbjAS1GVCQczcYh27E+X0B/N7/YR
 NOIMFss+V9UEe7Im884FAiNQ6c0GLK32n03gHqv67DV2Cd3D+ftNxdkHR3IgkxsO26q/Vz3elo
 TaTnmsOAta1r2E36t+l6h/9Z5zWKiaquOTSBFp4YNLDK62SW2mxlzfjoyjkceJ+vEimkcH4EyN
 YQ0Z3q2JTYhTFxNBQBpt3GrR
X-SBRS: 5.2
X-MesageID: 61686907
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:krLj1K5so0sg7J3etCOOPgxRtNnAchMFZxGqfqrLsTDasY5as4F+v
 jQeWD2EPqrfMGHxLtF+Ptni/UgBsZLcytU2SlBqrikzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 ttQn6awaioTJ4advsoaV0JUMCpMMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm5u1p4fRam2i
 8wxRGt/cy7yM0R2fQ0eVZgFu+vztmv+fGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaasAM2YdpzPtcjw1Cr5K3QuAq6DVoLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPOZJhKTysDA3CMqsyq7DETFtW
 1BeyqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wKvG0idRk1aZxZEdMMX
 KM1kVkOjHO0FCH7BZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZIfA9adiZqVMmmwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:9N8fV6DGfp7lLgnlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="61686907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGtXCQQE16ga5/DvAPjomhtrHq1Gj0wZAHhe/xaRrn/2Fmxtri8Yx07Bmxyryxodqs5nG+5BlQOb/PI05fOjfk9Y8NgCZMpY0yqOclf9n0FAUkyd0l7zoUyzLLZSzElQ3eDrrPoMyTa4OxpZqFBydRr4k9b60d6vThFmwWfGz3TaJRf5QJs/Yogd8Xn3FObXKMuWo+MPXsvHtZnH1i3nhtQnR2cNNo3ECrgwNY+U4N2KSOZH755lLSVwY31fvjVSClAVrQ5PerLnSqGUjP87ElHlb/OLw1vMMoJJZJa/I1MCnn8gGRKJY1ETALttTs5KVu8Fg51dK7ruBgYYuv7qMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxbWUtXZ3qbijCMTcJyNHiBKsRg8gWYdceS9My5WQXw=;
 b=JojArRsLImT8Qxx/9BbCzdfudEBOD+JPGNuzz1NpjY3Fg79UufqZm27prxmyGHvntzOUw+g3wcRO3qjJ/bUfHPzkR9SSiCyayS3Fpcgjf/5q63T+dpeM98o+rZnSEH3biQw9nTqmdRuffzLy/pcNpjalG0MbW2uVqiQOsAo8boi2oOjcfs/XUjG07b5eA6+IZO4+0NZpQOlk7bA9UTAFDzrymxIiFSWa28WzQ/EOga6JusZh/a0K8Yf40+gUjb4pyDAFg1k6fq31Zwx5w7Z1mPNLUdb+qK3PCvzDAdbCVOt4jQxe317cfhqNRkMg5cWdPpQTobNSkhmYxSEadzY7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxbWUtXZ3qbijCMTcJyNHiBKsRg8gWYdceS9My5WQXw=;
 b=dMvzkC5M0jNbiAhbhQkT1CN2ysVz65DzZE9qdGjeSIqQahLqmdg45rEFFLAJDLHc523exaRlEAcV3XtQ8sNhQvvhsLVM/nwNCP9oZ5yX3glWxIFvCDmfyyCg0W9etiPc5Q+grUMxg5hsyrafFwN7Ot7BOpTUuGF1VOQv789eQAM=
Date: Tue, 18 Jan 2022 11:48:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/5] x86/mwait-idle: adjust the SKX C6 parameters if PC6
 is disabled
Message-ID: <YeabFE5v5tQvM0eP@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <aa7dc2e4-6a80-dd7a-81d6-92690f6e0bfb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa7dc2e4-6a80-dd7a-81d6-92690f6e0bfb@suse.com>
X-ClientProxiedBy: MR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8432c1c5-7fef-44d2-527a-08d9da70216d
X-MS-TrafficTypeDiagnostic: PH0PR03MB6445:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6445054CDFA1E61073AB14698F589@PH0PR03MB6445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHl8O831M5O0wHPP1MBgxBHot0wTz/TkRx4gY3XtH7L9p3u+ID3Iyo3VAwsltisEKkm/aXTWIin/+hiKE4PebnwhTeRS5erqL5pQuD1smbs//YRaBtWGB3XSo4MkGGMbsgUoM+I5jSq23W9PzgOGX7Ou96o/b3d7QybW8aEi+wWYTQNe2ImbikJ72yHnw/ZGaaZwhKfOkDEzozjb0mU0VpWBf9zdYOGTsFFrKRlfy9xoWVLWgTDHIPR50F7ZT3T3G8zBRMJtifNAGO0Ga2Y0BEZJQ+3p1YUrob0XQIqlNFH9LH23AOPtht8oMvWTmzzZd6h3nUHMX4IohamZEAb0RSpL3vt7Xn+mK9WII4NQHnrQcjnkJM5zVWdsjtf1o065TBprb8T90dJFfk2FMSKAZeci1GAlqta+DIS3JU+8lFeymOvyIIWtcSUNRSFq6yXHHsFWu2KksB+CmxpenDk1ihYS2f36wD62UhnN+K9tc3APQpkPRFxhrDPC8HZrrMaFz3o0PMcl66k4+wPB94qFj7UobwN9JowiBoWTuORD4cNNJ4aSM/Tp0SfdSAHWLCcVElnTQfNDTeVLcFrwHKbPzJnXb8wGKya08uHg2Ol5cYgoDunlfRRzn+XHzfO5C8527m6XLHA8gbZtroCXhXk8RT4tule3asvjVjJtga45hBLAu49Fw73Z6qqAL8fbY9lm8Rc8D/+OXZOgf8hWigPz6ft0VIjQVuAvs5IFE1b+QLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(8676002)(8936002)(6666004)(508600001)(45080400002)(33716001)(6506007)(54906003)(85182001)(6916009)(186003)(316002)(26005)(966005)(66946007)(2906002)(83380400001)(6512007)(82960400001)(9686003)(6486002)(66556008)(86362001)(5660300002)(66476007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2l6cU9UYlJtcFJtbFFybXIzM1ArbjJJalYrY0xYdkhqVUpCc1FBSGZYWmpB?=
 =?utf-8?B?d1ZmMy81QjJrNktOMjRaUUp1TWRBWDVYcVl3bG1xc0JsNm9UQ0tZTGJvVnM3?=
 =?utf-8?B?ZDdacXVWd3NHQUhRdnRmRFJqWVlTYjljV1BHVmphS2J0NGRnWHlvL0xUMmlh?=
 =?utf-8?B?dmxoUU1RWjdVSlM3aGFLZG8xTDJKbUNNYWNCenRyRDB3TVcvaDRXRXh3czNh?=
 =?utf-8?B?MzYrOWs2MHlSS296RXZVVS9vWlQ3TnB5TDgwRW1JZ0h1VkVMS2toQS9QMHNt?=
 =?utf-8?B?RHU1aW5xZjEvZllCU0FNV3ZRd3BKZmZrLzg0c2Rsbkk3RzBpSkFQd08xc0t1?=
 =?utf-8?B?NC9WeFZ1cll0UHNCcGErbW1pMkgrSUNxSDZacndRS0pjTjRXREJrRnlyVFho?=
 =?utf-8?B?eUdyK1BGdkNEczl6TlBacklvMFJ4UGlzR1VQV2hpbmFvcmNuaU9pemhYWElI?=
 =?utf-8?B?SFhXU2haaUVWbTJWak5xMXl3aWtFc2hpUVdYNk0xakxVQTR4RC9LbGEydEhK?=
 =?utf-8?B?QzFrYW1mVUowb2tMbGhOSGNLTnd0VEJMQ1BMQmQzM3pNOTdVbkNtVWVpSXNP?=
 =?utf-8?B?Yms5RE96dmMzK1kwT1NtOERic3hVcitCZUF0TVRESGxNcnNUYXMwZTc1cjR6?=
 =?utf-8?B?WlQvenRvcHMzTHBSaE00dTBqaWxKcUNLSEU2VE9jcjFPVDNHQnpKL21td0dC?=
 =?utf-8?B?V0xBTHlaL0J6Tks3M0t6VzJZS3QyTzhtQmgrekpUWE1IZXcvMFRCWTVyQWpD?=
 =?utf-8?B?VHJoMHZFRnJHTTVSNnd5NFdyTFhjMTArVzdwN0ZyYUFyM2FNZUtqZWlPdUF3?=
 =?utf-8?B?VmtIenRncTltM0UvZjlURGF5OXlycWRvRWV4Nm5UamdBSkNMOUJNZlYwM1VP?=
 =?utf-8?B?Ri9lUGRDZDlMRldITUp3ZmFoK1JXa2FRcVJ5OXg2UGRnczlIV1dxMlh1NVFF?=
 =?utf-8?B?R3d6NjRSOHl0MWZpV3lhcDFFSzA4K0RhUDhUUy90Ym5hWVBkMmZJQmlNZ3l6?=
 =?utf-8?B?b2lRYTZ1dFgwcjgzVjM0V0J4eDdQdUtjWmFwVFNVdSsyWWlSb0hubWNPaTdY?=
 =?utf-8?B?clFBSTFhNURxRCtxU2wyTzJrVG1OREh2d2h6elU5VFF6VjIyMXA4VTRuOFdo?=
 =?utf-8?B?dUtoL1JPWkVmTmpHRFFFRlNzYVRNbkp6RVdzUDJqckdiMjNxUUg3WXRQaFVv?=
 =?utf-8?B?Z3FSbWFGUGp1aG96L1pqRWFMY0JPdzBKZXNyVFk1YWg1ZTJNM0l3ZWdNZ2Zs?=
 =?utf-8?B?V3oyS1RIeEFOcS9rY2hLQ3ZrWmVxc3JHcHZkYzJnTkdxSWJkNlV6NTFJRCtH?=
 =?utf-8?B?M3J4WXRtL3ROc2c2cXlCQWpGdm0zRlN3RFlTUFROZDJJdWo5Y1B1c3NjeWVh?=
 =?utf-8?B?ZkZVRWsxNkFGaDZJbGNOR0wvVmlmUmpoSHgyQnI2b0NuOCsvTWVrSkszVEdK?=
 =?utf-8?B?QnJmWFRkQS9VSTdqdTcydndjUmZ0R1ZBQW5uZWZCWGUzSklIUjNDQWdXWFYr?=
 =?utf-8?B?ems2amtsVWZaTGNiWlRLNHRKNTZiRnh4bHBsVS9xN0xOZXNZR3RhQVd6R1VI?=
 =?utf-8?B?NVc5Y0pwc2MxUGJjNGp6dlZZdVF2b2h3YXFiOC9UbjdwQi82Y2NNZFJXaFlY?=
 =?utf-8?B?WEFQWTJ2aVZraVRzekV0QURxL0pMN1BFTzE2U0MrSkp6NHFvbEN4bk1GajFI?=
 =?utf-8?B?eDBLZk1za0JxR1A3bFFSOXpkRTZoV0hzV1Zoak5JeHhmamZPR2h4UWUyNitW?=
 =?utf-8?B?Y1dtcEk5ZzFrbTQ0cjhCd1NSRFNtMEV0cEtkTmFtbzdjQlRjMUhBTkZCRHdR?=
 =?utf-8?B?Z1dtb2JDbnlRdzMxMUtRZkZaT3lZRE9JRkN6d2JGeHVtREtjVmdyOHljMTNC?=
 =?utf-8?B?Wml3Q3FISmlWR0RnY2FESVAxQnhCeWdEYy9OMi9vVzRMZ2s2RVJmdmdiU3N1?=
 =?utf-8?B?Y2ZSZVZWUXRhejFvendSVmo1Mlg4OTVsaWp4TGRIMStaYm1OSU1MeVpVNm13?=
 =?utf-8?B?S3NDQXNyRnRqM0lHZGRIU2I2SHlLam5mS0d6aHRyTzhhRTIvVUwxZkwzWmR5?=
 =?utf-8?B?NVJ1eEJKVlN4WWN3ZklNa0kxdEdjOVRyemJUSXV5Q01jNUpTeWVsSVBKblZV?=
 =?utf-8?B?UzBiMHZTRVN5MmJjbXl6R0s5b2RTWGJXNzA0VWczOGxUamJWUGVNaHJhVHFR?=
 =?utf-8?Q?xJXzBpjIfYsKQPZJlP5FzPA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432c1c5-7fef-44d2-527a-08d9da70216d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:48:58.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WiJxUwlQSB+p1cR+SLI17kN2BUoFFZRhP5I22VGotcb8bTrJQ8NdHyrW794xV4SpJLOU/ipOhrN7Ll1e2T8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6445
X-OriginatorOrg: citrix.com

On Mon, Sep 06, 2021 at 03:02:12PM +0200, Jan Beulich wrote:
> From: Chen Yu <yu.c.chen@intel.com>
> 
> Because cpuidle assumes worst-case C-state parameters, PC6 parameters
> are used for describing C6, which is worst-case for requesting CC6.
> When PC6 is enabled, this is appropriate. But if PC6 is disabled
> in the BIOS, the exit latency and target residency should be adjusted
> accordingly.
> 
> Exit latency:
> Previously the C6 exit latency was measured as the PC6 exit latency.
> With PC6 disabled, the C6 exit latency should be the one of CC6.
> 
> Target residency:
> With PC6 disabled, the idle duration within [CC6, PC6) would make the
> idle governor choose C1E over C6. This would cause low energy-efficiency.
> We should lower the bar to request C6 when PC6 is disabled.
> 
> To fill this gap, check if PC6 is disabled in the BIOS in the
> MSR_PKG_CST_CONFIG_CONTROL(0xe2) register. If so, use the CC6 exit latency
> for C6 and set target_residency to 3 times of the new exit latency. [This
> is consistent with how intel_idle driver uses _CST to calculate the
> target_residency.] As a result, the OS would be more likely to choose C6
> over C1E when PC6 is disabled, which is reasonable, because if C6 is
> enabled, it implies that the user cares about energy, so choosing C6 more
> frequently makes sense.
> 
> The new CC6 exit latency of 92us was measured with wult[1] on SKX via NIC
> wakeup as the 99.99th percentile. Also CLX and CPX both have the same CPU
> model number as SkX, but their CC6 exit latencies are similar to the SKX
> one, 96us and 89us respectively, so reuse the SKX value for them.
> 
> There is a concern that it might be better to use a more generic approach
> instead of optimizing every platform. However, if the required code
> complexity and different PC6 bit interpretation on different platforms
> are taken into account, tuning the code per platform seems to be an
> acceptable tradeoff.
> 
> Link: https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel.github.io%2Fwult%2F&amp;data=04%7C01%7Croger.pau%40citrix.com%7Ccdf115e71eb14429868408d97136a902%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637665301851513469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=D9sIoe%2BFAvia3OuRsT19VAxkTqrlnPHnKqTSKiW6pRM%3D&amp;reserved=0 # [1]
> Suggested-by: Len Brown <len.brown@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> [ rjw: Subject and changelog edits ]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit: 64233338499126c5c31e07165735ab5441c7e45a]
> 
> Pull in Linux'es MSR_PKG_CST_CONFIG_CONTROL. Alongside the dropping of
> "const" from skx_cstates[] add __read_mostly, and extend that to other
> similar non-const tables.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -484,7 +484,7 @@ static const struct cpuidle_state bdw_cs
>  	{}
>  };
>  
> -static struct cpuidle_state skl_cstates[] = {
> +static struct cpuidle_state __read_mostly skl_cstates[] = {
>  	{
>  		.name = "C1-SKL",
>  		.flags = MWAIT2flg(0x00),
> @@ -536,7 +536,7 @@ static struct cpuidle_state skl_cstates[
>  	{}
>  };
>  
> -static const struct cpuidle_state skx_cstates[] = {
> +static struct cpuidle_state __read_mostly skx_cstates[] = {
>  	{
>  		.name = "C1-SKX",
>  		.flags = MWAIT2flg(0x00),
> @@ -674,7 +674,7 @@ static const struct cpuidle_state knl_cs
>  	{}
>  };
>  
> -static struct cpuidle_state bxt_cstates[] = {
> +static struct cpuidle_state __read_mostly bxt_cstates[] = {
>  	{
>  		.name = "C1-BXT",
>  		.flags = MWAIT2flg(0x00),
> @@ -870,9 +870,9 @@ static void auto_demotion_disable(void *
>  {
>  	u64 msr_bits;
>  
> -	rdmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr_bits);
> +	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
>  	msr_bits &= ~(icpu->auto_demotion_disable_flags);
> -	wrmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr_bits);
> +	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
>  }
>  
>  static void byt_auto_demotion_disable(void *dummy)
> @@ -1141,7 +1141,7 @@ static void __init sklh_idle_state_table
>  	if ((mwait_substates & (MWAIT_CSTATE_MASK << 28)) == 0)
>  		return;
>  
> -	rdmsrl(MSR_NHM_SNB_PKG_CST_CFG_CTL, msr);
> +	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
>  
>  	/* PC10 is not enabled in PKG C-state limit */
>  	if ((msr & 0xF) != 8)
> @@ -1161,6 +1161,36 @@ static void __init sklh_idle_state_table
>  }
>  
>  /*
> + * skx_idle_state_table_update - Adjust the Sky Lake/Cascade Lake
> + * idle states table.
> + */
> +static void __init skx_idle_state_table_update(void)
> +{
> +	unsigned long long msr;
> +
> +	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
> +
> +	/*
> +	 * 000b: C0/C1 (no package C-state support)
> +	 * 001b: C2
> +	 * 010b: C6 (non-retention)
> +	 * 011b: C6 (retention)
> +	 * 111b: No Package C state limits.
> +	 */
> +	if ((msr & 0x7) < 2) {

I wouldn't mind adding this mask field to msr-index.h.

Thanks, Roger.

