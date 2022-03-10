Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C94D4DA8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288467.489137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSL7J-000673-0i; Thu, 10 Mar 2022 15:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288467.489137; Thu, 10 Mar 2022 15:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSL7I-00064p-Tr; Thu, 10 Mar 2022 15:54:16 +0000
Received: by outflank-mailman (input) for mailman id 288467;
 Thu, 10 Mar 2022 15:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSL7I-00064j-47
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:54:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 544179b4-a08a-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 16:54:14 +0100 (CET)
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
X-Inumbo-ID: 544179b4-a08a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646927654;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KbRWDr3sxAjW263RaXChrPW0m2P9F35LFaSMlCYEnU8=;
  b=d0SXmuJLkNB2trhW7tD3JcKpQPYrYkQl+9vQ6DQCGzeRChUudX+VX9QL
   3magrMjUUatE8DBWxxyM0EX8gHnlrL2Mcim7jlmqkzukVbQFHorEbdJfX
   eQ+OPQw0flloIcW2TtFtcj4inwAVqr6Op56DwZQ45YlpSu/rTOA3ZIfxN
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66329645
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WDADGqO0OXmu2LPvrR1Yl8FynXyQoLVcMsEvi/4bfWQNrUokg2BSz
 zQdX2iCbPeJNmanc9l2YYzg9UwC6sLWn4IwSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 MdtmJiPaywVLpL1s7UiYhtxLCEmBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlr3JEQQau2i
 8wxbDRDSDr+cw1zAkoFCM04g+2ZjCXyfGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSd1D6E/3SEluLJ2yThV+o6DLSl8tZ6jVvVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6jD2gZSnh6adoptOc/Xzls3
 ViM9/v2ARR/vbvTTmiSnp++oCmuIyETISknbDUdUAoey9D5pcc4iRenczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV//mp3X3DvBCHmoj2dyVk2TTVd12ltjosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxD4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+rDPSXOEelVbjNii9zVCove8G05F
 P4Fa6O3J+h3CrWiMkE7D6ZPRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYvF
 qhbIZrcWqoTItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nky
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:XhFOQKAEkLJlVNzlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="66329645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9HzRpSdyWLmp3wN5m2B/pFrdM1eNhwGsjOIcbPsyAbxil1CcBdn8S58lwIxXN0Plibu3QyZf9NF42JVDbJHvEs1PyX1hAxLd4ospq8e2czoG2pr0Bvs+/9eyE9ndbM8ClET7p6baNcM1mpdRGV0HXvole/zvSDdAm/2vEhYo1dSqsKpUfTS0Wf6FghCkluE1vM1x41aQNOPr2Zp7s6VnmBnjysLgF4iiH0NEi4s8dJUeHDuDJgF6gGqwux//HwWhB0CKgRuzapblckUMu8Eg4sxDm1ihVYyf40OkIQ+KESIBE3Xmqn/QMUUNKDdhwQr5Dk6NfHEdi2GeVOcLDevDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiJt5U5O8Z9CAexKMAcOxSWKg1/YLpXUdbmtbgPL2wA=;
 b=Vd3gZvsFmZamARcdVDV3Tu58SEW9Ii+6YkvwOscl+K9cUjl9iACUG6zdwlQ5dUyvzgmVtZNxJN9tQ0R+M/IS/u9Cg3J4HvF30t+An6qL167GEI6MjQiLJFdfL+hBRIX4N2WVlu9LVxtuFOSX9fAg0DwBrzNSya3oY9plkGMdLTNpvhyuDryaDfiPtv895lDG3GzsMx40VQVl7azrPdjXyGmd6jdLWFuTBj6Ts2D6CaVEdarcVhxb2GhDOa0n18a12sE2dGoo15yJZDJvAcy0gnRdM7Vx+ya3RNAjnMWjSyU0bCeaX+l5tpUsqAPkkNoOGiTtnkBG6R8Qa7008Oc84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiJt5U5O8Z9CAexKMAcOxSWKg1/YLpXUdbmtbgPL2wA=;
 b=u4h963tCWql0BdngbANk8DrD/VVuV9Oe1V10ch9TS3u7LyqYDJiyFSEcQPjuWKayPWY1MEimfzRqKQRPHGVCELJe4CvegjpsTAW4Mz5X84e6mHo6O1++Vcvm6NPqp21hyqA7vVqLbbWA9fHZTHnnhhvgjNPKDxNRvVvZBCL0EAI=
