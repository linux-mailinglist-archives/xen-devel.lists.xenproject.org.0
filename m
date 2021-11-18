Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AA455791
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227220.392926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndGE-0000Zc-0f; Thu, 18 Nov 2021 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227220.392926; Thu, 18 Nov 2021 08:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndGD-0000XS-Tj; Thu, 18 Nov 2021 08:59:13 +0000
Received: by outflank-mailman (input) for mailman id 227220;
 Thu, 18 Nov 2021 08:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45Id=QF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mndGC-0000XM-BB
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:59:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad55156-484d-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 09:59:10 +0100 (CET)
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
X-Inumbo-ID: cad55156-484d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637225950;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=82QRVKSiGkrj/VwbO2eXYfxHzf6wpsPUGqTOg1nVNBE=;
  b=Ljz09726nUrjvGM1MeTj0QzEabCt7aEi7nO/A7gjE3wlCfh03wf6BGUT
   A7HymvVyncXN/Aa6ck8La7mLCnvO7GTumxHOIbUOIlYkWRykHsHrCo7YQ
   oR0PoPkZAP735vxsB4bbFbLt4eJoi7vx+ttMGUbPyWO8JHiKq7vjm/isp
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a8aZSed7UGJLtP8HRYEwH8c1G7ozkHw72h+m6stEpoQQ769xMNFt5Ouc/0/Yfx782UJNdhFQBc
 PdwkfO4z6MTPD67Ps7xUpukaPy3tS8wiwXjtcUfUgSv32dhEs9fT26fRc/1SmiZSpY93qKeBFN
 hpc3Ue7I0Tw0hq8YH8F5xSvMNW1pt0oEf+nnfKTTbhAculiQ0EYEDn4ZLxdqI5KQtxUJghDlCQ
 SFLwWIJLiGkG+0BHjchQPEW0nbt0UIhIt85E8+h9HmfE77IHxDJ+kQFxoC9YMNW2485lc6HW3h
 gFThVxQ2nW1MQ37Y3O7mnMRc
X-SBRS: 5.1
X-MesageID: 60091056
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:1LUNaKxPtP5AcJqgftdKKrPxveskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurAYccegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LS0XsGIP41qn2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr6G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTohOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsIuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DofuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjHkV1FUsZ6Rt0kIb1K7qhBogL3Q79EWpgE286Ig/r1dop9an6hNDKWt5I
 z/Q+1Vff91P4krhJlGdZU8qP2MexrwqCL3QRGvyGvcZdQ60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.87,244,1631592000"; 
   d="scan'208";a="60091056"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oScisQC5ZJs5Baw/zUcSSEdC9TsN2eEgTfdgtzy3HKJbvCvQa8zvihM9K8cqGRPgbayE5VW4lW8j21VPBMGZFPRIJ1U0/P9LoBhbX+c/+8JxFrmHl3R6P9j7hMp2sAdnUtRMVHADrNdIvoys6nmhLknONFxDgZtqtSDzuN2m0HAF/Zx8huUYU6g+yPhoDk0I9M50CQG5dfbB/q+d2+ETlS/SRpiIpve3sJRzXJ+UfY1M26F5VoMPDqO8kKOh/xvnUpa9gvkASr8kqeHyyq/la9jeWtUiG76KljwTarBIJH1sgXQ/zuiV4TZWbMxb5N4w/VStLlta8LpAZa1uVyGZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEX1xw0cZdmzj/VGFU5T0ar5GeQz/UjN34d6/Thshvw=;
 b=Wt6PB+4aAjXh0GPHrPo0hzD1HvfRnvO/xp5OiBV3mJTENbRgFKfi5ppIbeZF+7YxNB9CofXKcH3a4CAQ6YpbHOItYvRWLuFnGMZjLQUMN39IWqhFiXYeFcYlT4eqN3v0QQCl1i13YCNtNASaOvkYZjYcNzTTQNNYR7Y38KmLE5MD2XQepPtOkmu+uvkhZqiFSCOxwzbHH0vMs8Yzh/Ip9y4uh9PeFtPUCduOAJlfx+jG4TVvnnaMol7Yi/DnwHSBLSKooC4sNM9CJE7MOD8OoT5ZDi2jfmNzw1DzhL1liPNiUOdoyYgvI7AvH1elmV/DsoeYk7kYQvtXFxI6Y3X2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEX1xw0cZdmzj/VGFU5T0ar5GeQz/UjN34d6/Thshvw=;
 b=bOB4O4Li+zDWtT+OIHE6bw/wnQcNbbtI21EjdjGBq7uRwYURW0QNO1RlNsG7p9x8+DrNLvikgEGtIVgL9gQhGgIGEu5TdoR20ziZZXXSarA4QPquGKuEEUi14Br+DJtdp5wNk+CU8wYcN/tYhnwcGTQmIl+ylypl2lL0I9EdkT4=
