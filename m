Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A524C655A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280234.478093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nObwL-0000H0-Fd; Mon, 28 Feb 2022 09:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280234.478093; Mon, 28 Feb 2022 09:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nObwL-0000E1-CQ; Mon, 28 Feb 2022 09:03:33 +0000
Received: by outflank-mailman (input) for mailman id 280234;
 Mon, 28 Feb 2022 09:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nObwJ-0000Dv-0r
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:03:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a0bb162-9875-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 10:03:28 +0100 (CET)
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
X-Inumbo-ID: 4a0bb162-9875-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646039008;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FJj3r47xArD1XAmvMNa0En/0jxTJ4E5PWTFfRSXmNZo=;
  b=C68Um+TQh59HRx413FwjvFkCgvlTkc7qu+lOS4GOdNcYTNmif6hEI/2+
   xjIPVTM+Qg7JwO6CFcG4uoKjOY0fdQpyliVJciO5YUL192H1Y6q1T0WpF
   oXtpfG0jy9jder/07VeDooss8vY1K4pcH/2+BAvV0rPLY74m+MTZtBkmP
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65114389
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xztei6jnnAdOwvU0ghVePxmiX161rhAKZh0ujC45NGQN5FlHY01je
 htvCGrUafncZGb2etByYd+0/BwHvpGEndVnSQs5pXwwFCMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWVnS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR0KJPDjmM4yaQdnTi9MGu5t3ZDWKlHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDP
 pNFMmo+BPjGSyEeNlRUVJhmp92Hn1j7fRNBrXbO9ZNitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqEKX7nweDlsRT1TTifC8gR/gc8lFI
 EJS/CcyxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcebhFYzNnJj7stsU/BfPEgO4uan9bcTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxEwHZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGwkTKuKGpxdEdMMX
 KM1kVkMjHO0FCH3BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzBV9wf5mY
 MvFKZbE4ZMm5UJPlmfeqwA1i+JD+8zD7TmLGcCTI+qPi9Jym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid54043bQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiMSgyOOuyBs8k9RrW/0UEZD6V5pTqWq72hI83fJorZ7g3sutlyP9/V
 f4efMucRP9IT1z6F/41NPERcKQKmMyXuD+z
IronPort-HdrOrdr: A9a23:AYvbd6jFfjwKg+NbA6m8t9bna3BQXtUji2hC6mlwRA09TyX+rb
 HIoB17726RtN91YhodcL+7VpVoLUm8yXcW2/hzAV7SZniChILAFugLgbcK7AeOJ8SUzJ8+6U
 4PSchD4JWZNzJHZYyT2mSFL+o=
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65114389"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly4IGcUEoOlXuUEOwcEIAVfeQjD0KiaEva0JNr/6IKuCJVNRfKeLJY9IrBH3/xjs4dOTo+C3ENjgAnIvJPcg2NYfVRh6ZE0vDdi5eX0HtMuJQqjMM8mMYvbaDQwaCxysNvb7pWtmic/tFwAqfJo3ZNc2ppW6LVw2D2ARZm54c3Hzy5vnHkStEs8FnrJygCao11JXkCecn2MEVhjzNOwQvXTL1pFj/qD4fHtOpnPhH3gpTd0eYYzy7WkO5PsBZ+rhIvWiV4pFycQNXW4Kw08l08pxMM8K4hXAuaJADn0F67m/rdnqNEY4bWIZGISHqP3RyqCR52onZrM04u3cMPuAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koSxmFAygem3Us67bDFcZ9/VKysWrbqwLtRmZ/bbOOY=;
 b=G2DEjAWZMYAWOYVdATut2nLwKUafh1pfoF0veAGTAvUTfi2ksOlKu4AzOz33obDoMmqi+tRBwF0CzgZoZ+zDnf2Dm1DJPSgUTdGXoGLpEJMDyds8HFIQxKOQK+VaDmCmnGo3cuePnO+2eBkgj03tvHQGrFQsr32BtBSIeCo/UCiAqSAJcgMJjMVui2nn+aiK5su9JIytnqcZzvCJOvnwt1BE0q3wLrlz9IAVq5q4svN7GCEc1JG1fU9jjXfzMKpzzHahQ8/Ol6GWXsfGrvnmzUxJh6BI30gjQR7h+Y/WomlrDqStFxQqFPIpeqJEqwaO7vmmil8a43BXXNNwy/lCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koSxmFAygem3Us67bDFcZ9/VKysWrbqwLtRmZ/bbOOY=;
 b=XrcQckX90NblnvjUGurTQ2YUJXxD+4GbsFPFuxb4kMcqutSg9NwtdkktzV56my2d7cNHXCWVZ7syRmTB4QGkKd8sTI7iXsae7kmgjLx5X/hk9hMxtKbvPPuxZWeF1JDTNp5B2P1+yMdLc2JymGH831N9xp1qrd5Mr9dA1KSW3G4=
