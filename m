Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EA45311D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 12:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226260.390931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwtT-0006H7-Lj; Tue, 16 Nov 2021 11:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226260.390931; Tue, 16 Nov 2021 11:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwtT-0006Df-Ho; Tue, 16 Nov 2021 11:44:55 +0000
Received: by outflank-mailman (input) for mailman id 226260;
 Tue, 16 Nov 2021 11:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDL+=QD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmwtR-0006DZ-L3
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 11:44:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9afd1cc4-46d2-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 12:44:51 +0100 (CET)
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
X-Inumbo-ID: 9afd1cc4-46d2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637063091;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nardZWGG1P1YTYe1oFA5lTIr3qmqCLubuP8w6bj5YJc=;
  b=C4YEVJ1RPM0evCmuoBWGb8QxW8RbaIN7G7ncvH0wWodH3YzKBWdGZiX7
   T5mzKYvRDM2R/BG/PkGs/bxZmKeKZ8tm8xHJoFSpd8rQPYujjMwM5vuEZ
   ghD9fXDiLObMGmbh/ZA56PCneioDunYnyse1QY1ty7p1HMIgRtVaEbb7D
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /1GN+UlrSeg74z2YhxylJ0t2h15GGq//EmMvDai57FY+Zen8AEjet9V14SkVgAGTJXXVyrR6eG
 +KK0peDGpEfcascnhdrTMKyynFsJ48JdFC+sKP3DdeTFb9vJiI8VCtZDjTTHrskacJvsGM2imc
 j+kVsWTnFwQqQ81k1q9Eu3JmWcPsfHjqNitVR0++xFAzomtI+0oTt3tMLg5RfM27EeQ5CJusxd
 L4FTwUEdyamTCefRohGszxR/GujovHuo6XbY5mkGp/jblDhnA8CfWyUufB7oezE+Z076zFFLbE
 4lkB7cN0HgicfG0kgjdCteu6
X-SBRS: 5.1
X-MesageID: 57924085
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+q5+Q6y2c2i0K93jiPp6t+fOwSrEfRIJ4+MujC+fZmUNrF6WrkVVn
 zdLDGDXPv6Ka2Wmfdt2Po6woENVv5HVzdZiHQVvqiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrdn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Vvi
 /xpp4yVdT4sPoj2p70FYzJzThgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIHjW1s3pATdRrYT
 8woaAcsZUXgWQJeEUwSV9Ewn8brpnaqJlW0r3rK/PFqsgA/1jdZ0afvGMrYfMSQQsdYlVreo
 XjJl0zhCwweHMySz3yC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobTk0l
 XatjcPMOQVqsJivdiuFxpy/8ArnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHDdKAnuNOvwjxpgDNE6qQQ3d3XG327zk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJtylfG7TIi4Bqu8gj9yjn5ZLlTvEMZGPxD44owQuBJ0zfFX1
 WmzLK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Km7VXvIgSWcHFzLrTpWJd0t3UgOiIwe12v3hAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:fk9MMKxfJFZwmThRcbObKrPxsOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOPHJXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFh0dL5iUUtKPpZ2fSKGMB2+ffvyChPnHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,239,1631592000"; 
   d="scan'208";a="57924085"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFIwFQYSFVeLczC0nymvbWcfH7zBnQ+8sGoy7i/RwfYlRvn+ANUyoMGblRfz2NPoewLCCHsupDvX3v5FHEQlWXc2vMkYpPZOzyxEf3TQg4/G8gDe3/YuPEJ61a+Iyuvb9R6SCpMm5OLsjR3ugwC+rD3k7ppo/B5c85XkHnLGLSz5dHIuyHXVJg++86knrwA4MPsX9irMuVASAmkTZ7nxQQ/Z2WPFiZNsE0S8xuUWwxCiAj1zgDMa3dbuzk4g3O8WPWPp5zjduUAIljB4RbeZHIaZ+wYy3vMZVoeLr4JKlAc8arbA3/T75Jn7+HB620sRR5Jz1KBMox7lWK/JCHXCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7SFpqRZCed6/tGh+vkUj1va6T0HaykI1rE/ny4lvvs=;
 b=Gldu34KMzeUhqeCxyQgkbOC/5TMVhhULERby1XDRge4x5ErIiSCSWY7A2NRjFwANi0X0BYQVhaqb6mKS1xyKVvsIB01UiHJ7kxcY2cqgioeCzNI4U52ItkfEFQyf2ETZqfRbhhWfz4VBdWsxaahPupoGvAYCHVnnfCZiD+G01mq9oVRnDJGeItkciAX8IuawPROcdTqhMknb//uUByhHLKC2+KCyY5x7KdJoQUksvrKNr8CH/NzG41oquQmQVbj1qW9I6hOXP4SBshBPt8Fi/nkOtQ/8nemH9mQPHo0sAUeRrj3GkMSO73DgWpXeXkL1jcpTmogKr32BIveIxEQj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7SFpqRZCed6/tGh+vkUj1va6T0HaykI1rE/ny4lvvs=;
 b=wVddSI8vxza4a3lp3NTfuDX82Rgh8lLXQMP91Ca+twNLTRt4xQdfUfbSP4WZ/46uJSEtK81t2MqJew8aDODc2Laot7JTTyq1WDErR4lRnnMhqhmQfYKfQpoQlRzwuuhRbHtbPj9KnV/7sN3Lo9UnGsIosbg52PdKHu2CmPdTqbI=
