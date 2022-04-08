Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8654F9963
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 17:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301616.514834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncqVK-0007nZ-IT; Fri, 08 Apr 2022 15:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301616.514834; Fri, 08 Apr 2022 15:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncqVK-0007l0-En; Fri, 08 Apr 2022 15:26:30 +0000
Received: by outflank-mailman (input) for mailman id 301616;
 Fri, 08 Apr 2022 15:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncqVJ-0007kk-5E
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 15:26:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40810de7-b750-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 17:26:27 +0200 (CEST)
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
X-Inumbo-ID: 40810de7-b750-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649431587;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=j8Y/KsIZX2DxU5o+pXEa2Gk2zlV07+AADXawE89UsfI=;
  b=UHpLNdO4OyEU7Z5kjPq0pNOdLWyceTg/e9u4/tPe//aQvgEzs/PhjSwQ
   +RBYHUiqf0Vp/RnCUMNghEQJbM5QrCcOCAs0D6QC4vfHESk9EIKzqyq2/
   pYd2v/N7vIMbkYYiO39Vc4u6YVCyslvcbQVNRkdh0MFSkWOdOROUJbe3q
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68270731
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F/E5CKqcQbXPCsF62QHQwhDius9eBmL2ZRIvgKrLsJaIsI4StFCzt
 garIBnVO6zYMWX3eYtwaY6+8hsB6MeGmNc1SwY4qSFkESMX9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 YOq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBIYPQv+klSiBkIg5TD7xq25qfECCVrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZpDNmIwN02ojxtnIW84KLMXv8GSq3DOURNVthXE9LJu2j2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZmjlScyW0UDBw+TkagrL+yjUvWc9VEM
 FAZ4TZrpKQ39UqDXtT7Rwe/onOPolgbQdU4O+8n7ACAzILE7gDfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf46TvTz1IesX2itn
 Xba90DSmon/k+YU+bmc8Gjeug6dibX7XyIWw13mBki6u1YRiJGeW6Sk7l3S7PBlJYmfT0Wcs
 HVsp/Vy/NziHrnWynXTHbxl8KWBoq/cbWaC2QIH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrISIyNuhP8NIMmjn1NmOmvpnwGiam4hT2FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6nnk73jOfOOyHMEN/p1WdiiMhjsctoRy2Pr
 b5i2zaikU0DAIUSnAGJmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mtscl3het/0NzI/gp
 yjlMmcBkQaXrSCXeG2iNyE4AJuyDMkXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q/laUkE
 KRfI5zo7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnPfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:qtspq6rd5o4dZp3+4Ger8jkaV5vPL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5lUUtMPpZzfSKJMB25ffvtChPaHb21LtBOB5ryw6SHlIndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="68270731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7X2wzsFGmAOjZxUDh5w+1JuCn46hI5ziFgjRci45m46hbCLoUCYzCpSus3asUXbqp9+Ima0xz7QB4XWB17U1fEyATCeB7rPAMXieDTAJ8vis7cgsnS/2yGJukfI8SDGUVvWL+d3ljUxPzBF1CwLVm5aWhRJnzR4HGhIS89R+ujQCSkc3h7VnS6eZql/XOS8ib4b+0V7M/cQP+gHQGi87Vsv/zSiICFBLJcRWK+lOjftnYczSI6ss7SgxLdZkrbkSlQHjU5LxlZDwa4N+53ehvM0PeNcoYZmpjDUT326+zRTF66OaccO5u/tB7GA/B18kkpONN9zBnKDcZg9ZYqpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20joXjWoCsFs/bgDV9BSrLGsWkq/pure/OzURUl4wXk=;
 b=h+uX2gbgJ2sM/n1yKCSW9fjA/Bcf6pIXWqlNUYKc180HV7WWSJqtMRccd8KY8Zskp9QIstJVSxGcrfwFofh/AZOCnvwJxI0onPlQltZIj3kwIOPNaTIOjH9EL4skAI0JtlWMkGQl33hfL12QWVMD7OfRr85ROzEtNEEJ/XFqHzGC2FEfPkup06fx54/blulTe+I5SXC7SzCqdh4s6oEflB9QLlXZPwNHIXG/gggaeXl3BY7m6xPKnj1lXYfl+eJzWr4us30B7lhC5Mv7QmQ0yhRjzdSUR0oG8J770v83J9FGL2arYQ6MLKVYG68t5f7UtwDrkhx/eir94HUmUUnIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20joXjWoCsFs/bgDV9BSrLGsWkq/pure/OzURUl4wXk=;
 b=XsVb1zlsbaBnghWeu1ofOXUaP4p70EFJ2mFbb3TY3QcsUyEmUTXm6lTCwhcdTVqO6PCxLOKZP9asqNUq0zqcrCyz+GlKImOwodHlM0NPkUq0/wkmZrusTkOaNPDPxNXr1idoSCHQazERte21/Zr86UmaaeHikVqeVGPfDqtGpGA=
