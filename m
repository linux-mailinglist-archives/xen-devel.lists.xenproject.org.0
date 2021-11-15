Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C8450448
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225844.390100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaw2-0003br-JJ; Mon, 15 Nov 2021 12:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225844.390100; Mon, 15 Nov 2021 12:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaw2-0003a3-Fq; Mon, 15 Nov 2021 12:18:06 +0000
Received: by outflank-mailman (input) for mailman id 225844;
 Mon, 15 Nov 2021 12:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmaw0-0003Jk-IK
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:18:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e2f775-460e-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:18:03 +0100 (CET)
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
X-Inumbo-ID: 13e2f775-460e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lZSLzPotCUBY3Vnx1J2++/vMQm77kTSn9w3qEXwV5wk=;
  b=EpPyw74oI+mgP4/cp6T/hxTcjYsOf8RiRWGzLljhsdLomUfXxroZRUAQ
   uebozGweDlbEWU1UDx1IJOw3493H6T0j0EgUBBmi5F9MJy2H+WPGJk3SC
   qXQhfXEb2tudVmYJgyKgsGNuCVuAAVtvAnybxryx4S2VngjE8uweOP6iq
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QbXkihC61si4/Kl5s8QhtcoAC/pxRcPd1rJw9iSPPsZRPZbTLT6bWE5nz6eKRw3JHmvoT19DFI
 NGQnERbxtW3tPWYN0OZkvrF8w06qBLPneh9s5oHOlL/FUEbvM7ztkiqMDuQuiHdsdz+12MegUM
 RydlWB6p5qnaArWyKYTiEDN5whSGu1HfszUXboRRAl6fQIGs0g5o97e8BfRhrjgtwpG5BA5KIR
 9bJJCd0M9SAbaQ8H05x5jQ/TPL7HgtcLOVf1wh+JJ3cjk6EvKmTy0nv4ljV+oOOHTUNONVS8eb
 43loXXxWunzWjLt8fJcd6lJ/
X-SBRS: 5.1
X-MesageID: 58216521
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZbBERKpQ/h6qxQmEEAbHcwiE5OFeBmJ1YxIvgKrLsJaIsI4StFCzt
 garIBnXMqqJYzD1ed1+aYS28UwPuZ7UyYdhHQU/+3s2HyJD8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2IHkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZOiEFszJPbFoekMSwhpDS1AZf0f5JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0eR6+AO
 pBAAdZpRBXgey13HggIM4IdsbqSrXnjKDBZq03A8MLb5ECMlVcsgdABKuH9dtWUSO1Pk02fp
 2aA+H72ajkYO8aY0iGt6W+3i6nEmiaTcLwVELq05/t7mmq5z2YYCAAVfVajqPz/gUm7M/peN
 E486icotbI19kGgUp/6RRLQiHSJpAIGUtxcVegz8hiQy7H86hycQGMDS1Zpd9gOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HhqowuihPETv54DbW4yNbyHFnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfDhTBMx5wjRdnKo6EV+foHNWmCzwQGFt7Aadt/fFwTf+
 ihf8ySD0AwQJZ6fzXCXWr4EJby4/+e0LjHi2Q42A7B0olxB5EWfVYxX5Th/ImJgPcAFZSLlb
 SfvhO9B2HNAFCD0NPEqOupdH+xvlPG9Toq9Cpg4e/IXOsApHDJr6h2CcqJ5M4rFtEE32Z8yN
 p6AGSpHJSZLUP83pNZaqgp07FPK+szc7T6LLXwY507+uVZ7WJJyYe1aWGZilshjsMu5TPz9q
 r6zzfeixRRFS/HZaSLK64MVJl1iBSFlXs6n8pAJK7LdflYO9IQd5xn5m+lJl2tNxfs9qws11
 ivlBh8wJKTX2BUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd3H0UvrTLNuJeNP3LU6lZZcF
 qBZE+3dUqUnYmmWoFw1MMiixLGOgTz23GpiyQL+O2NhF3OhLiSUkuLZkvzHqHNTU3Hp7JRm+
 NVNFGrzGPI+euirN+6PANqHxFKtp3kN3uV0WkrDON5If0vwtoNtLkTMYjUfeKng8D3PmWmX0
 Ri4GxAdqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6AUnu1ZtAK6V
 1ih4N5fPbnVasrpHERIfFgub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4adp3z
 /0gtcga7x2EpiAratvW3DpJ82msL2AbV/l1vJ8tH4K22BEgzUtPYMKAB3auso2PcdhFLmIjP
 iSQ2PjZn71Zy0fPLygzGHzK0bYPjJgCokkXnloLJlDPkdvZnP4nmhZW9G1vHAhSyxxG1cN1O
 3RqaBIpdfnfoW8wiZgRRX2oFiFAGAadqx74xFY+nWHES1WlCz7WJ2onNOfRpE0U/gqwpNSAE
 G10HIo9bQvXQQ==