Date: Thu, 10 Mar 2022 16:54:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <YiofHD23sCnvLBfO@Air-de-Roger>
References: <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
 <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
 <YijQc9DejYAo3EcS@Air-de-Roger>
 <500E2C83-DC6E-47C0-B345-D03F67472196@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <500E2C83-DC6E-47C0-B345-D03F67472196@arm.com>
X-ClientProxiedBy: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ae3a2e-2954-46d3-4a18-08da02ae3661
X-MS-TrafficTypeDiagnostic: CH0PR03MB6196:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6196996B10F3D163D930C5ED8F0B9@CH0PR03MB6196.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EW87H+YWVm2C2w+An0JlASTBv6V9Q1wrjrSwvooOUwm3K8IY5n+giW6O1FpxfizGFyu+1sF/c53eKLg2vrOU8OCW6QZmObVsIuEjX7tGup5uwMMteJUca4aFJjzxeX/OmMyJGIY80gzZVtrMtm4xawICDVN/6OTBgu4PZP5sPPvfJijhpWkcgCEuol4w7AofRS9pCpwE7WiwUJ0yHBNvun8/3zOSMrg/EYrcUSop5OmAtTKq0FYjdbw0oiB8QJFLd3LtAcZ0Te6VamNNMtYVUuW1dUGes7Q/yXNNVhHNS0MtEzKinJoT6UslWi3SHCk6imBGN6thRRlcLpzNSnq0vKvc+2vSoutCJBsdSPQ3jL6v54cT0lIA+mTKKSGsfjZhJoyBdzYLF2Zo4bwzacgnxEIdFbNwkEflLu79cw6RqSw0Id7wRXME+jb1a2zkNR+rV8qx0zDM3eTZXSemmRmwVHTV1fVcnzLy5LXPeeQYdxDNHo8Fwu8/WdImOUNipQL1HZThGQGaXFyCFkMcmv4GWsQ+atOACSN/RVrwMSOWTnxzMGxw+h3WKbNKyjxUChqdDNieHBEtjGe8svUrb+KsAf6yPVnrb2Wn5DmoN+TMm8PN4nvD8Ofix+dUAbERzfBpVGh5eg+eiPhjJaPKCY80cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(83380400001)(316002)(54906003)(5660300002)(6486002)(6916009)(8676002)(4326008)(8936002)(66476007)(66946007)(66556008)(26005)(186003)(508600001)(6512007)(53546011)(6666004)(9686003)(2906002)(6506007)(86362001)(33716001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkhkSVFXY01OMHhSMXZKR0RoYjlYMUR1MmprVWZQRWpzR29oeERuRG4yZXpS?=
 =?utf-8?B?b2ZtU1VIalVyd2l0VFUwVnhNY3F1T2dzRjFCSlE5OGtPRmV2TGRVa2tzcmNv?=
 =?utf-8?B?OHF0OE9BemRTRWdWdEZFWnplNWdsTzg2MEZobXVEM3Z6UXVJa0JSbnNrOTc0?=
 =?utf-8?B?eEpDWGtoVG13ZnVTbXBDTGlRdGN1NFlMWDlCMGtMNkNIanNNUzM1MjI1K2dQ?=
 =?utf-8?B?dU5uM212UW0vNXJ6RnY0RVF4K0N2WWkvTnRxdlI3Qkp5Y2VJYnVybnJJYnZw?=
 =?utf-8?B?dXZ1aFI3UThZelYzMXpuYUtNWEFIOWF6SEpnamdGblBldmRWcFlrZms2ZVh5?=
 =?utf-8?B?SWtQdXR4VW5TR1d2NW1LK3J1S3g3UFJZVE1qUElZZU9WQ0F0dGFlNmlnay9m?=
 =?utf-8?B?bk40SXdabEE5QUtteENZNVVDSjc0alZCdjZkWGZzblJsNUxvek5xWnZ0WElT?=
 =?utf-8?B?NmVYRWZUSGNjYVFhVDdINmp0RUsrR21xdWpteVhXZWROTUdpdjFMaFJzUXVQ?=
 =?utf-8?B?RE04U3NOUW5maEZiZEV4eUhGRkpkZVMvYklxRk1XdkxuMy81R0Z0OXdsb3JO?=
 =?utf-8?B?QnRvemFyNUIxSnFuWnFnT1FTa3ZCelgrdE01akRWRlVyK1h2UXV5MlNKcDVu?=
 =?utf-8?B?QjVyeGFhLzJvNFEvd1VUT1RTbDU0aXFPVncwRk5IUmJXRXlaMGNZeHkwdmJm?=
 =?utf-8?B?MnE4bVFlUXBvOVovajV0NTM3MWdpMW00c3dDZHNXZGMveE52RWNZZ1craENm?=
 =?utf-8?B?YXVXYmQ0S1lZUGxnWXgraThKWStia29rMHp0bHVGelZQZUNGdHdmOUNQaTZn?=
 =?utf-8?B?R0tqTXdiVi8zVDJReE5iM3Iza1ZvSWdGTjJqSWdyUDhJUkdXanFzbHdId0Uw?=
 =?utf-8?B?VGtKZkJmVWtEaDVLKzJqQTZ3Q0FOb3RoMnlQYk1BMUc2RkMvbTNOWEZ1MXpG?=
 =?utf-8?B?UUgyZG9xSHVWQ2lrcHl1cmVPbDJveUVhOHBxMGI5V2duYkR4TFRFT3lRMXpB?=
 =?utf-8?B?QVc5VnBDSzlKaENyZ2lSS3hMV1dMb2lybDZCaHVoY3Y5dzZySmc4VENKSXZV?=
 =?utf-8?B?TXFwNmNzaGo5SXhmNjJYQ0QxZU95OVlESlJRUXVYOXpIS2xIc1NEc2ZjRlZB?=
 =?utf-8?B?TE00aHptK3lpaHZvcU53YzlaNU5yRWdOVHgvcTZMalZqZDRPc25GWUdZMjBu?=
 =?utf-8?B?NFJERVlGc1h4MWJrRGh5K2xyVk8raU8weWpreDVvblRHK0lRb1doZ2FMWjFM?=
 =?utf-8?B?VEt1VnJCY0hVY3MySnM1am8yN3NlZFBrZ2daYW90QXRpc2ExYWthU1grQXZj?=
 =?utf-8?B?Z01Da1RXQTE1a0EyYzdkRTJBeXk5S1ZLT3VsVm5IWnNnRTZvSDdQRVcwSTdD?=
 =?utf-8?B?QytJdFlLM1ZSN0ZMRWQ2WlFRaGFCcUpUbWEzTUFIOThwNlJjbWpWL1ZWcHRj?=
 =?utf-8?B?K1ZCdk1KTDhyZjFKL1FKSSsyUTNKMFNmMkdSZ0xHSFhjdFRJd2h1dkNJem95?=
 =?utf-8?B?eWltQkxKcXJzUVBDVW5xUzdESlA3bTdFNTl3VzUrem5MT0xqdmV6QXZGYjJo?=
 =?utf-8?B?c2dDV29JdkVyMlJWSHNDVy9vNGZING9TR3B3MU1KRFFxSjR6VG1OODRhanBG?=
 =?utf-8?B?NzVSdlVnbWw2KzZYVmd3bWttcTYzNVB1MWRycXhDWHJTR3NZQldNeHc5T3kz?=
 =?utf-8?B?UUV0MzhKUlQvK2M2eUl0Ny9zbTF6Z1ppM0tHRDd2aUJrNWR3Smx5MjBtSXZP?=
 =?utf-8?B?aDBLQWtUWVc3VkU0RXVPMjE0NVpXaGtHS29hamdFUTR5OUwxZWx2UGgwbjJS?=
 =?utf-8?B?M0JTdzQ4c0xLa3hJSjZUQk5HZzgyRzFDZXk3N1JvM3NvRHNCaTZ0dWtEVmYv?=
 =?utf-8?B?YThoN1d6ODF0L1FaL0RrL2xWdmJrUEhWbjFHcXovbVVhTjZzWCtkUXd4OXVN?=
 =?utf-8?B?YU5sNXBUMlM2ZmRCRzYwUUw3WHBsZnJVZWM1Q013UXEzUW8rTjFXbE5WOXhh?=
 =?utf-8?B?UUdOMlBwbkJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ae3a2e-2954-46d3-4a18-08da02ae3661
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:54:08.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSkzoPsjqCwnKviHZ6wYSdrzNx7O4IoKvR/feXF897W6tLwEq1hR+fH6E7ExGSdaxG+L/nQOtWVT/6BQIuBiFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6196
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 11:48:15AM +0000, Rahul Singh wrote:
> Hello Roger,
> 
> > On 9 Mar 2022, at 4:06 pm, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Mar 09, 2022 at 03:50:12PM +0000, Rahul Singh wrote:
> >> Hi Jan,
> >> 
> >>> On 9 Mar 2022, at 10:17 am, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 09.03.2022 11:08, Rahul Singh wrote:
> >>>> Hi Jan,
> >>>> 
> >>>>> On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> 
> >>>>> On 03.03.2022 17:31, Rahul Singh wrote:
> >>>>>>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>> On 01.03.2022 14:34, Rahul Singh wrote:
> >>>>>>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>>>> On 15.02.2022 16:25, Rahul Singh wrote:
> >>>>>>>>>> --- a/xen/arch/x86/hvm/vmsi.c
> >>>>>>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
> >>>>>>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>>>>>>>>> 
> >>>>>>>>>> return 0;
> >>>>>>>>>> }
> >>>>>>>>>> +
> >>>>>>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>>>>>>>> +{
> >>>>>>>>>> +    struct domain *d = pdev->domain;
> >>>>>>>>>> +    unsigned int i;
> >>>>>>>>>> +
> >>>>>>>>>> +    if ( !pdev->vpci->msix )
> >>>>>>>>>> +        return 0;
> >>>>>>>>>> +
> >>>>>>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> >>>>>>>>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> >>>>>>>>>> +    {
> >>>>>>>>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> >>>>>>>>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >>>>>>>>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> >>>>>>>>>> +
> >>>>>>>>>> +        for ( ; start <= end; start++ )
> >>>>>>>>>> +        {
> >>>>>>>>>> +            p2m_type_t t;
> >>>>>>>>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
> >>>>>>>>>> +
> >>>>>>>>>> +            switch ( t )
> >>>>>>>>>> +            {
> >>>>>>>>>> +            case p2m_mmio_dm:
> >>>>>>>>>> +            case p2m_invalid:
> >>>>>>>>>> +                break;
> >>>>>>>>>> +            case p2m_mmio_direct:
> >>>>>>>>>> +                if ( mfn_x(mfn) == start )
> >>>>>>>>>> +                {
> >>>>>>>>>> +                    clear_identity_p2m_entry(d, start);
> >>>>>>>>>> +                    break;
> >>>>>>>>>> +                }
> >>>>>>>>>> +                /* fallthrough. */
> >>>>>>>>>> +            default:
> >>>>>>>>>> +                put_gfn(d, start);
> >>>>>>>>>> +                gprintk(XENLOG_WARNING,
> >>>>>>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
> >>>>>>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> >>>>>>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
> >>>>>>>>>> +                return -EEXIST;
> >>>>>>>>>> +            }
> >>>>>>>>>> +            put_gfn(d, start);
> >>>>>>>>>> +        }
> >>>>>>>>>> +    }
> >>>>>>>>>> +
> >>>>>>>>>> +    return 0;
> >>>>>>>>>> +}
> >>>>>>>>> 
> >>>>>>>>> ... nothing in this function looks to be x86-specific, except maybe
> >>>>>>>>> functions like clear_identity_p2m_entry() may not currently be available
> >>>>>>>>> on Arm. But this doesn't make the code x86-specific.
> >>>>>>>> 
> >>>>>>>> I will maybe be wrong but what I understand from the code is that for x86 
> >>>>>>>> if there is no p2m entries setup for the region, accesses to them will be trapped 
> >>>>>>>> into the hypervisor and can be handled by specific MMIO handler.
> >>>>>>>> 
> >>>>>>>> But for ARM when we are registering the MMIO handler we have to provide 
> >>>>>>>> the GPA also for the MMIO handler. 
> >>>>>>> 
> >>>>>>> Question is: Is this just an effect resulting from different implementation,
> >>>>>>> or an inherent requirement? In the former case, harmonizing things may be an
> >>>>>>> alternative option.
> >>>>>> 
> >>>>>> This is an inherent requirement to provide a GPA when registering the MMIO handler.
> >>>>> 
> >>>>> So you first say yes to my "inherent" question, but then ...
> >>>>> 
> >>>>>> For x86 msix mmio handlers is registered in init_msix(..) function as there is no requirement
> >>>>>> on x86 to provide GPA when registering the handler. Later point of time when BARs are configured
> >>>>>> and memory decoding bit is enabled vpci_make_msix_hole() will clear the identity mapping for msix
> >>>>>> base table address so that access to msix tables will be trapped.
> >>>>>> 
> >>>>>> On ARM we need to provide GPA to register the mmio handler and MSIX table base
> >>>>>> address is not valid when init_msix() is called as BAR will be configured later point in time.
> >>>>>> Therefore on ARM mmio handler will be registered in function vpci_make_msix_hole() when
> >>>>>> memory decoding bit is enabled.
> >>>>> 
> >>>>> ... you explain it's an implementation detail. I'm inclined to
> >>>>> suggest that x86 also pass the GPA where possible. Handler lookup
> >>>>> really would benefit from not needing to iterate over all registered
> >>>>> handlers, until one claims the access. The optimization part of this
> >>>>> of course doesn't need to be done right here, but harmonizing
> >>>>> register_mmio_handler() between both architectures would seem to be
> >>>>> a reasonable prereq step.
> >>>> 
> >>>> I agree with you that if we modify the register_mmio_handler() for x86 to pass GPA
> >>>> we can have the common code for x86 and ARM and also we can optimize the MMIO
> >>>> trap handling for x86.
> >>>> 
> >>>> What I understand from the code is that modifying the register_mmio_handler() for
> >>>> x86 to pass GPA requires a lot of effort and testing.
> >>>> 
> >>>> Unfortunately, I have another high priority task that I have to complete I don’t have time
> >>>> to optimise the register_mmio_handler() for x86 at this time.
> >>> 
> >>> Actually making use of the parameter is nothing I would expect you to
> >>> do. But is just adding the extra parameter similarly out of scope for
> >>> you?
> >>> 
> >> 
> >> If I understand correctly you are asking to make register_mmio_handler() declaration
> >> same for x86 and ARM. You are not asking to modify the x86 MMIO handler logic to
> >> use GPA to find the handler?
> >> 
> >> As Roger also mentioned that vpci_make_msix_hole() is required only for x86 to clear
> >> the identity mapping. If we make the vpci_make_msix_hole() arch-specific there is no
> >> need to modify the parameter for register_mmio_handler(), as for x86 and ARM
> >> register_mmio_handler() will be called in different places.
> >> 
> >> For x86 register_mmio_handler() will be called in init_msix() whereas for ARM
> >> register_mmio_handler() will be called  in vpci_make_msix_hole(). In this case we
> >> have to move the call to register_mmio_handler() also to arch-specific files. If we move
> >> the register_mmio_handler()  to arch specific file there is no need to make the
> >> function common.
> > 
> > So then for Arm you will need something akin to
> > unregister_mmio_handler so the handler can be removed when memory
> > decoding is disabled?
> > 
> > Or else you would keep adding new handlers every time the guest
> > enables memory decoding for the device without having removed the
> > stale ones?
> 
> Yes, when I will send the patches for ARM I will take care of this not to register the handler 
> again if the memory decoding bit is changed. Before registering the handler will check 
> if the handler is already for GPA if it is already registered no need to register.

I think it might be helpful to post the Arm bits together with the
moving of the x86 ones. It's way easier to see why you need to make
certain things arch-specific if you also provide the Arm
implementation at the same time. Or else it's just code movement that
might need to be redone when Arm support is introduced if we deem that
certain parts could be unified.

Thanks, Roger.

