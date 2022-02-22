Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73E4BF465
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276568.472762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMR9l-0001ih-CW; Tue, 22 Feb 2022 09:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276568.472762; Tue, 22 Feb 2022 09:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMR9l-0001gh-8g; Tue, 22 Feb 2022 09:08:25 +0000
Received: by outflank-mailman (input) for mailman id 276568;
 Tue, 22 Feb 2022 09:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CiU=TF=citrix.com=prvs=045c9559e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMR9j-0001gb-Ig
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:08:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa4ef12-93be-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 10:08:21 +0100 (CET)
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
X-Inumbo-ID: faa4ef12-93be-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645520901;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=G0yC55bS0sqN/tOVFAuf3P9vMcxoifgI3TwlFxeqjLk=;
  b=U/n45GF12imljsjNWCia2roEwtVjUNGVHIza/FDZ1WUiUNIybhPhmetK
   0ymH3otaFQ7vBjfnNfdoHFF4+TQoPfiA8beSpUJbqh+DI7VNISEHhdlDY
   2RdysXu2NczXYfVXstyO/osrlvSxXYcWxtVZRNmaBHS1YtuV/3tBVemfH
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66953380
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fy0KR6wWNQwpTpPDbLh6t+cgxirEfRIJ4+MujC+fZmUNrF6WrkUFz
 zEcWDjQOfuONGb8ed4kPYu3/R8H68TXmtAyQAdkryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqZGxVVx4Hvb2xr47a0B6DhljJIhvweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4fQK2FN
 5JxhTxHTC2RewRWC20sJsgisO2MpnLFdA0JpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYAVttMSLwaszvTkIzsuiSEPnUdaxd4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPa1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGwiehY0b5xYIGeBj
 KrvVeV5vsQ70JyCN/IfXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrOmOXCPqdZJRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:C/PmdKgQFcgEe350mLDb2PzmxXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66953380"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4Gb189I0O7cSnk6YGFQE79K/I8ebJXuI8erlv8XnhrJ/fgoUx1rvRXWsem2sgtFy92LoK/i83RLmI9yfpOCe2aZBgJ/XgnG8Gv8DcFPOYe4xa26LKWLZ2wo+iacsBj9QD4H2NjSmVmmSNPGpO4jwk6UMcOioPUbmyKsOEZMsV3k6AUJgwoKsYMWtmHH4vkB5v6xeapznw39OyxEFFIR/wBxpiT8W/7JHlDeFOeYZd0U9f36EUKgG0m/PMr288pFQD5hsigHYw8W2583V3lKOk9loWtgyA78Nlocz4QzZQvgnZevP5E4ZC6yPOR/SspY/5+KNIbwO8Qb4fh5zAagOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dS/IeSJ8DSlTMyCGhRUeFVmOB5eHgZdLu+OSOPyKhU=;
 b=oUG8iRGAPRsoNo0RtNQhKnDFoqfBSU6Odl/xw/Uav6cw44aj6qj2hxwqAPHah1BDp5T1BwyR1C8sOjbOhFjBtRS+0H1diP/ZKmenRhu0exa2txFpFI/zjVSgj3ijbpj8jtCqpeO7HLZFsAru0FwLty0oJJAQvrSic/4kBwtViJxoGTRODp8uICgj27vUoF1e22V6KYXCc8362j7dSCIdM5QD38c6cK3zT3AV6F3PKW+HOBX/M4ZAoseXj+mpnS9Xp/m+ODaxXjMljcvYdXcN29hwJjaF6cL8+KjpMSMT2IcSVfr2QBMd3LjJZhrj/FsX8u2SkOT9Mplko5Q7y1/W8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dS/IeSJ8DSlTMyCGhRUeFVmOB5eHgZdLu+OSOPyKhU=;
 b=r0IT/Lb3zd5x1ETMsB10F+Pfm23wmY6OzoxiKjDqRa5u0oKr0SAKUjWFEepCSS3zSspuPKN7OwkgsIaVw/pRkMPFfnfnTGDIJ1Wto+11xI5Pil8RLJEAV+mKJqELpsxaEMS8iNZSUTEKEAyZJKGdeBdTZuN+sXW+bqtKxv6GoMk=