Date: Fri, 8 Apr 2022 17:26:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
	"osstest service owner" <osstest-admin@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Dario
 Faggioli" <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Message-ID: <YlBUF0j8HEpRX8Hs@Air-de-Roger>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <YlAZhWVFziwoL0rb@Air-de-Roger>
 <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org>
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1643f93d-9336-4280-6e34-08da197421a5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4072:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB407218459F0478739724EFAE8FE99@BYAPR03MB4072.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uep5q3S939/N11PMDJoEKJgGIsClCuY8tKlJIA9B9cP7/XcjAzGfSH8kP4/2He8OR+Q+JYNaa1x1TvcShU3shpT4qa02WnZxrf8uYNo5xyicXUVICgn3FghYpwHGx5SqUDOd6XlPyVc1kQqa1dZAx8wvW4HycLGbGY0hMmgpJQQ/ng7aPg5jZ+9KIs3zzabba5mnH3dsjTU1N7DpwYcELalTuYeS1QuZSb6/QvAayPUysN6+XPYSkQqAjdUVpR2/6AygCZucNzor+YEAh9d2TYu01ZiVHo6/zhkhXcWIwme4VeqwY5QgPgFSbvnQYLcNleO5fGxAER0t0JhkLmu4BXIYtq9WB9nle0UnXCUN3CxoxMxM/HiD93mDjBzLnkL6a89KufhMAanOpwTyhQDaYR0re7YgdvhtvIvKW1oz+zUBnCvZeqEw8mQeJDm5y1UyqlynMVpu1LPHhxdfUKtNQiU72vdfIfkehBE5AxES0+QabqVAAD93ZkbWmVCBU6OPAk5Az2nWchKLtbFoZKCe8M2d9qWM1pjiuOt9YO0F5kbUNBEVYwzxy2MspcEV77uS2PoQc2o1SB++fgoJuPDIoS7evRrgKWhMRmSSYGpEb/5XUrqfUqGpcYE2Prv24MRYaxBCOuvY1ilS/ISPRpVOQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(6486002)(508600001)(6916009)(54906003)(5660300002)(83380400001)(66556008)(66476007)(38100700002)(85182001)(2906002)(66946007)(8676002)(4326008)(86362001)(316002)(26005)(33716001)(53546011)(186003)(9686003)(6666004)(8936002)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVGSi9GU2taRjQ5SUVXeUlrdkJ1Q1lNQWUxekhsbktaZWE2UjdqTHNnaFZ3?=
 =?utf-8?B?MEREZ2NpWHZoSlZqcVB6bnRNRVBnZjBKQWp2KzVlalpWc0c4Q3ZCK0JuWDNp?=
 =?utf-8?B?bnIwR1c2ckhvV01wQ2RMSk9UTWc0MFhvUVQ0dmk5MTM2Rys2VkR3ZjZ0Y24z?=
 =?utf-8?B?VENZZHRtdC8vYzN6WEJOdVMrK1lURXRxV2RkaWpycWs1TW9Cc1R0Vno1b3ZE?=
 =?utf-8?B?K1RXcjd2Sk10VzFwN3ByS1lLSXVoYm1PMEhQT1I1Z3M5N0k1SDRyRDE4VWhG?=
 =?utf-8?B?aG1WT01zcE8wN3dZaXVnSFhkLzlic205dUtGUVFzNCswMjdyWWhiVUZNWGVq?=
 =?utf-8?B?djc1aU1pVE93TE5sMXZka01QVXEraGFhb0VQMGhLRVpqeVRmc3BKZUdvcXIw?=
 =?utf-8?B?ZG8zM0xBNTJGOThUZjZoRHRaOTdOSmFVNDZTMCtQOGY5L3FVS1hLZWxDTWFQ?=
 =?utf-8?B?bzNEMytVdDR3bC9hTDhTWWkvcEZJd0hGcDFndlMxNjJBUEVPN3RWSSt6WDlX?=
 =?utf-8?B?WFlnYmpGd0FvcERZRVQwaEEreWFicndoRnFNWWdmREhJdSt4SU8zUTlXRjhC?=
 =?utf-8?B?THBQMEVHTE9MZXJTcGRWUDc0QkN5ckcwV0RmZGNURUhoTXhUYjZFN055UGRH?=
 =?utf-8?B?MllaU09vS0oxSjh2QUh0cEEzTW52UHRaZ1Nxc3l5dmpaVEZZK04xUjFZUGEr?=
 =?utf-8?B?UTg5eFNTZ1lGWlhEaStQSVlVdXJMRVNvUnBvdzl1LzNWQTd2SElBQm1CYkRj?=
 =?utf-8?B?czNYVDh3QkV0VFVDSGxDQk9vQjBvc3JtM1VRdmZjT0hiYmpYRTZSTVI3Um1G?=
 =?utf-8?B?YWNaV21UYlZFMm53TkdwK0I0ODliM1lqVUNzOHIzb0UrY1pONlBpTER6c005?=
 =?utf-8?B?Q1FQSUt6QStrQ09TWmVQTk9yeE1oZ2lMSmVKbzAyR0hmYnBHY2JQZjRmZWZ5?=
 =?utf-8?B?d1FTOWpVYkFQUkpqNURCOTF0UFNJMm5IVkRUY0dwc1F5M1QrQWlrc1lUcXNZ?=
 =?utf-8?B?ZFZTN3FkdWd0S3BJOUVsVi96VkxTdUNuMU1MOEpIYVczSW54SG9NTzFBelY2?=
 =?utf-8?B?QkQ2eW5sMmZ5QjlUYmJaZGFiNEZTRjlxazJ5TEVScVZXRnBqOEtoOStaeHFu?=
 =?utf-8?B?WXRobEJlNTNoaXZEWjM1VzZEdGVOaFFSdTZkc1V5MW1XV21ZUzZsaWQydUg1?=
 =?utf-8?B?Vkx1UEM1dkd2M2t3RjVmUVEvVVQzZEJVUVBjSHMzMkpmZVJtL25Wcmo1aEhh?=
 =?utf-8?B?WlFTSExUQ0U5NER0dFYveitmTlpOL3RpajVpaWcwcUorWWtTaGNSS2F0Q0wz?=
 =?utf-8?B?SW9aY3M1VlB3NUFsNTFONDlEdG5Td3BRRG9Ydm5sSVh6V0xSRnNMUU5PK3ZU?=
 =?utf-8?B?TEVHd2lYRTJaWFJKaVdiVWpNRHd1VTJBTENjQStHVHZqSklPMmV4TUtLMkpn?=
 =?utf-8?B?OFNHNzBsUDZJTkR3TnRqRlFZRzhkZmE3aGJNZUdURVJTc3ZGOFlHZUlna3Nu?=
 =?utf-8?B?UlBQVTJleFcvTTJnNnVnaGd3MDhFSzJwRitoaElUQkNlQTh2Tjg3c0xTVFBF?=
 =?utf-8?B?dGFPbWJmV3oxTWhMWldkbnZYZXdaZkkva2dNZDRPUGtNcFFBTFhiYk9qSGti?=
 =?utf-8?B?Q2hjZHVodTJCSG9DelBvSkxYbFArYzAxYkg5bXdERHozTVdETGw3VWRON1R0?=
 =?utf-8?B?MVZQc1NuZlg5eE9VOTZMQ29NcVVRMFNONldmNWJ0ODBhWDBibm54VkVsUldV?=
 =?utf-8?B?YktZeFc4Z1R0TzRWTGdWTkt0TUUxTEV1eWplTld1MFFBQU5MNzVXQTMzb1RK?=
 =?utf-8?B?dUpFcFluQkdDaEN6eTRsdDlHQ0czU3d5cGowTVE5bFZaZUdESXZYc2xSS3hs?=
 =?utf-8?B?MjlYSTZicDJ6YXA1T01XOWdNdUcvQW5YR0VLVWpLd1dzNFh2V3dPR0NXeTBK?=
 =?utf-8?B?ei9lRmtYYUpBN3NveHB2UG1McDNPSzk1NXR0ZHpabFlHVlgwQkFnRVJkbW54?=
 =?utf-8?B?MkkzQllaK21EOEFrNFVoNFRCaHdaeW5tZnBOQ0lPcDJERzZycWpVYU9FcnNV?=
 =?utf-8?B?SFFwQUZJekM3NWtMclp5QjlKLzA1ZnM1cW9FSE9BZXZ0bGhZenNzTXV5d0Yv?=
 =?utf-8?B?ekZQN2ZnS1M4QjBnYWpIeWVpVUpKSkRXeThwbytTTjd1Z0lCV0FhblhXV0xz?=
 =?utf-8?B?S3I2SWltb2xNWHBVTFdLbHoyemxLSml6UURvY2pkZkVCQ3c1dHFEK1U3dkI1?=
 =?utf-8?B?akZmV2YwL0dGUm53TWRtU29XMHBlNU5YWGh0K3UrMlIvKzlBMVp3NEZKQ0oz?=
 =?utf-8?B?N1NyejJpTGlGV3VTQlBGRFpoWlFVUlRISitqUTR0L2Q1em9OTENsYkxRbWdU?=
 =?utf-8?Q?9mp/EYJWp62SthBE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1643f93d-9336-4280-6e34-08da197421a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:26:19.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aJFgj9Pza5McsH/SR6shCxSBY+on1pIidZHPNF8A/8Kx+k+n4T4hN1/9fjy3kUW+YyrJnd4cj0VpuPAUyENmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4072