Date: Mon, 28 Feb 2022 10:03:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] codeql: add support for analyzing C, Python and Go
Message-ID: <YhyP08GNVJxWLivN@Air-de-Roger>
References: <20220225151931.99848-1-roger.pau@citrix.com>
 <20220225151931.99848-2-roger.pau@citrix.com>
 <fdab0a3d-42b7-635e-2253-3b1ea8b5900f@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdab0a3d-42b7-635e-2253-3b1ea8b5900f@srcf.net>
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9a90b7-0b15-46a7-d82a-08d9fa992aa1
X-MS-TrafficTypeDiagnostic: SN6PR03MB3760:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB376066E2AAA25C92CFF340398F019@SN6PR03MB3760.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8h98I3WcguhKzNrTzahO6qH2eyJp2ubgnuU0Qh4N1QBbzS24wZ4d1Y08XmV/3un9xTmzymGKJ0Y+IiSUTEbKzXl0ZSKJzJpxOCp5snCvRAqXcDLGlvfoM5o89G5xOIttedrctHtv0/8V8meYq/iWvmtb8szlEtv60+mAQNjN1g9S7M9lFpBlcvTn6l1v6GcJNtbXBdYViBbnRN5SwJQSlv3QARF5VoKWhHyF6bWSoxvbIUgZqIIDAa+dF4t4Dbeh1Y2itU4AXlC9okjaEQDRaI+w+rbP8dg3UP8/jT9l/C+Wh9kdUFH+51cjix9HCdKCi3jyFAePLTfgziL/X+gfKLtT4axfSKURxz1+Y3bhln7OewfxlK+A5iODVR/5CiSWJ0DJVeb05RIcHEe9Lm/QB1xXSUh3p7x+fx/fYrrytvwBEJlc9HKtJXmlJ8p2u/+H4F+ghNxERESdIECOY0BhCpyxum+g3IxCEGoKuZRfO+hZ+K2mm0oXgfA29dZzhr4ELvEvMmM9sOBbwuj48/c/sgzA8kBRJVcp6PyfeINObb0NNlkL6kzDodTwM36byV4ADLuDKXsjypkCm8VVZwaaNJrFb7I+KwIpV5fVy1tcuVZ6dcyDbZgj7t0Zm9N4nkP29OQBQqpVWnSGmJGq69pKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(83380400001)(38100700002)(86362001)(82960400001)(26005)(508600001)(2906002)(85182001)(6486002)(66946007)(66556008)(66476007)(4326008)(8676002)(54906003)(316002)(6916009)(53546011)(33716001)(9686003)(6506007)(6512007)(5660300002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtUbG5nRThpeUVMOHlCN1VlOGRDMldXWGxlTUZCMEZ2ZWpLY0NHTVZtT3p5?=
 =?utf-8?B?SllXT01lUWNzN1NYTHB0Tk84ZEZWWXRQM1pkSlBIcjBGcUR1ci9TVzVLSlo4?=
 =?utf-8?B?cDBxb0pjUXNscnlEdDBiWm5jaWdGd1o1UjhkOWs2SEczWDg0ZE9pRXAyZEdD?=
 =?utf-8?B?Mi9CamFsRGRtanhlUitTa2xiUWdCaWJqbmdOclFXK0VuRHB6QWRJTUlVbGhx?=
 =?utf-8?B?d21vZGJPKzZRbXhETVdiYSt2SmZJNWJrUmFRaU1qMHpsS2hqQmdidi9pUlRQ?=
 =?utf-8?B?WmgwcU9Tb05BdWNlR2JUSUFyalJHNXZsQ3lFcGdJQmNiRmxvMDE1blZ6c28w?=
 =?utf-8?B?K2FVWXZERWtpVy9NZDZkcWlvZzI0ZzVEWi8wZ2JveUdWM2NkYnJpMGR5a2px?=
 =?utf-8?B?OTNLK1llaDVXR3pUem9MOWZvZDFVSEl5cEV2RjZZbjgzWi9tUCtzdFdId2dx?=
 =?utf-8?B?b3pEeTM2QVBSNFdWclo0WnJTSlNYd0IrRStjVDdXM0h3UTBkU3ZRc1RFYlpk?=
 =?utf-8?B?UzJDeDZPL1B4YVNPck80YlZpcDU3UExPcm9LSW55TXdTL1NaZzRDYzZZaWhj?=
 =?utf-8?B?TVdCSXhYc3NVd2hQODZNbWt4dnJFWFl4dTN5QWtBbkNNbXB5ZC85RU9Tckts?=
 =?utf-8?B?aHdaSTRPS3FEUzZ4bi8wNDExNW1LQi8zSk9VM3d4QmxkbkkxVUc1K20yZ2lY?=
 =?utf-8?B?N3VIZUh5Ry9Hb0Vwd083VXlGZ3hQYW04cWxLbjFHRjk4a2o1c3pYaGxFdkx0?=
 =?utf-8?B?TmQ3UWVaRVlsWHFkTHFhdVlWK0w1QmJheXYzV0dqREwwbUQwZWxVTHpsa3JG?=
 =?utf-8?B?cTBhZjc0SnJNL01zQWJzSVZQczRLSWJ4TTM3cTg5VGk3dUN1TUEzYkJ5Tk1K?=
 =?utf-8?B?MkVEQ0tzdjBTdjFKUVZqZ0twU0EzbDB1ZVN4QnZNcGt2cjRTOGxtNTVnWk1p?=
 =?utf-8?B?WjZZNlhFUHp1aHhzYXo1Z1VLd09vVytSeU96RkMzZjFGSmhMOFcrQUhDTmRL?=
 =?utf-8?B?S1cwSFo2V2ExZU05NlRvbkVJY1FnaStRdk0vSU1rZFJ0SWZDNytnSlFQSHFm?=
 =?utf-8?B?bHpsMnh1bmgydFQ0QXRoM2srY09HQkhpSTc1TURTQXFQanhOUlpFRTI0cnV4?=
 =?utf-8?B?K204NTVDdERBRHJQUTNIc3BZQTFuVHZqQUNCU2x1ZFRiMmk0WTRYcEk1bWVI?=
 =?utf-8?B?aVhheW1SVFJaNU43RG05VldFRVprSXY5LzliWDU1anREZkhOdjZ2Nm5oWDBB?=
 =?utf-8?B?Ky9NbmkrajJqdDF5YW9CZlBEZlZVV3QzWkZrc1E5Q0I3byswaVdsK21vYXpr?=
 =?utf-8?B?dElIbHp4bnVLOHBBWlJZSlQ4SGU3STQ3V01kOFRSY2F5MmZqeTNhVVk4OVhR?=
 =?utf-8?B?NU9VYTNIMUpWK3JZY2ljaEJXWXJIcXhVZjB3VUg5czQ0V0dmQVhSQ1paeCtt?=
 =?utf-8?B?N2xZenloMCtrV2o2U1VjREJIdlJ2YkZvWGRWVGlqaDluQmNVZm53dXVLSXoy?=
 =?utf-8?B?cWE1TndVMDJ1T0loUDVJVHlQZWIwYVN0ZXRVNmQ1SEYyQnZlSUJVb0V5dWFK?=
 =?utf-8?B?aHczUWZ2UGZlT21DMjFSN1hOR3IzZmdaUFBXMEU1eVNLNE9MN1FiMlRyS0V5?=
 =?utf-8?B?NVhoNnhMRG1oQzNzNzAvbnRCbkd5ZnF5NzI5UjQ5b3BPNkNWVW9wQWtQRndU?=
 =?utf-8?B?dlA3bDJWWFVTdnFaZy9mWHltdmZ4a09qOTE0RHdnZ3NORmEwTWswZ2tNa09q?=
 =?utf-8?B?eVVSdUNKM0pNdmgwaVA1Vy9lcVhWalJjcGFYNEhDcGFhOTZ4QUNCVjJBWmQ0?=
 =?utf-8?B?TWZlUjlPT0tuMStOaGRYaDQyUUhDbUJwdDUrdWVSb1YwWUhCak96WC9CbzF4?=
 =?utf-8?B?czFBN2d0N2FDb0Ryc0g3eFA2N2N0T2E3Y1RjMWVLSWh2czZsQ3o4Uk1jQ1Nu?=
 =?utf-8?B?TzdGcXZiMHNtN1ZMTDFUTnE3dlN4cVNPbkZSNmpGcVFSbGRjUXBUSlFLQ2or?=
 =?utf-8?B?NSttMHpIRDZTcy9HR3hBS1BwQWNBSVNqOGN5K1loYWNrK3pKWHFMSHhrUmNn?=
 =?utf-8?B?dUpWZ3I3bEU4RU1aQUFDMzd2Z2VRU3ZLUFBaVi9iWnF2VEQ1R1pKRlZuVEYw?=
 =?utf-8?B?TnpBTmpWSHR0QTFIQkJQSXlhaHp3MWNONnJFWkRGSGlrYXRpd2xCL1JnWUNi?=
 =?utf-8?Q?iOk/HNcQzL/f3PPvghpZ4kY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9a90b7-0b15-46a7-d82a-08d9fa992aa1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 09:03:20.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZma78ovYZis6fVlcBeFCRwZ5HMTzV5W7jpLDDdbyx5LsfQYOh6LkhBwTnZIYlX0DRttoP8ZADTAzWRLHeqq1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3760
X-OriginatorOrg: citrix.com

On Fri, Feb 25, 2022 at 03:38:42PM +0000, Andrew Cooper wrote:
> On 25/02/2022 15:19, Roger Pau Monne wrote:
> > Introduce CodeQL support for Xen and analyze the C, Python and Go
> > files.
> >
> > Note than when analyzing Python or Go we avoid building the hypervisor
> > and only build the tools.
> >
> > Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > TBD: there's no limit in the number of scans here unlike Coverity, but
> > each takes github minutes and we are limited to 2000 per month IIRC.
> > We might want to not perform a scan for each push.
> 
> We don't push very often, and github is slower at noticing anyway, so I
> think we ought to be fine.
> 
> We can always revisit the decision if we do end up hitting limits.
> 
> > TBD: should we also disable the shim build? I'm not sure there's much
> > value in analyzing it.
> 
> Shim's logic is quite different in areas.  I'd say it's worth keeping.

Ack to both.

> > ---
> >  .github/workflows/codeql.yml | 59 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 .github/workflows/codeql.yml
> >
> > diff --git a/.github/workflows/codeql.yml b/.github/workflows/codeql.yml
> > new file mode 100644
> > index 0000000000..5bfe478983
> > --- /dev/null
> > +++ b/.github/workflows/codeql.yml
> > @@ -0,0 +1,59 @@
> > +name: CodeQL
> 
> As a thought... As we're considering doing cross-arm checks, should we
> use an x86 suffix here ?

It would be nice to handle all arches in the same file, but the
divergences could be bigger than the shared parts, since setting up
all the Arm cross-build env is likely not trivial.

I also wonder how to tag x86 vs Arm databases, but I guess we will
find a way. Maybe using the 'category' field for the analyze action?

> > +
> > +on:
> > +  workflow_dispatch:
> > +  push:
> > +    branches: [staging]
> > +  schedule:
> > +    - cron: '18 10 * * WED,SUN' # Bi-weekly at 10:18 UTC
> > +
> > +jobs:
> > +  analyse:
> > +
> > +    strategy:
> > +      matrix:
> > +        language: [ 'cpp', 'python', 'go' ]
> > +
> > +    runs-on: ubuntu-latest
> > +
> > +    steps:
> > +    - name: Install build dependencies
> > +      run: |
> > +        sudo apt-get install -y wget git \
> > +          libbz2-dev build-essential \
> > +          zlib1g-dev libncurses5-dev iasl \
> > +          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
> > +          autoconf libtool liblzma-dev \
> > +          python3-dev golang python-dev libsystemd-dev
> > +
> > +    - uses: actions/checkout@v2
> > +      with:
> > +        ref: staging
> 
> This one doesn't want to be forced to staging.  The github integration
> does work properly with different branches.

Don't we need this so the `schedule` triggered run picks the staging
branch instead of master?

Thanks, Roger.