Date: Tue, 16 Nov 2021 12:44:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2.2 1/6][4.16?] x86/x2APIC: defer probe until after
 IOMMU ACPI table parsing
Message-ID: <YZOZnJXpAoEiShfw@Air-de-Roger>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
 <YZJ3y56FFerUa0gu@Air-de-Roger>
 <7c15a5af-9ada-1f99-e728-8e6af22a9b92@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c15a5af-9ada-1f99-e728-8e6af22a9b92@suse.com>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde25091-6566-428d-058f-08d9a8f6783d
X-MS-TrafficTypeDiagnostic: DM5PR03MB3145:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3145B085DFD885E6EE9A016F8F999@DM5PR03MB3145.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBK9OiLg7vrEGwBJzFbG1XqQSwSmCLOh8cLme1n1O5gj8PV5pN038UogTnBfgEboPVE01axg9qSzdNjttIah9uJJxw9C3qWuGZ9KDRIwVbBswlThUQvPAtbpubxsDY2HUMrCj12ftw+lWBrKR7MLnqKGTyP/Foytoe/41pGjZ7aZr4POmDHO+bRbXOsg5vH7Nc8SMPlekPtKimKLW5o7zwLRbpHpW2J5va8ASdsUHn4QpbhxK5SINGQtFS9G2F+Z6TIF0PlaTpQ/eUivmxgGbYOPI607FMKyHxc7EkT7V8yX20wsSYcZpZrtGojRqYsHeadAAT9nBFTKtI1P+7rrH/Q5RlkkHYDeT9qk/kgHqnGo2AdcpOlHAK8sSn25tsOYBVHzSnfHXzjaoL1wSDdP4kg+Auc81LSE3Iiwj70YDV3Zwituafk6E5MAmZQIXEP/Z6g9sfeYVdnxTtFHEGiw3hUt9UU6o+cOj701u2IK6MJLn+5tdB6js6rKvx3qab78565sme/SGQ0wlC2vFMSQtodlIWpSZwc9u5i0zp4e6oCqMSg1RwBirz1MvHb856ufap9LyAawwunNJn760vjPmcqLLoKPyzw0E5vLZi0to1zmXFyi1OUFLysPklvR3qIOtUsIZJnsLGORbM8TEAe5cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33716001)(316002)(6486002)(186003)(54906003)(83380400001)(9686003)(6496006)(6916009)(26005)(53546011)(4326008)(2906002)(5660300002)(8676002)(86362001)(82960400001)(66946007)(66556008)(66476007)(956004)(38100700002)(8936002)(85182001)(508600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1FMSHNvQWlEamx6V0lUN1QzU2hzSTkrN3VpNDNwZ1B3U1JHd2FEZjZYUm9V?=
 =?utf-8?B?SkR0N1QydnhKZTVjSEVwSkpkSExHQXR1ZFhJMDJ1eWxYNHJMSndrMjNzcEll?=
 =?utf-8?B?WFBFTWtOOVJlMWFEQmlZb2RRaytiekczY1B5cTRvZy9oUncrc0NvWVRZTnU3?=
 =?utf-8?B?bnhOdkZ4aHZlZXBxa0U2MHo5T1NzRjZXVm5MYy9IK0xlVU5MdVMzSkxGazJU?=
 =?utf-8?B?eHBkQjNYWTBLTGEvSmh6U29kSlFHbkRPZ2xjYnVuSmcxMkdvVUZTUXU3RWt6?=
 =?utf-8?B?akx1Q2ZHeW9xeTdHam5ZdExud2hLbWxzdXE5a2xWVVdNWHhpb3I4WUlnRmhv?=
 =?utf-8?B?eFo5MTFJN1BWVi95UlkrVVJnZXhxZzV0NGhTY2xTRTlKbndnMThEeXNObVZO?=
 =?utf-8?B?TmI3aGlITFdJbGhwb0t3cEVGWDhYZG1jOEdVMUxEdVFtMjloNzd3WWR2WGtV?=
 =?utf-8?B?ZjNtb3hwdGt3Z0t4RzVYZjB4a1grTEU0TVRQWlhjeTZONXRHNi9Ea01Md3dI?=
 =?utf-8?B?NjRxOXQ1VVJkWkdWMWI1UWZ5cVhsUGZtTGxSLzU1bjB1TmNMNXdGSllVVE40?=
 =?utf-8?B?QnQ4cGxOR0N1aG5yZm1LM1l4NHI1VTZFN2swcEFaSzlmV2R6a3BwRVVHbWs2?=
 =?utf-8?B?RlR2VEZ2ZlZvZG1KemMrc3A5RWIrb0NxMGthTXI3c3NGOHJyaUZ5TUcvZ3Y5?=
 =?utf-8?B?YWV1ZGV3Ky8rVS9ZQXlLV2ZQSGdZTmllMXU4WlVjWHhxUFlhR1BENFNnM1VX?=
 =?utf-8?B?UXN6aGYvMlRpUGhUYytwRlBqS0FZMlRxQ2kyZUY5bm1wbkkwcU1VbkNqZUJK?=
 =?utf-8?B?VFFYKzg5RGgyWXRjOUc0UlNSeEplSmR6YVcxOWh6bTBRVExxdExsYSt6bEI3?=
 =?utf-8?B?akd0SkRxNmIrMm1KbGd3S2dMVDVtNGVuKzQ3MFdWMVdrcDlhMVhBVFUrdmZa?=
 =?utf-8?B?b21HRm96cEszN1lBZCtCanBmdlZoT01VQmdjS1hRbXJRZng3bHFETXlGZUEv?=
 =?utf-8?B?ZWtqbGRKSTE3blEwZTNJQmRsQWxZMFhZNGNNY1BLNTZDOStYWFRoUGkzWWR1?=
 =?utf-8?B?SExqeXdvY2l2c2JDUmlGTzNLQXJocEJuaHlQanZvZlg2MVUxNjRYcEdHZmll?=
 =?utf-8?B?YWVHU1dRdVNyam9rTDE2eXVaQ25CTm90dEJPa3J2L25lWjk4S28vS2VJK1NE?=
 =?utf-8?B?TUhPeGhJZmFvSTEwMjRMZytEbUtVVnlvQWdHbGJ1S0FZejJ4ZmJ4RGtrK3B2?=
 =?utf-8?B?eXp3TjdpUEZVUEhLcTY1TU5FSW96LzZXSElMYzgrK1E2RUoxY2tFRmhOUllq?=
 =?utf-8?B?SUxoTDJ6TW1XSk16KzB6WnpSOEZ1WmQ2MzRxcFhXKzRvTUtrdk8vTzcyTHF4?=
 =?utf-8?B?WFNjQnJKalhOQlhwTUJlcWtYR2JCeUo0bk5jekJlZmtlNUdvN2F6U0YveC9n?=
 =?utf-8?B?ZU1BK0tickdBWVR6dTRYS3NwR1lDTG85S2xGV2xPcnZmT09QcThmR0VPNFBq?=
 =?utf-8?B?SmxUODJGNDV0U1JGeFJIdzFrbGQ4cy80OUhRZ21XOUREeW5Ha2ltV2dZWERM?=
 =?utf-8?B?dldEOEdpRlBSaC9yazhxMHJ5UzNwOU5oam55ZjVySWtoTnNreUlqcjlnZkpv?=
 =?utf-8?B?VnZOQlRhTlF3aXREaG5mKzEzeDFiTFR6MDdVYkMxRjNNWDRUNEhMcFdVMDB3?=
 =?utf-8?B?ZUliU2VPZ3JTK1NldU84Qitoa1Y2U0NXV0FIWkxod3FzaG03aXN4VGF2STVT?=
 =?utf-8?B?bmlxZzRMYXlhNU0xVGxoWW1xRW83ZG1WWnNWZERGUVpKV3NPSUVjbVZPMU5q?=
 =?utf-8?B?MW9iWGsvSy9aU0NpaGtJWTZaNFM4Yks4clR3NVhYYXg5UFRvak84V0VVTHRr?=
 =?utf-8?B?OUZ3dWVtdlRxM2R1bVdLcTJrWUVmZWFaSjYrUVhPQ1hISW1tVTV5cW42anJ0?=
 =?utf-8?B?SEc4eHVsTlVnd01CazJZNFA2cFlDekZzaG5odngvS25BQkliT3N3S0lYeUdM?=
 =?utf-8?B?aVVEcnpOOGQrcEgvKzFJT2x1UVB6eGlWdktva1diTnMxQnU1QnJsVGpGcVY4?=
 =?utf-8?B?MW0rU2ZXRFB3UnFqajZuVmJiemxaWVdicnJPNTM3T3RNOFJQMDlmQk4wUE1T?=
 =?utf-8?B?TUJjSWVVRHQ4S1N3QmR5aEk1NW5FWEZxdjdKMEJQQVVRRnB3Smdodng5VmJh?=
 =?utf-8?Q?/T9U3Qb2nM/4aVxJhyNV7QE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde25091-6566-428d-058f-08d9a8f6783d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:44:38.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWMe9lL+lDeYtW//Yt6ySGWbKXvidp1vJUQmH1iKBOvHI8NqH06wyW/FlOwyqHmErqCd3bgC7Qtev6SFaTGFcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3145
X-OriginatorOrg: citrix.com

On Mon, Nov 15, 2021 at 05:10:04PM +0100, Jan Beulich wrote:
> On 15.11.2021 16:07, Roger Pau Monné wrote:
> > On Mon, Nov 15, 2021 at 03:31:39PM +0100, Jan Beulich wrote:
> >> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
> >> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> >> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> >> affected: The call needs to occur after acpi_iommu_init(), such that
> >> iommu_intremap getting disabled there can be properly taken into account
> >> by apic_x2apic_probe().
> >>
> >> Note that, for the time being (further cleanup patches following),
> >> reversing the order of the calls to generic_apic_probe() and
> >> acpi_boot_init() is not an option:
> >> - acpi_process_madt() calls clustered_apic_check() and hence relies on
> >>   genapic to have got filled before,
> >> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
> >>   occur after generic_apic_probe(),
> >> - acpi_parse_madt() (called from acpi_process_madt()) calls
> >>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1700,15 +1700,30 @@ void __init noreturn __start_xen(unsigne
> >>  
> >>      dmi_scan_machine();
> >>  
> >> -    generic_apic_probe();
> >> -
> >>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
> >>                                    RANGESETF_prettyprint_hex);
> >>  
> >>      xsm_multiboot_init(module_map, mbi);
> >>  
> >> +    /*
> >> +     * IOMMU-related ACPI table parsing may require some of the system domains
> >> +     * to be usable.
> > 
> > I would be a bit more specific and likely add "...to be usable in
> > order to hide IOMMU PCI devices.".
> 
> Hmm, not sure. I did specifically leave out the "why" part, as dom_io
> might also become required for something. If you nevertheless think
> I should extend the comment, then I'd insist on using "e.g." just
> like I did in the comment next to the call to generic_apic_probe().

My request was mostly to make it clear where dom_io is used, it's IMO
not trivial to spot that pci_ro_device requires the dom_io to be
setup. I'm fine if you want to use 'e.g.', or if you think this is not
helpful.

Thanks, Roger.