IronPort-HdrOrdr: A9a23:myNMnarls/ItToLAXxr9/5saV5u3L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHPlOkPYs1NaZLXXbUQ6TTb2KgrGSugEIdxeOk9K1kJ
 0QCZSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaFp2Ihz0JezpzeXcGIjWua6BJcK
 Z1saF81kSdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L5259T5cRzp/ktHNRA7dc6MLmK41P2MGbx2RqpUC/a/YE8SjnwQs3Mkf8IDN/DQu1+8HJ1ou
 WZbG9l
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="58216521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuFMl7v1hjy4JgWw4X7OP7QEmNw7+FmBeKSOvBWMBsg9H3dh9cMYpxqcht6al44q8bUU2KSsZXImGJOPimlDEGNwvY8fO8is23ROQmiBvD4q0ldSBcS0CTZ1onCod7/v/Z9XaoHA5FJ2IHh0giFTLXYBupmgxw4oqYSCux7qZpLbdXr76LtjS+4V0LBLDs8O4K9ztyYjgjp26zWKWc+/+/bi1kF9dVLcJNhNWit9Yo1JkABMgSXBrww70mPsCEFb8/5vGIZuG3KJ9Eq2zhVmnqVSMbin7lDnMt10kSvdZDXSVTiMXHf1xgCBer16RzjVrhGDGcoAJFk/1LxOXswcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7YKl3TZjUGOEVn92cpS9NgBaIkzP5wzuawrDSqqVDk=;
 b=C4f+1dBGO/n3j7UyhTt9Sze3sccsoJYBM+4ySPhdsmwsT17dirdghXEiwFLLdQ7h6jVYAOhFO+nC+oxIICls1PcXeM/iJIOnoKv+LR1updWTK8Jgn4EGvGPPMpsuEviW/2kqFDy+dC/rjxx4BxS2qEO2w/Svr0g6evwhKJb8u8QEL7kJ2MzZSeDYuyhf22XP/d5OWPLVggFhnE19Ap2A27r7aUEgpD4p/Gm7PoluIX/VnbEwb5MtLQh8O+7Zb9ae71Cjl0gOZw/6FGuoKOZ6UPYGzH8eltL6NHaduhyXxUv6m3+WKWW72SCIRhi62kV99YD/JbgUIcWwRMOLH5qNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7YKl3TZjUGOEVn92cpS9NgBaIkzP5wzuawrDSqqVDk=;
 b=s4J61Fofp+3IqnhZd7PX+psT8bBH5L0z6PUH+2kZTpmFC8bkEDa/1MpebyIyhHN+NrfgGhep5zJc10QQzo+AZLbP6t0DJ3WUfufX2nRPyS02mgjHnFZb4fDglS1RlWPvG3PspoyeVvtm8S97rfkk9U9Q3S2hLaLWAEphG8yxu68=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	"Christian Lindig" <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.16 1/4] domctl: introduce a macro to set the grant table max version
