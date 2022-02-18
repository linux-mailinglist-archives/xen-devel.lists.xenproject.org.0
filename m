Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668244BB920
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275355.471190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2MS-0002nn-BN; Fri, 18 Feb 2022 12:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275355.471190; Fri, 18 Feb 2022 12:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2MS-0002ks-7O; Fri, 18 Feb 2022 12:27:44 +0000
Received: by outflank-mailman (input) for mailman id 275355;
 Fri, 18 Feb 2022 12:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL2MQ-0002km-M6
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:27:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 289d4a5c-90b6-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:27:39 +0100 (CET)
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
X-Inumbo-ID: 289d4a5c-90b6-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645187261;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gvlXktozY19bj+HWyVzUQFBQt2NrqF7Sqh3nlu3qVnk=;
  b=AvhN37Fu2hBFTkByHjrCSJbiwfQJpuSODY5IqGaJIkZfhvhiC1o1xMnF
   blOvyYo+NYycQ0NM4WcCcRgBXFxWTUoAVRl4G3ZbWPhIuLpfga9AOP4Te
   P2KqKCoZX45n+Z54NDZCOqKTwVgEokwclEr9s3gsSTsgsEQeApo0vBCnS
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64511627
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NWezu6qs/+XCbcyOOhMD7oT3Sc5eBmLXZRIvgKrLsJaIsI4StFCzt
 garIBmPPaqKNjemLd9+OtyzpB8B6JeHyoNiGlBt/CBnFCga8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 IOq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBN7XjgeYWbRxkQwZdMalG6af4M2immJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZZEMGMxNkuojxtnGA8tJ5MjjcqSoDr2QgdUjkvKjJYU/D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S30iGZ+3ihguvOmyLTW48IErC8sPlwjzW72Wg7GBAQE1yhrpGRg0u1Cox3M
 FYf9GwooLRa3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZQIdzMDhq782skLobdpnEL+tsc/lABill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hc5
 CBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeBYB3iUsI2aBj
 KrvVeV5vc470JyCN/IfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZwzPhlZ
 c/KLZj1Vx727JiLKhLvFo/xNpdxm0gDKZ77H8inn3xLL5LFDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg5Nuu0BM4n9ShT0O5FFQ/A5kXPqL2Htc83X5A2YaMm5Kpky/t1R
 OMCYMKOHrJETTGvxtjXRcCVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:MTtx5aCMHED/44rlHeg0sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64511627"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flBIRRrgU63h71mYCQHVuEtJKarwNiNGlQvdjsXjfJeEYCMDfou3KYL6mLWwaND4g5SpywMqeN4V7gzmfClNq4TYUbKW1mQYlPBjrvsWNwj0RDbK97Fx9m766aDW3G9Hk2EMAt0TmfhXfT/kaoyq3v5ZKAbK5rENy96OeRYhwrs6qc99eYKyACDXuPo7oL7x2uuVd134JJxDHJQs/Hxy19Q0JXZpdYFXeX0PNI/ZIGIQ5nQHp5v9xdgb43YBD9HbIAyam9P/ImqQigR3KR+uVxmkV++5iuyGIsR0m9ITBIJzGJ9noINqoEUv330mOKVyUhnPcTAJKVSRNcgaPcBv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gi1zub+GpucqWxCwkIGN7iC7DQk9TUFldlfyPdd1aw=;
 b=MY/ksQ9/44JfUoKJCMkYOQR9hN5sQpozkborEIvotZbkn+rBbsMrZ1HXfFjgPt1V6CmXQ1vtGULbj/LCTzOYwBymzYz6wrWX3grwl3M2BCnYW+lBr+P7rVWn+5yKsZAddzogzDAT/5M3xZhOegfeYIW/t6YcZsFS5jHeW1zdlDPx59+HonjSXiEcWJkWGEusGvWuRS7MlUfPClErydOKZcD2cQHQ40AdDYL6N+1xSocc2j1Xv7NkXZUaHjGtwlmJs7MdqnLeOlqUYAXjDYlp9aKng8FEbbOnLnfwhEMES0OVs94/lB5HSs/UXxZKpEibKoz4hsAUZdYPo27jUylx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gi1zub+GpucqWxCwkIGN7iC7DQk9TUFldlfyPdd1aw=;
 b=OKcL/nPC0VIV35SF18sD4G9JE5u2w0hl09KVCTF9RBT7HcZHVYAQFRGK3QzWAbjCLfHYPhcX24Zg6xszCtTpabapsfaTEvFZRubDwggpawYXyD5Pk0UaQm2Pk3/faEheAsNwFFowgNrtSJyBQfSfNbln6eN0gxXQjXbuqi+iab4=
