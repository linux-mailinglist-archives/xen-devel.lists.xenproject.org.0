Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAC4DC082
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 08:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291410.494557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUkwE-000539-Qc; Thu, 17 Mar 2022 07:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291410.494557; Thu, 17 Mar 2022 07:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUkwE-00050K-Na; Thu, 17 Mar 2022 07:52:50 +0000
Received: by outflank-mailman (input) for mailman id 291410;
 Thu, 17 Mar 2022 07:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUkwC-00050E-Ps
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 07:52:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a8bef0e-a5c7-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 08:52:46 +0100 (CET)
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
X-Inumbo-ID: 3a8bef0e-a5c7-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647503566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A8ONnt8AcPoeAjNOD87dCRq3tkO8EVRp2arPjCAlSY4=;
  b=OtRs1hplnhdEjlVvtLWr2+hnQ6Uo/1LU62Fpqtu8YyF5NNf74sizTUJq
   CVgwRhUr34NZ70OFAi6g/7zPWhut9MToPXykGGurQuT7/GVhGK9Yfz4cg
   JlHTup/3m2H864WFNpW2Pbb0RFnMKSIAoRD7zaDqN58K0Pv6I6VWIJsOS
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66483578
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TmQjbKyt2WFKTxwORSR6t+fixirEfRIJ4+MujC+fZmUNrF6WrkUGx
 2tKUW3XPfrbMTPyLoggaNjg8x9QuJTdmtNhSQE6/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IfhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplraa1bBx4L7X3nvVAWj98LDEjL4xK5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4STa2DO
 JpxhTxHYEjsegdEAXksCpsErcyMg1/vTDcHpwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+UFqwofC9zEmkSd9bA
 0UO/2wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZRM/5vz48ZArtRTeE99FNJGl08/UFS6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkjfC+F0e5eIFcFh
 XM/XysLuPe/21PwMcdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhRzzfxgY
 M3FKZnxZZr/NUiB5GDqLwv6+eV3rh3SOEuJHcyrp/hZ+ef2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9Qis6Oe21Ason8y5T0O5FFQ/A5kXPqL2Htc83X5A2YaMm5Kpky/t1R
 OMCYMKOHrJETTGvxtjXRcCVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:qRIOKKCP7OPkjYflHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66483578"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHB50wz0/yrtQkajHsEUi4uM1jqPrtdqLR0gVtwIGgLrFrixvlB7vw3w9TwGTv5XY+grB/VuYnZ8bg+nNAnfEiYgu7il5o5d8Sc35SM9WHDimVAnXPUgrAFUSFrKkUNyxW46Ks4ccRCP1CCRJeyHKiKxQ8FWUUXX1hRlCp9i+sjIUilpCpovMSDqK7B65DaEbej+kicK+6k1dDP/P491jU0nKbCTmowU5iib+C4QscHnMTfbKra198dzxN12cCjEyTAdygFLXO7RKb8QPkNLH7onAM8O4kOErXZtnIjBkAbVUw2CFMsrHxiTzsQw2JKtP4+MH5P52mT2jaNEz64csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoyyrdDumEhsF7RjQ9qbWjxO0DhwMSSye0BgW8p7cNk=;
 b=gzyKLMLOxb8BcfGl0lFUlTYAYWIZy+qwc8htmxxg721eaFlEZ2f1EXfPV6GVkJ0ddacRLB4ATIt90Zsym7oWcZdKTwMwdpFRlGGW2HKAiZ8XwJQsy81AiX4blitEJAwo7aTytSkRrU9UlbQ9NJ97W321bsuWfNfFFPguPSKlUtXt1m39M1RyVNSTkmbkOX110UjJms/Ska8ZPKgqSZeGMpVGVWmyIDgWBNVY9KfaXOwLJItCdee9MVBYxMPdtbsb0LJXKBr7fGxvDDFznbqMda0zKdAGef4Xi8YzOv/Zsj8682B2yQGgroKmpu/QxU/AhB3GqVhfx6l8biCLB4KALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoyyrdDumEhsF7RjQ9qbWjxO0DhwMSSye0BgW8p7cNk=;
 b=oYKquuSC+iQaMmqcy85orfEDgflZyd0hnSbozGBkz+jFX80Tjjkf2+qOCsW89a7ofUqdR8tYelJHsR+JHOK+vfEC9d1NXlnycVzTo8B1H3LBcdwp6LWZAlrb6oQzE2NQJ3m+rdvH3mGKTru9qh6IRS3UkN48yAbhVPRzmBfzbNk=