Date: Mon, 15 Nov 2021 13:17:38 +0100
Message-ID: <20211115121741.3719-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115121741.3719-1-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b17be015-9b22-4988-3b92-08d9a831f5d3
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3483979105CFBED3C0F365498F989@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itAV2DJOM4rTlXTNQrKItAfNUmQmWIq+tUIPsO4A3vOJbERCKxnaj0s49xbdOq2JXg8x9nWE1PVQSrCmwB7VlNg2eneBadqwmtu5h5lUNbgHyTCFFTTeHEDBJNMgNWSa+9AFO598S5q4RLs+9C6HP9jhyHEmPdh5hk2T8VmZusLbX/IPzQBS9XShH3U30Vc4m04Q60souH9JzXgpHtPnadwzOwJDdskzUzq+/BY/VeZTfK8nnyscGqio9/SKOhLz97GVkAidtqXlw91kSG8cgCvTByA+QxFiGKALZKwUfX5k5n9xXQCe/b9zDDBHKn3kv9LJGXnhA8HioKSKBb/4rHWKRF/ZIVkBG2Fs4y5EOjcaJVvx7/v5X8P0FjuAe6mlmOJ/NxjrKwj7vCYtNT7i/vrEROD2iq2lPGCGo5wJVTuVEzrb+Fd8KtVqVU7mgztqBHI2JvAjitGveHoum1mCPRzJ08fYMAv5r8e2UzXAcLj3qWpc9uJbN9VJMnMDcbvSf9X8G67p+fiLfkDYDQQrguhkGkYDucLYdiP0XPYLtzujBusnfnDtotYLpWvvSmTuZVKbqcYoEAPi+RSCtirJcCGngDPvExjhM2MquOGUQ73EZ0CAiAfwaj4U6lBWgxz2jYM2vgnWdKjl0HF3KHINPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(7416002)(82960400001)(86362001)(38100700002)(66946007)(66556008)(66476007)(186003)(2906002)(508600001)(5660300002)(6666004)(4326008)(6486002)(8936002)(36756003)(83380400001)(2616005)(956004)(54906003)(6916009)(6496006)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3NSV3ZJZWhoMTBIZXFYeCtMUWVOMEVaUXo1Mk9xTXorMXR1VGhTNmNiQXhu?=
 =?utf-8?B?Q1lDVThFbFU0bWNPVEFaaTZncGdzMjNDNlA0WFkwSTVQZVdCKzRkY05OaTZT?=
 =?utf-8?B?OXErWUl0UFZyemwzT2JRUGRKZ0VPUmhpQzFlQTJNUm81UFF6eXVIUFZ3aG5u?=
 =?utf-8?B?dXU1cmFoWUNRQXBubmlhMERDV0VISUVtOTNkT1oxSTVQdS82M2ZZb2ZrMHB3?=
 =?utf-8?B?R1R4Q1c2YkoyZVh0cHZvczFUc2pVd0RIK1E1dXQ5RWh1a2xSZ1lPUnYwbVRr?=
 =?utf-8?B?TVd5TE40SlN0M3lzckljZGxHbzhuTHQ3V1V6ZkxDL2IyWVlWT0xESFlYZ2dS?=
 =?utf-8?B?SUZOcDExR3RuU01hMzlONUJ4c05pMFJkOXI4WWFQUTRSSGJuM0VwRkZFaGgz?=
 =?utf-8?B?VmhqcHFjMDJxRkp6cUR3dlNldmRDUlVsbWZYYkdEenNNOFRZUTdXbVlBOWNZ?=
 =?utf-8?B?ZWp2VEF0QVdyT2JZY1l2cHNjZlF0cUptUnRQTVBmbXRVNDB1UEtDSGJXRXkr?=
 =?utf-8?B?S25wMTlHRGxsWWtCd25ZSUIvcU5pU3EyVVVDd293aG5EdTgvd0g3S1Jway9t?=
 =?utf-8?B?bzQ3a0tSSTRpUS8rTkdwaDhKOXo1b2kyMWFRQlpFZ0oxOHM2VE5RUVRrWHN1?=
 =?utf-8?B?SHk2dmFIOHgxTnRyTEE1TmZDVE1HYVBtSnlmS3lKTnk5TGtFTEFZUHBuanNR?=
 =?utf-8?B?V01ja0RoVDRTMzRGbUkydk8yY3VTNDFrRlRUZExSMWVCU3phdFBqTEg3N2pC?=
 =?utf-8?B?RFFkY2JLbU5Qbi81L0YxRFdCc2hnNmg1ZHJxM3RPUmRsRlowa1JkbGZEVHhw?=
 =?utf-8?B?cUFLdUdtSG8xdkQ3YjRuSzdLQXZ2Q2YvZE1QSktOV2oremxFTENCZkRkTnRF?=
 =?utf-8?B?L2R6UU9QOVJIRm5CN0NlODJ2Ui9PZzMyUElqUlBxS2Q1bGxpUjA2d2wyQlVL?=
 =?utf-8?B?Q25xUnduRVhHaG9ZUmpoeVJvcm5TOGZESUdqNEhPZVdWc1lCSXFpYWh5T2hL?=
 =?utf-8?B?U2t1amgxTFo5VW82RHpyUWdLRnkwZWJoeGQzUVdTWC9RUlpybVhxcXBNaGJH?=
 =?utf-8?B?UDBZaXZLd09jQktrQS8veWxEQXdHWlcrazRGVUI1KzV3Vkh2ODJETjEycjQ4?=
 =?utf-8?B?K1RBaHBrSDMvQmc5SHZnNEVXbjEydmRNNGkwcVdhd2E5RWRyRmJSRWswdjE4?=
 =?utf-8?B?N1ByNkl1U2JZZjZpQVovenpyTnZKUmNGYkpjMTBvNWNGSXJmU1QxSC9vV2Rn?=
 =?utf-8?B?d2tHV0lnTDVoQVZCUkNHUFN2alZsd2k2eDF3U29vOUdad0grMEd5ekE0cEQ0?=
 =?utf-8?B?UVdXN1g0dTJKZkJsNTBldm0rTXIwWDFRTTdyMWF0ZlRESlg1UG1XZnc0aTVJ?=
 =?utf-8?B?eU8vUWtGVXNzRytxemU3bFpRNjE1cHkvd1kyendER1l5ZlloNy9PK3k2YzE2?=
 =?utf-8?B?SS9ia3RIaFM5c0lGTVhDVWZkMmFZaVBHTGIzV0dOZGpnUlVGVjRzK2tMR0ZQ?=
 =?utf-8?B?MnlKQmJKSWg0S2pzWk92Q3VZaCtTUU8reGpvMDVTNStHNExhbzl4SmhvMG5X?=
 =?utf-8?B?UE5wSVQwcEZWR0JYNC9vZjEvbU5mTXBCc0hwRnVTY1JXdUhLZGV1SEFkUWw0?=
 =?utf-8?B?U3JUZWR1eGdkNlZXWGVMbEFzWWJWbDZxOEdXTkRmZzZsZGNub3VKRlpOVWw3?=
 =?utf-8?B?dzhuNGJ6RGlXNiswYU03S05rUDVrTTNjWWVlOTFEQms5TW5reElqQ0xkbGZ3?=
 =?utf-8?B?dTFNaldqdnNKdXpjNU9wOVhwd1owNXA4UTZnOC84VmkvMUR4M21xejNZZ2tZ?=
 =?utf-8?B?QmZ5b0djcmdhVnRQWVZDYy9LVytiM3hSTEp1c0tHQ2ExclNvZ0NFQk1yQ2RY?=
 =?utf-8?B?Y2tvY1JCYWJWWmNnN0JYdUdQY1MxdEpDZTd3S0QvajBEd0tGQlBzcUk0Sy9E?=
 =?utf-8?B?eEJTalNydk96bHFJTGVwVWdvNnJLck54UjdEbTAzMWptOVFwbTNFaGM2SnhJ?=
 =?utf-8?B?T0d3WGhxNU81eEVaL082dFMwQnNOVGpvcS81MmJsWjJJQ3RqNmxSb0V4S0Rn?=
 =?utf-8?B?WlVnMTZwczd2UW1rSWJDS3RGVWJSVDF0RHQ3Ui9sQjZJVlZPUVlJSGd2SEFx?=
 =?utf-8?B?MUVPNzcxdkJJSVN6UXJqNGxQQnJYWVhMUXZCclRCajYxTW1mWW5GNmtINElL?=
 =?utf-8?Q?bBdEDhXVQVk/z+pYDWAr5Nc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b17be015-9b22-4988-3b92-08d9a831f5d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:17:58.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWMTkHdRfZ88vKGwLKnGksur7d+fJmpRffMh5kzkxPR/UuB3/1iCgTI2VJvi91mNntyBOS4zSCVcTjgmnszUmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Such macro just clamps the passed version to fit in the designated