Date: Fri, 18 Feb 2022 13:27:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] github: add workflow to run Coverity scans
Message-ID: <Yg+Qr3+nnTMv7eVN@Air-de-Roger>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
 <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
X-ClientProxiedBy: MR1P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15f39b02-09fb-43bc-d10d-08d9f2da0a44
X-MS-TrafficTypeDiagnostic: BN7PR03MB4450:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4450B2F1A340301452E657978F379@BN7PR03MB4450.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBc0oyygHsNq5t7LEoowfg7rU+mwuVf3bdRonKu3VTTBjf6dZIc9eKwwBfgLDQSQaC0A20SV48rByt3T75Wb26bRch0ynqnNrYWKXEG9DyYW2ctRCnRK0Pte9BDLpTEbyxDaAHWTX+lAFjNtyHjwL+mBmRTleB3KOdVRqDDIBH3emPtVm3dj13UqG6igoPPCuCA9eXLL70K4RHQWfW72urZQVAY7mk7paJncJyCBjRZZ96VO+awfC/HzHrj1GFSGN1WbnjNe8dRhZMr93qFFvUEENxI7MCwaK9rKs7Ym+pf7Bmclq+eP/Ma4+hMTbmfn32hMoa5By2CHMMvsqNZGeITsEWA0shjt8dLalai8PD4yhxk8foERCk0pB4BprIsgYrKdU+TSvFYc6KiFQ6a6KCPlz+bhVgWCmXbqnOFMBwTK5lmXM8TJ9GRErdvMU/tquwwqXs1br85E1BhAJfnpvX2Ka/0MORcjISNf2y7S4U//7x0UxA3fB+jykwn3lS0XLruCXh2ii0sD22alwPg8Jabf8VThc7m+nUMxlIojcw/dm1ED2eg/jZ7w/13ug+oJFdaO3Px0iWgA9mbvywGjqxnRJl+H4L7QRcLNzORiYshU1IafWBgh+UEw3qRYua7UIk46pPgMpkBl4DDQMili7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(33716001)(186003)(38100700002)(2906002)(83380400001)(66946007)(6666004)(6512007)(9686003)(82960400001)(85182001)(6486002)(6506007)(66556008)(508600001)(8936002)(5660300002)(6916009)(53546011)(316002)(4326008)(8676002)(54906003)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1BZK3YySGdCNGtVdWgrMEo3amV1VFNFclpmdWllakJTSGkxQzZsQUtyRnBO?=
 =?utf-8?B?RzRWb24rNzFXaFFNRGFYdlVyVXVoMUxJTm4vQ2szSWVHMlRXM0xlUlpEVHJt?=
 =?utf-8?B?WWV0M0YvRFJueUNDc2lSVVEwcWRvY0JzdS9VQUhDa0w3R29qSjVBN1ZkLzAx?=
 =?utf-8?B?MkFyc0VyS0o3Z1NUU04wZ1ZXWE1TMFNkTFE0SG92VVdmM1pWNHl6UDIwUVA0?=
 =?utf-8?B?eHYrMGJzRHZqeUtleGVtSk11NzdKMitDeHZsSVB3VDlUaTFxZm9GV2lWTkMr?=
 =?utf-8?B?eTlmZ0l0b21BYnpBR0hZMHlrTnRiOFA5SFU2Vjl2T3c2NFF1RkhsVitvMFl2?=
 =?utf-8?B?YkxsWEcvY3AwTDI2MGdnK2luRHRWQUdPbFQwVUJYYnZyMzE2K3VtVXRXbEV6?=
 =?utf-8?B?dUZ1TldQVzYzS2hzcVpiTWRRK2o4NUdHcVpzb3UwYTlxQlhTbUs3T2Y4emNo?=
 =?utf-8?B?elg1dXRFTzhGYytQSVNJZGc3c0l4dmpYU0ZBV04zenlpY1JYNElKYXczbUp4?=
 =?utf-8?B?Yk8vYTBaeG1jZkIvL3N1cHlsTUtFZGs0TS9qK0ZaYUdBQ1FxbGpvUE9PeWJD?=
 =?utf-8?B?TWU1empvTFpEc3NIclRObzExMEJxcVg3OEEzOCtPa0dOTkN6b3NaaTFlQzRw?=
 =?utf-8?B?SFpaZjhBVEJ0M0Vib2lFZVJoYlRrTWNUNEIzL01xYXpMOGQycmR2alJPYTYx?=
 =?utf-8?B?Wk5xOTFhTWN3N2ZLNVoxVXNpSXJ0UVk0Y3V6MkN3L0E5TS9LbzAvenMzOGFz?=
 =?utf-8?B?aEk0ZE5NaFRxSnA1SldPS0VyNTViY1o3eVhiNUhnNWxLSjhCM2JIb2NRWEdC?=
 =?utf-8?B?YkpHK01RYkQ0bklaUi9yK0xUY1hBYzVNZ3pDRXo5ejMzSzR1TjlPSXdFdTlO?=
 =?utf-8?B?THZyLy81Z1FmVHNtUnNzVWFhOE5walFaWnJ3UlFTc2Y1TTUxVmc2NnRoWFdq?=
 =?utf-8?B?YmcwRWdxcDBOSmFrcTdsbU8zQWNjZWZFL1k4SEtUaUU4WGwrbUJ5K21aaExW?=
 =?utf-8?B?RnpzalpxN3VZU1EvRDN3TVRGVWo0dHkySi9CdTRySjk5MjFYNGo5V0tpbTRj?=
 =?utf-8?B?UmhQTnR3WHExMnpGL2FRRk5VMk5CQkdYY2VzTjV0REIzcFdidlVkVEJLUmNw?=
 =?utf-8?B?R1drZXRwOEk0QWtHeVdOcTBJTWlsOE9QL3I5Ui95dHRKQXhHNFRLVGtvVmVE?=
 =?utf-8?B?d1B4TUpJR1VjYllTSzBjeW0zMXVwNFdzMldLaVNkOXRBOGkyZ1krWmJpdmZU?=
 =?utf-8?B?OWx6S2VNdWQzb1NRY0l5VFNreWpIRDVlM3U3bDU5a2N0bEZVUnEwTW9GeElH?=
 =?utf-8?B?emdzNTJkNU5zTlJKQXZxWWx1Z1Z3SVJUVGk1QVcvRXA4Wm82Ni94Z2NjQkRs?=
 =?utf-8?B?cDNMUVhDTTgvQTdhRC95K3NJQURMNTJJN1c5NkdnVDZyOXp5RzRyYytVU2xR?=
 =?utf-8?B?UGNuMStVMFZ4MzNoYmVHWHFoU2NESXQ2aUd6SGp3dUZvK0t1dENZR2NiN3p6?=
 =?utf-8?B?dzhDNmZ4Ri9YdnhWb0JuVjRJWUxIOE9PVTM1akk0WURCUnh3clV4RkMvSHU5?=
 =?utf-8?B?UG11Zzh0OU9ZTVNBWU5WbndtcmZVaXV0SmQ1Q1A5aGtJVVllZjhDaGhxOUVa?=
 =?utf-8?B?MEd0VWxJZEh6NDN3OTE3b2QzWk9Wa3dQV29MNlZOd1l2RTZUeFA3U2FYYzZH?=
 =?utf-8?B?eUU4ZjcrbysvYnN1bnZFT25heXpuYlRtUEpFSHZqWGtxTjcyOXRUUWxJVW1O?=
 =?utf-8?B?TmdjS0U3YVJZUUJ2NS9SVlgrUFhpT0R5OHBTYlR1YXRzYXZ5OWRLZTRMSlow?=
 =?utf-8?B?RmttMHFCRHJWMXh0MXU4Nm9UeTA0Y0E0RjRBSU5sRm5WQllPY0pnaWQ0aHY2?=
 =?utf-8?B?YyswZ2N6RTlOMnNzT1MzS0c3dVN0UnBqUHBHL2V1NWdab0xUOU9yNmFVNSsv?=
 =?utf-8?B?TllLZGtVMTlheHFsdm96Vnh4a21lNk00clFSQmtmT0Nuekc2Rkxwb0V5dmFE?=
 =?utf-8?B?Tit6UEJIUmpCSTZEVDkxc0RYR1V0NFNkNExOamJVWUFWZlFkWURva0hCWEpE?=
 =?utf-8?B?WWFBajBleTVZMysxQ1JWRnJXVmtzZDRxbWtoajN5NW1MV1NyWjRUUnplYm1D?=
 =?utf-8?B?MENma2x4REkxZmo0M2dhczJwd2p0dkQ2ZnNSRHNnQzdvNmtTSm41Nkx6TWZO?=
 =?utf-8?Q?GAZ7IFGHGPb3ccfEGIgbXBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f39b02-09fb-43bc-d10d-08d9f2da0a44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 12:27:33.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgMm4S1G+pABYHp3vxXIWQ/V8jq8kjn2mcU13Mgkd8vC7G/c4U7isWfli7YSZQK1WAzJXcu2kaWUGcAN2optXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4450