Date: Thu, 17 Mar 2022 08:52:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] kconfig: detect LD implementation
Message-ID: <YjLovq90OMScqBNL@Air-de-Roger>
References: <20220314105535.13518-1-roger.pau@citrix.com>
 <14a1e221-7a55-42f5-6eb5-03b64e20e337@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a1e221-7a55-42f5-6eb5-03b64e20e337@arm.com>
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e279f8fa-3b2d-4bfe-ba76-08da07eb1938
X-MS-TrafficTypeDiagnostic: BL1PR03MB5959:EE_
X-Microsoft-Antispam-PRVS: <BL1PR03MB595969F1C756E41AB473242F8F129@BL1PR03MB5959.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukWND7kPfdaxOQmNIge2Lw+GFHgx839StxFy207cODJJUOZnXpU+YcYAvKXyakSrmbWJfov7Hi5R/ffjLvM+O4Q5h5aPJKv3gufWp3z/Ku5BSA2JBgj5cGMzj/y5FvH+xp4srcukf0nPi1YHU/hYY4muwtKD3KD5mbLVe4CryTVM2u96aEGlH6fP5lq5zvFDso3aWaBXxzuNfBM5Ht33gZPxUkmOgZQQqTGubWGYBdMD3bpRAwRhKT7TPgij4/IKng8A1uPzLDfj3OuvSPlUoWc4pDlK5eMMhJrlstd2L2XoAnShckZU+UguSr9WQovs7i5G8GmkyvtcTzXgPbV7qYlcuvAYBDJLaljxwmnGHkjVNsdfRlixNsChAVsnwM2QG9Qg9QcZFpWFSGLTwK8GmHGrMTEUCC3Pgo0HlDQhKI2nV/m/AWZxxXTV8kuWUatX8E01lsPden66JbzQxQgto/9Q5cLOY5ybLTpFAu3jZ/Ctm5Za3jx8UGsM5QOoD9boOVqRrGDXUBci8r9VwfQ/2VFmIXZL25OMeXFH/b8sHA146RZAzbjw1MO35tPGzv3FR4ZA7hMeoeRQf0fTqLlyd/9KfsWgOuyv28THqQQN/dGwRRz4cXi4M4SuvCWU/1cX+6/rTv4arpTlv8zs8TgzgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(54906003)(86362001)(2906002)(83380400001)(508600001)(6486002)(38100700002)(5660300002)(316002)(85182001)(33716001)(6666004)(6506007)(6512007)(9686003)(53546011)(66946007)(8676002)(4326008)(66476007)(66556008)(26005)(186003)(8936002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1l3NFQzSkxaNUk0UXgrMjV2Rk9Tc2UzMGN5ekdlZEhXMU9tWGtnTDhiYjU5?=
 =?utf-8?B?empFNXJ0REFBaG1IM29mS2FsZmxVM2FLOUhzcnc5eHFkbDhUQVhpQ0NrTHM3?=
 =?utf-8?B?L0VUNzFUZlhla0ptRVRIZ2U0aExneXd0REJFQjBIaHZ5L3VCVlBVYXlTanNz?=
 =?utf-8?B?dmI3TEozaWN6QVdkS3hkc3Nvek1nL3B3OHI1Qmg4SzZhNW1WR2V1dHRCUVEy?=
 =?utf-8?B?U05jdUNxYlZTNDhNNURZSkxBd3RsMHJXMUN6L0s5OEFuSnYxS1ExdXgxa1hX?=
 =?utf-8?B?NTBqcVZsN0t2ZWRJajZqL3A4VEZwSHdnbGlLOVJtTUIxZGR1WFk1SWtDelNo?=
 =?utf-8?B?bnRKdUM4MzVldWE4S0xGV3Jwc1ZrbkhSQkt0bGZheC80RzYxNzVTWlUvN1Rh?=
 =?utf-8?B?N214dVF1cWtJV1FmeUhXRXdzSWdGN2lGTHFVN3V4OUhiZDdrUlBPelR6b0R0?=
 =?utf-8?B?UkpyNUtnTzBDa0JKb3V6N0NYZ2RYT2wrK3pQL2RKQUxZOEU3dXNETnp2MHZG?=
 =?utf-8?B?TFdwV3oydmtSdU95aVZ0YTcrbTQ0RjRScmVYeVZXZU5QQ2QvbTlVT2VGWEoz?=
 =?utf-8?B?SHdIWlVFWlJrck5LdzVFbm5ub1NqRGtHa2toOTI4OVl3ZE1zTHdndHowVDd4?=
 =?utf-8?B?NEhNWkVJdW41eDhPTk9aYld3Q3JPN3pOUk9sWElNN0RSbzF0RXNYNm9ZbEtM?=
 =?utf-8?B?NlZjSnVCSHV2R3lGTnA0VVVmRmJXYUlQQmVERWRnNEFrdzN0d2h6RkZ4azU0?=
 =?utf-8?B?bVZBR0VyQTh0V0xycmt4NHpQWkV1RFJFOWJ5WDRDL0svQVhvMTJ2UUVUbTVW?=
 =?utf-8?B?WlJDOGJpSnltdjB0ZE80RjNJdHFtYWgxN3lTRHQ2enNqYjB2dFFVSU1SY0RX?=
 =?utf-8?B?REdsR0tJZWt3MmRFN3hmRzg2NXBhenFnbFBRVXdaS2x1Tjg4Mnp1ZU9qWGNQ?=
 =?utf-8?B?U3crWVhsTkk0aTduM0hVbFUvWUc1MTQ1MkN6TjF3TGtFQjdZd1FQODZoR05r?=
 =?utf-8?B?NGVCc2xTREN3VXZlZ2lXQVpyc213UXhPTU02ZjBiMUpwMVZzY0ZpWVR6ZGVU?=
 =?utf-8?B?czFDUjhjZVZVZUlzSDBsTlpDMHRlZ3BZaXowdW1SL2tRUlBHQXo1ckxuSkp0?=
 =?utf-8?B?UVBHT0Qwc1NybitQektjdmU5T1VyYUtJWU53QkhKTGxWRk5VbjVkdnFMazIr?=
 =?utf-8?B?NFdSZkR2Z0k1eXVFaTNHdlpzL001d3Q3TlEvYmtaTzF2dFVOUFlFbUw0dGMv?=
 =?utf-8?B?TTV2TWo4Z1hDSjJ2QmpUVlVrbFVKWDk4cmhnKzFIMXpyMndCTkFFODRkTVdQ?=
 =?utf-8?B?bUFoWjZJRnljUlJ3aWpKR0JPcUVBajRwaGh3NzBJSHd0ZDNjanFHVXNYSFg2?=
 =?utf-8?B?M3ZMSnhTbUR0Wi9aZXgrWE9tUlpvRG9BOE5wTUJaOWE0OENuR0p6Yk1sWC9t?=
 =?utf-8?B?dTVmd3J4dmVoRVlSQlIyUmZLc2VuSERlY3NnYU9aYUhOR1V6eWp4cW9ObFRW?=
 =?utf-8?B?Y1V2TmY2eWpjWnhqeVpHS0xOalJBT3JTYUpMYTh5cUtZbURqeUUvWHAzRnFG?=
 =?utf-8?B?SUR3a2E1b2dXRExCRTZtVzdaQ1Y5TXZvdHpJT1JHK1VoV3dEdGJuZUtrbHUv?=
 =?utf-8?B?cWlCNVI4bmxyMnlvNUt5VzRHS1V0VnhUeG52LzkwUU9ZblJjOVBhenNLOVhG?=
 =?utf-8?B?VW9xNFAzSCtkT1VBd1gzUjNKMHVwcHNNZGxuNjBldXkyT3FiQU85UUszVDk4?=
 =?utf-8?B?ZXJwUHBKVkJQODM2KzdMSkxlWlJzUi9LaGtqVnQ0VzFmbHlZaXdURFNWS0gy?=
 =?utf-8?B?SEdJbDVGZXNKdm9kYmFUUzcySmhDenFQNmxUZEhWeEp1SmFJcGo3SmIySGFn?=
 =?utf-8?B?QTJMbi9LczlMSHNia1ErTzRnTzhsSGFSWXVsUUtndklkRzNSVEp6MmErUXVI?=
 =?utf-8?Q?FTVXjVgP6999Admv3FEv+HYYMC7yJNsD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e279f8fa-3b2d-4bfe-ba76-08da07eb1938
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:52:35.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIeCN/RKO6ysaSAvGW4eYHXWI4KesOpIUS1aHz3qRgL9K63w4o8E0vefMFcCN+6lzMrwk59iGePcKAqiw1pReg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5959
X-OriginatorOrg: citrix.com

On Wed, Mar 16, 2022 at 11:28:48AM +0100, Michal Orzel wrote:
> Hi Roger,
> 
> On 14.03.2022 11:55, Roger Pau Monne wrote:
> > Detect GNU and LLVM ld implementations. This is required for further
> > patches that will introduce diverging behaviour depending on the
> > linker implementation in use.
> > 
> > Note that LLVM ld returns "compatible with GNU linkers" as part of the
> > version string, so be on the safe side and use '^' to only match at
> > the start of the line in case LLVM ever decides to change the text to
> > use "compatible with GNU ld" instead.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/Kconfig | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/xen/Kconfig b/xen/Kconfig
> > index d134397a0b..e8d5e70d46 100644
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -23,6 +23,12 @@ config CLANG_VERSION
> >  	int
> >  	default $(shell,$(BASEDIR)/scripts/clang-version.sh $(CC))
> >  
> > +config LD_IS_GNU
> > +	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^GNU ld")
> > +> +config LD_IS_LLVM
> > +	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
> > +
> >  # -fvisibility=hidden reduces -fpic cost, if it's available
> >  config CC_HAS_VISIBILITY_ATTRIBUTE
> >  	def_bool $(cc-option,-fvisibility=hidden)
> 
> NIT: You do not really need to use head especiialy if grep for the beginning of a line.

I'm afraid I don't agree. We use head because we only want to match
against the first line of the output, and then we use '^' to match at
the beginning of such line. Without using head we would end up
matching at the beginning of any line present in the output.

Thanks, Roger.