Date: Thu, 18 Nov 2021 09:58:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, Paul
 Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, Stewart
 Hildebrand <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZYVzkaQTQ6+Rn72@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
X-ClientProxiedBy: MR2P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b33bb45a-46dc-4bd3-5f43-08d9aa71a913
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB337174DC555D4F99F6C5B2C78F9B9@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yvkjwq+TTe0mb4ft6F0kLcrmdMQzbp+HHV+HNF5FPm1m7apLf6bSRs7zSBjVNMBO4aaw+181IDchLXEZkrK4CEkaoOenOUTy0XGVEQ51OQHZiNYyWIUKKvln4bsk0dtGxKG7W1GV5i9oPGJuH412GUOd4xz16QpGvUC4T5vpe+8t+WH7oatIiZhvYJ01HMxHMpGBQkI8mEcI3UXX6JbXkURJlz7/55/f3c8kwWSxIlUjAJyzu+xwBDnA3TETNiIUrD+Oh1bPpRWtq7AZtUCHe6e18jWws5OcjfHVlaLT7RHlYY0gQgi1DVSb+serfe9StaY8jp8WrNpGaSoL4bCfK4H3U7xCLglGQqfZI4qAUX3we+A7fw6uIC7nvg0m1sXxgmlqJ4Na/IN/T+eQIGueI37srKZfnz5utYogF6tD69IeRGolRP8TkPuqjvpNYr19WVt+fGvVnC3bSlMpXioF1QI+il/osArTSTR99OUWqIljRR5HajcaUdBmbx7ogz3I2Meuv+z5Fs45R0DgHq0OajWHsvHADKVdGKSaaamLxk42148QGGSlCVj/QFp77pyB6srCSJrVyDTynJd7Jt5MHCh8A5CldPfGirzFWPQI1YRQ4sPTFsfisys/L7AAc0F6/Y6AYQjKQFa/GY4nKTLnAXJ9xLEQaLUL/CASJ5fZX3SjWyqNoydIHEyLmkkW40nT/J0gJZrA59TP8wmLukuhiN2oplgpMBl7YS0OQfUW8Ok22QQlYvI3k/W77ehwLkuHHOEcURQJyE2n7JX4W3A5E3Z4n3NjrPw2R8CH0KLiofp8DD70vw9M9IGDAlJBVBbg2b+LHAvUKATU03IE2MIRYvbn9ID7kcpSK0osQjXp7B8pW+hIaHg1BGDIAG9XpVL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(316002)(6496006)(7416002)(7406005)(4326008)(956004)(54906003)(83380400001)(9686003)(6666004)(33716001)(5660300002)(85182001)(8936002)(2906002)(66556008)(26005)(38100700002)(508600001)(66946007)(66476007)(53546011)(186003)(6486002)(82960400001)(86362001)(8676002)(59356011)(219803003)(207903002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3lxeVBTSU5vWGc1NE5mY0FoYzJiV3d2a0QyeTNTS1BnaDI4UllSMmZOaGpZ?=
 =?utf-8?B?S3lTYlhpSFN3NzFXTUo1RVoxZXdhWTVZSWlhaDVyMmRZVkMrVEtSeUVNa2E4?=
 =?utf-8?B?aHVnVWMvbWQ2R2UyeDlWMk0zQ0dIQXNGRlU0RzFERVhUdy96UTk2WW1rQ1VS?=
 =?utf-8?B?RnJ2b0l4bktPL09jamNqK2RtNFpnTnZLSGg4V3l4T25ZenRUOWZIL2g4R2Zk?=
 =?utf-8?B?VmtVVFZCZ2FrL1dOemZvUUpIcGZTcFZzNVIvTTV6cXBVSExlYk4xSEUreCtF?=
 =?utf-8?B?blFMQXVsOFRTMWxVQWZyY2kvRlErMWpHK3gzclpycXA4SzVOWVJDZkU5L05B?=
 =?utf-8?B?YitXMDlHYW1zSHZQQkllUjlYR0xPTHRzV3g2dmNYOEVZYThQUFNNaDI3RGdX?=
 =?utf-8?B?cjdtaWlkOXlYT3l6UnlNTGhseDRLYXBXTGd3MS9BZnpvSjZ1VjF4SzhaSkZG?=
 =?utf-8?B?RGdXRXVJK3JuMFVqa2NJU3ZFdEFndlB1M2ZRSUVZOXJPbmhWNHlRaUJmZXpi?=
 =?utf-8?B?RHdmeGh3TXhHQWJtdE1ScWVWNkRlRE9BWmtRd05QQ2JVdi93Rlk0MVAwNWlk?=
 =?utf-8?B?OVJiY2hxMVpGMWp2bnZNMUQ3QVljeUNsWWdNa1RDNC9mTXg0M05kZ2VKZUt6?=
 =?utf-8?B?a3ZpbEdGaXlQS1NQK3VtMHg5bzU1ZlJHNUxpZXN1VFpYN2Vqa2tnN2VRYUZk?=
 =?utf-8?B?UnpwekxBQXZuNHBRK0NibTJmaUFFd1RSOTlTSXhqS3ZGVHpPY1pSSitPenk0?=
 =?utf-8?B?Z3VIZy9JTHk5ZHhWTmplY1lEWXJTSFlwUnNpSTc5MXQrU0Rmc0VSK2ZhamZw?=
 =?utf-8?B?VHUwRG5aYXBiVm5CVk82cDNERFo1M3IxYzNCTGFFd2xKRlEzeDdTQVYvdm4x?=
 =?utf-8?B?SWE2OGlkSFdsV3NmSW80R2pTTExjZ05pY2lPTkZjL2VSY0N0Mkl5OFFtQVlX?=
 =?utf-8?B?VGQybUxLOXpVRUhQYlp2TXAzT21Oblc1L1VmZ3dSUkNkenV4WVJ6cW1FRis0?=
 =?utf-8?B?c3M3NWJ0Zk9tNHcrOWFETFpwL1lUeVB1NU5SSWM3d0dYVTh0WW1aSmt2L1ZI?=
 =?utf-8?B?RDdoQndRVDhnN0dYZWJOKzJsL0dGR2xuOTB5NzFUS09aMjM0SDFLODg2VERT?=
 =?utf-8?B?NDBKdTdRUTFZUzJITkZVMGN1VWplQ0s3Y294NFkyRDhpTVYzbVBsYmNXTFRU?=
 =?utf-8?B?YWEweTNqWmRLOHBPdGR6OUtXN21SV0htUEJtNVJzWGVna1lFN1o5bTFxam5F?=
 =?utf-8?B?SVc0OExBYVhPRDBCeTdGSHNaSWxaRi9VS29OWFE5cG1BaGcwamJaMWpWUzVD?=
 =?utf-8?B?Z0lYTzZmR25wclhjN3Q1SElZOUpEUFhhNk8raUQ5aU52MW9MOFhlMTVtT1lt?=
 =?utf-8?B?ZUdoVmtNRHdCN3lPWktlS1d5YUtiaWZQUlR0T1FsYXVNMTZ4VVhqMzhUT3pY?=
 =?utf-8?B?RjN2b3A1N2k4SmM0Um9RSE45UFp2WndFcmlxS3V3bmVwaUJEei9FYTVSczdS?=
 =?utf-8?B?L2NSbGZKS0xsSkMxRHRjR3ZlMVcydEI3cFZ0QkowSnQyZklxTHZwNEJzTEEz?=
 =?utf-8?B?WUgwbkEweFcveVJDSUhtUG85aUtaNnJvQVJJQzhGdFVzcHJMSHVIY0N4S2VI?=
 =?utf-8?B?SFFBOXlNajJrOGZSRXhWY0NOREN3OG04ejBHek55VW82cWJlOXVYdkRFVEJ3?=
 =?utf-8?B?L2JwRW9mNlp0T0E4YUZaZmVieENqRHhkYUJYQ1J6NmdNTlVNR2lHME9wcVZt?=
 =?utf-8?B?THNDV3Jnd21vTjFoMFFudG9VVCtLUFZkazFIRUFSK05TQzF5NkM4dUR4QUxZ?=
 =?utf-8?B?K216STF0SlFqZmdnUXptZ2Raai9zZG1QakFaNXN6bXRKUmVJRm9YNnNPeTJa?=
 =?utf-8?B?VWIwS2Z1SWxYUUZKM2FKeHB5Ly8vZFpsYUYzSHJ5NzhBamFkcFphUVFCZmdN?=
 =?utf-8?B?RGZ1OWRpdE5tWkJDdjdwc0JvTjBZQnBqTVA5VUl3ejBJWUlLeFNhV0h0TlhD?=
 =?utf-8?B?K29rSGpnN0YxWmxWUFR1RXNkTzVCYWlXOEFFRm1mK1loN3ZKUWtpS25NaGhF?=
 =?utf-8?B?R2E5MlV5M2k5dlVGZXJrS0hyR1F3Y1k4eVhnV2JlYlpXMlBQSHFaWStZZmJI?=
 =?utf-8?B?OUpFWVBZeU9KU3YrTjBRU0hJakZHYTgyRDlBQ0Zua2MwclFGWWhYRUpPZTdX?=
 =?utf-8?Q?GBY8mdcQ09r02Wjc+L4WB4s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b33bb45a-46dc-4bd3-5f43-08d9aa71a913
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:58:59.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqnM0qXVevGISfGdU9Aaas5o9unen6yHZnnQntPLpMalnyTBxs4BJum1EEy0Ju7YENot4v8yoc4oMm13Abu9Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Wed, Nov 17, 2021 at 02:07:50PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 17 Nov 2021, at 09:53, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > Document some of the relevant changes during the 4.16 release cycle,
> > likely more entries are missing.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > CHANGELOG.md | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index ad1a8c2bc2..8b0bdd9cf0 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >  - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> >    no longer be built per default. In order to be able to use those, configure needs to
> >    be called with "--enable-qemu-traditional" as parameter.
> > + - Fixes for credit2 scheduler stability in corner case conditions.
> > + - Ongoing improvements in the hypervisor build system.
> > + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> > + - 32bit PV guests only supported in shim mode.
> > + - Improved PVH dom0 debug key handling.
> > + - Fix booting on some Intel systems without a PIT (i8254).
> 
> Missing:
> - cpu ID sanitization on arm64
> - fix 32/64bit vreg emulation on arm64

Can I get a bit more information about those items? Just a pointer to
the commit messages would be helpful so that I can try to write a more
comprehensive entry (or maybe it's just me not knowing anything about
Arm that fails to understand it).

> > +
> > +### Added
> > + - 32bit Arm builds to the automated tests.
> > + - New x86 pagetable APIs.
> > + - Arm vPMU support.
> 
> Missing:
> - static allocation for dom0less on arm64
> - dom0less EFI support on arm64

Those I can indeed understand :).

Thanks, Roger.