X-OriginatorOrg: citrix.com

On Fri, Feb 18, 2022 at 12:21:34PM +0000, Andrew Cooper wrote:
> On 18/02/2022 12:00, Roger Pau Monne wrote:
> > Add a workflow that performs a build like it's done by osstest
> > Coverity flight and uploads the result to Coverity for analysis. The
> > build process is exactly the same as the one currently used in
> > osstest, and it's also run at the same time (bi-weekly).
> >
> > This has one big benefit over using osstest: we no longer have to care
> > about keeping the Coverity tools up to date in osstest.
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 .github/workflows/coverity.yml
> >
> > diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> > new file mode 100644
> > index 0000000000..12fc9c782b
> > --- /dev/null
> > +++ b/.github/workflows/coverity.yml
> > @@ -0,0 +1,35 @@
> > +name: Coverity Scan
> > +
> > +# We only want to test official release code, not every pull request.
> > +on:
> > +  schedule:
> > +    - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
> > +
> > +jobs:
> > +  coverity:
> > +    runs-on: ubuntu-latest
> > +    steps:
> > +    - name: Install build dependencies
> > +      run: |
> > +        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
> > +          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
> > +          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
> > +          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
> > +          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
> > +          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
> > +          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
> > +          libtool libfuse-dev liblzma-dev ninja-build \
> > +          kpartx python3-dev python3-pip golang python-dev libsystemd-dev
> 
> We dropped gettext as a dependency a few releases ago, and we don't need
> python3-pip either.  Can fix on commit.
> 
> > +    - uses: actions/checkout@v2
> 
> I think we want
> 
> - uses: actions/checkout@v2
>   with:
>     ref: staging

I've assumed we wanted master as that at least functional per the
testing done in osstest. But maybe it's indeed better to use staging
in order to catch issues before they reach master.

I'm fine with this.

Thanks, Roger.