bits of the domctl field. The main purpose is to make it clearer in
the code when max grant version is being set in the grant_opts field.

Existing users that where setting the version in the grant_opts field
are switched to use the macro.

No functional change intended.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Given it's a non functional change (or at least that's the intention)
it shouldn't have any impact on the release, it's just syntactic
sugar.
---
 tools/helpers/init-xenstore-domain.c | 2 +-
 tools/libs/light/libxl_create.c      | 2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 3 ++-
 xen/arch/arm/domain_build.c          | 4 ++--
 xen/arch/x86/setup.c                 | 2 +-
 xen/include/public/domctl.h          | 1 +
 6 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 60469161bd..b205a79ee6 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -89,7 +89,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
-        .grant_opts = 1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(1),
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index b6855c7b46..dcd09d32ba 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -629,7 +629,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
-            .grant_opts = b_info->max_grant_version,
+            .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index eca0b8b334..5b4fe72c8d 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -199,7 +199,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
-		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION),
+		.grant_opts =
+		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 19487c79da..d02bacbcd1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2986,7 +2986,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
-            .grant_opts = opt_gnttab_max_version,
+            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -3094,7 +3094,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
-        .grant_opts = opt_gnttab_max_version,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ec6e686fac..da47cdea14 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -755,7 +755,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
-        .grant_opts = opt_gnttab_max_version,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1c21d4dc75..b85e6170b0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -99,6 +99,7 @@ struct xen_domctl_createdomain {
 
 /* Grant version, use low 4 bits. */
 #define XEN_DOMCTL_GRANT_version_mask    0xf
+#define XEN_DOMCTL_GRANT_version(v)      ((v) & XEN_DOMCTL_GRANT_version_mask)
 
     uint32_t grant_opts;
 
-- 
2.33.0