X-OriginatorOrg: citrix.com

On Fri, Apr 08, 2022 at 12:24:27PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 08/04/2022 12:16, Roger Pau Monné wrote:
> > On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 08/04/2022 12:01, Roger Pau Monné wrote:
> > > > > > I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
> > > > > > uses 16 for example.
> > > > > 
> > > > > I'm afraid a fixed number won't do, the more that iirc there are
> > > > > systems with just a few cores in the pool (and you don't want to
> > > > > over-commit by default).
> > > > 
> > > > But this won't over commit, it would just assign dom0 16 vCPUs at
> > > > most, if the system has less than 16 vCPUs that's what would be
> > > > assigned to dom0.
> > > 
> > > AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will get
> > > that number even if there are 8 pCPUs.
> > > 
> > > In fact, the documentation of dom0_max_vcpus suggests that the numbers of
> > > vCPUs can be more than the number of pCPUs.
> > 
> > It was my understanding that you could only achieve that by using the
> > min-max nomenclature, so in order to force 16 vCPUs always you would
> > have to use:
> > 
> > dom0_max_vcpus=16-16
> > 
> > Otherwise the usage of '_max_' in the option name is pointless, and it
> > should instead be dom0_vcpus.
> > 
> > Anyway, I could use:
> > 
> > dom0_max_vcpus=1-16
> > 
> > Which is unambiguous and should get us 1 vCPU at least, or 16vCPUs at
> > most.
> 
> Unfortunately, Arm doesn't support the min-max nomenclature.

Hm, can we update the command line document then?

There's no mention that the min-max nomenclature is only available to
x86. I assume it's not possible to share the logic here so that both
Arm and x86 parse the option in the same way?

> > 
> > But given Jans suggestion we might want to go for something more
> > complex?
> 
> I think we already have some knowledge about each HW (i.e. grub vs uboot) in
> Osstest. So I think it would be fine to extend the knowledge and add the
> number of CPUs.

We don't need to store this information anywhere I think. Since we
first install plain Debian and then install Xen we can always fetch
the number of physical CPUs when running plain Linux and use that to
calculate the amount to give to dom0?

Jan suggested using ceil(sqrt(nr_cpus)).

Thanks, Roger.