Date: Tue, 22 Feb 2022 10:08:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86/mwait-idle: re-order state entry/exit code a
 little
Message-ID: <YhSn/Nsx6eElXpSU@Air-de-Roger>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <2db7bc79-4fe4-abf6-9e5a-83055af9a78a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2db7bc79-4fe4-abf6-9e5a-83055af9a78a@suse.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d53a7e-8915-416e-6215-08d9f5e2dcaf
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5424:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5424A325F53D99D5408BB3108F3B9@SJ0PR03MB5424.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucTMvirhWPnR6ZV2GxojKeRlzk9onRA7R/mN83AFD9hAxpjRQ4LH2vsD6QQBEMH99tml4Ieq2SvTDWwehLRe0JmMxQfEzEP/ci7SiBRwwQk2P9Zb6AZPmJGmpRgFF/5BG/Ejfz9fQhceZBo+yLf/6kHpx9Ut8W0Ev/rtEYt7+dIISEBhhnKvawL2uNvMAX63PsQUZcX3LL+q7H/ENiMQ7uoCjpfdd33Oce6yWRK4XbbS8fIc0ZRJSvynj9uv8APMR8oFAhy49uvFzaAxNQ4Q32WjrEemLbppIzkPsR9Bn8RjW+bwiqmBLi23wO7tTuqDqpRy6igEundlQupbl3LWZvQcVm3res4DwcgpOdAEtwITfEp03i6Wb9GmpyBBcw51PVAw2IZHIYY8MBXCm+fAHnOCA+fmkBmeUTAtAVPeKgQ5V7PFwQO5ATeK2G7TBZfTWpKx2989Y7o+oqwleoektE6wzhStdsV1SuXsGOzllK3qIHL2nyA6jIiz/LIlnyvXPG79kQS+8rlvcOuRHNNOyKDDRaj9VukHopQRptX9wYHM6zATFOnO6Tw+1XnoqNP+VWdVbBddz9fNLgbWsK/CqBvIfy2g0xohs1TlOo5i+RKSZnbTIv67NltQb6Hf8D/5PFkiXL7WdgDt2FZFmszeJsMuxH1R6q2J1sxgwfvI3bUpam9ZFceBlN+H683EwG9Jvy4CBI7aF3oN+rwIzLzYIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(9686003)(6666004)(85182001)(6506007)(6486002)(6512007)(508600001)(2906002)(38100700002)(66476007)(66556008)(33716001)(5660300002)(8676002)(4326008)(54906003)(6916009)(8936002)(26005)(186003)(316002)(86362001)(82960400001)(83380400001)(66946007)(169823001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alpYOU9XNWFtbjV5RnhEQ3V1ZFJFL3FNbm9CTWZ4V1VRUlRHNUN3MW5KME5E?=
 =?utf-8?B?YjBYYkZ2RlJtaCs1U3BBWGgxZ1M4aWI1R2ZFVTFwclpueVhuRldhMkVjZDRz?=
 =?utf-8?B?eUtrQzRNbmJuYlUyK3VxZjI2TXRUOUJ5eXNUOEVORkh6RHVtNmlwd3I0bkZS?=
 =?utf-8?B?b0RNeTR6eW9FL3dpSnRHQjJna3ZEbGt4S2gvcERabjNoY0F5UDdTTnNPY1E0?=
 =?utf-8?B?S3BhSktiQ1FQUHJiZlVaZDljQXFVVld6bjd6UTdGODBueStEU0U2c3lJN0ov?=
 =?utf-8?B?VXQvMGxWZGN5ZFFGV2JaM2J3clNCWkZGYk5WbXBtTWZoU3daSGtnQTE0bENr?=
 =?utf-8?B?M3pPQzYxeW0vN3ExeC9uVVorYVVDSlRYQUwvMGtualUyUGljbVZtV1NiSFhh?=
 =?utf-8?B?Y2xiWS9pbThNYWdsa2Z1RGRmUXVYeS9WWXlTSmJHbno0VldRQ2s1T094UW90?=
 =?utf-8?B?b1BCTGVjbTAwbnkwd0VDaFJIcElucU9kRDB1aWxDRk1uU1FRTkZONzdyRDYv?=
 =?utf-8?B?cGxXUHA2bjBxb2RTSWljQy9hZjBYcXppa2FIVHc4WjFYSGJPV0tScjJMTUYx?=
 =?utf-8?B?bWZKZmdQZk1yQ29IMWxrVEIyTHpxcG9UWHUycXRCSDY2MGdBTDlSZjRIZzNo?=
 =?utf-8?B?T1UwaWU1MExKK3MxMkhUZlN6L2ZaTVBHRE9LLzVpWm55dFhjSm5zaUVmMHQ2?=
 =?utf-8?B?Qm40YURUaGFtK3F3VzA2RWFEc3IrektLOWplS0hGenlEeFpEY012NHc0VmNZ?=
 =?utf-8?B?RWZhM3A0Z1h1Z00vVDZzU0UvNUlyeUpzQWp5Z25FQ005VDR5NWVoQ1lqckNI?=
 =?utf-8?B?emtZbXhtSURTOUZnNm1oUjlYMUFXWTA4cmVaOXQ2RHVRN2N6NU42bE5yemRw?=
 =?utf-8?B?cWx0ZEdKdUdZQWZtVStBQVNoNnQrbUNYQ28rRktFSy95NE5BU29YZ3hJT3Bk?=
 =?utf-8?B?UEJFS1JyQmRjdC9Td3NWbXhvZVlodXRDbzlzZ2lISmNiUXVNcHc4b3ZHNFFF?=
 =?utf-8?B?VXE3WFhiZlJmaUQvU1k2UzlFellZL2dBMVN5NkE0S1p1M05iSHB6eG9tSnJD?=
 =?utf-8?B?TDdlSWZqcHNKcU00eVhKcWo2Z2lYRTZNcU00aitNS3lHY3JkeHN3bStwNVFG?=
 =?utf-8?B?OGhxNEpqMEt4azVSNXdaT2JERUN1a0ZaSTVZNzdyS0ZDNXFoOWw2bFJuRXJs?=
 =?utf-8?B?T3djYVNxSjBRNDF3b1lHWVR4TStZeFZCMU1sNm5FaFJvdCsxeHZSVWRsL2Zn?=
 =?utf-8?B?c0RyMXp5ZU9XbjA4b1VkUThmNGpkbGp2Y3FKbVRzV0ZzazhRNWZLdVQzMGdJ?=
 =?utf-8?B?cG5TUHpUdU84OEkwd3hzV0taaTlHM3FtN2cwb2RhYW5VU1I4Tk9kZlpWaGk2?=
 =?utf-8?B?aFEwbnh4V01udUlpVDZraW1NZDRkeGJIWEVUd014aWVXQWtXMzhNMzB2dVg1?=
 =?utf-8?B?MU9McDRSZjRKUitud25RS0xLWTNtZjhNaWMzR0RzMHU4OFc5eU5CNFo1Si8x?=
 =?utf-8?B?RVgxb3hkRXlPUmQ0WkZzcXpwTHQwMTMwY0hrOTJmTUFBK291OS9tZTZXOEty?=
 =?utf-8?B?bEloTUMvd1pjQ2RDT3A4bzloK1VKS055SUFETllyWU9RNDJicFFFR2kxYlM5?=
 =?utf-8?B?Slp5VVQyZlVXNG85U2FBejZHSWl0S0U0U2t2TW8zNTBGWmRVQnBCcGNFeHNR?=
 =?utf-8?B?Mm1Pa0hySEdZRVJJbXhTbVc5eXJFK2xMUll4RnBrNG1majlSTkRCZ1pVS000?=
 =?utf-8?B?QUxRWHovWHY2RXhOdWpmNjZxWHY0THdoN1BHYlI3YUxmQ2wydUhkRWwvWE5T?=
 =?utf-8?B?SlRCeHI2WGNtUUFTN0NuM3VYNUkzRFkrSFpIUHkrb05qVE5RQWpNZ0dLekRu?=
 =?utf-8?B?ZVAzajZhNmlSeUEvbk5vMWNXVzk1dE5vNTN5czBYY1RkWTRRVGFGS2Evc2RR?=
 =?utf-8?B?Z2dCazlmbU1sc2x3OWJXL1NyMkFQUDUxcGxZZEhWejNvenFhdHVDSUw4MllC?=
 =?utf-8?B?aTdBb1cwSml1RFRWMHczaFRMMjI5NWtGcFhONTZVUi80TXRmQmtCbWswbFpm?=
 =?utf-8?B?emwxWEJhTitJcG43TlViNW9wR3BOb0RxL1dhK1BkVnhsZWpwOWRQamFLem1S?=
 =?utf-8?B?aXJGTTYwb3g4QitoUUdFMlpZdkFTUTl2ai95MGFJUDhXUWhpRktnMzE4aXVZ?=
 =?utf-8?Q?diJEe5eHekMec280QWbcKUA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d53a7e-8915-416e-6215-08d9f5e2dcaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:08:16.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vGbbWUfrZGZ+bhNvbCRvMkMQKiMu3H444JnKYp9ydeUZ73AEnHWJnCOygajSo5gXPaxgAv/Vl7KZ2ikq3FRag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5424
X-OriginatorOrg: citrix.com

On Fri, Feb 18, 2022 at 09:35:10AM +0100, Jan Beulich wrote:
> The initial observation is that unlike the original ACPI idle driver we
> have a 2nd cpu_is_haltable() in here. By making the actual state entry
> conditional, the emitted trace records as well as the subsequent stats
> update are at least misleading in case the state wasn't actually entered.
> Hence they would want moving inside the conditional. At which point the
> cpuidle_get_tick() invocations could (and hence should) move as well.
> cstate_restore_tsc() also isn't needed if we didn't actually enter the
> state.
> 
> This leaves only the errata_c6_workaround() and lapic_timer_off()
> invocations outside the conditional. As a result it looks easier to
> drop the conditional (and come back in sync with the other driver again)
> than to move almost everything into the conditional.
> 
> While there also move the TRACE_6D() out of the IRQ-disabled region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Moving the TRACE_6D() may be a little controversial, as this could lead
> to a sequence of trace records not actually representing the sequence of
> events, in case further records get emitted by interrupt handlers. But
> with us now conditionally enabling interrupts around MWAIT, that issue
> exists already anyway.

I think that's OK. We have to priority interrupt latency over trace
readability.

> Unlike said in the earlier outline of the alternative approach,
> errata_c6_workaround() cannot be moved: cpu_has_pending_apic_eoi() needs
> to be called when IRQs are already off.
> ---
> v4: Different approach (and title), as was previously outlined as an
>     alternative.
> v3: Also move cstate_restore_tsc() invocation and split ones to
>     update_idle_stats().
> v2: New.
> 
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -847,26 +847,25 @@ static void mwait_idle(void)
>  
>  	update_last_cx_stat(power, cx, before);
>  
> -	if (cpu_is_haltable(cpu)) {
> -		if (cx->irq_enable_early)
> -			local_irq_enable();
> +	if (cx->irq_enable_early)
> +		local_irq_enable();

Now that I look at this again, we need to be careful with the enabling
interrupts and the interaction with errata_c6_workaround.  Enabling
interrupts here could change the result of the check for pending EOIs,
and thus enter mwait with a condition that could trigger the erratas.
Hopefully CPUIDLE_FLAG_IRQ_ENABLE is only set for C1.

It might be prudent to only allow setting CPUIDLE_FLAG_IRQ_ENABLE for
states <= 2.

Thanks, Roger.

