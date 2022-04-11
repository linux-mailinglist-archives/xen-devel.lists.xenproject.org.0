Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE044FB5D1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 10:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302730.516452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpG5-0001u9-Ub; Mon, 11 Apr 2022 08:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302730.516452; Mon, 11 Apr 2022 08:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpG5-0001rM-RS; Mon, 11 Apr 2022 08:18:49 +0000
Received: by outflank-mailman (input) for mailman id 302730;
 Mon, 11 Apr 2022 08:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MKM0=UV=citrix.com=prvs=09308b1b0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ndpG4-0001rE-9c
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 08:18:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014e9b21-b970-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 10:18:46 +0200 (CEST)
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
X-Inumbo-ID: 014e9b21-b970-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649665126;
  h=date:from:to:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EWPyjAd/csTCe9IycIIFxxGcKa4tb/P5sYycIvFQTPI=;
  b=Q9UesL1dVFOwsaeGmBjRF8pcJ+Opik/gGUQU12IkcXE6VJ8/xcjcn0lX
   CsKea1BN1k3lLQo5b3ZdzyICTAeZZBnTlDh0OFTvn0fmt6D+RToq5ARby
   Q0xQQK91xkzbhm8f9el1QbITINyiA9xO+ZlAYIK4gDmhfxzyj2VTQaPD6
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68518209
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XV3aPaKagKDK51eKFE+RspUlxSXFcZb7ZxGr2PjKsXjdYENShTFVx
 zAWWGzUOa6LZzf2edt3PIjipEpQu57VyYdrSwtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MRQid+cZCo0BLTzx/ojQid6NCRgJ5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg25keR66PD
 yYfQQpoLzfscxhVBncWEJ0utreM2l3FSAQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3OqvMX6pmOTRuhGF
 BMKxDsQj4836laSG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9Eyr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8XNWa1Y715djO0CHEbfv2W/Em3QxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZYypbHsrtTVM7czkRhpdnh+5nzuZ643MD02wYzT/HNCRzwk5JcQWygyG4nfxo4Wir1UTTof
 FXSqWtsCGx7ZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9BieR7mX1knTq7qFKS503P7IdyrUW9EN8tGFCPcvo4/OWDpgDU+
 MxYLMyE11NUV+iWX8Ud2dV7wYwiRZTjOa3Llg==
IronPort-HdrOrdr: A9a23:Z5Lx0arjGRUa05wAfd0wJboaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,251,1643691600"; 
   d="scan'208";a="68518209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZTVzvzzn9PYc//+5PW6XndeMLgG6/DStnODFg9eSTbXL7q8WEBST4LewSSgX9I6tHf5VzVrnmNv5lgUJS9xHi7RD0DaNRwCMg+eDhq07wacEaM6wCOhTBhIL3AVwMWGXFzdm6iUw2kXz0TZIUte+EJD1+S9XsJbaaj54pu60WHf3OtPk/AkAUacN5pYEsIvYkzArHQkAElAN6/t8RM1c7QQRzWMTaZKjIwtaE8h8U/DG8P/WP7xtAA0BNq9yes0yfjwjz2f3G+R5qzs56OLKz8091yJpKN++4syscwf3hRadayTPaLnClxL5ra+grISup1EqGsUfEz7niSYr1ttCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbmDmjgnkIOWPJs6I+8tVdX7E0ZlS5QQ0jQv6bvKLgk=;
 b=EMXRFpDbYg5NcWlOrxU8rBjzkyXkla3+FGCkDl+7qDAceKrDMY8fCuKtehga7X0TqYcVCfrlP/ISwqsOF2KSCN7SkOPJa1O5qsy8s3LWZcAIdiulMwuwq483QsPBjKougHX4jLD7KXbqSKxIfFXfhnnfIrBVqa9W16Bo+rq6jeyCLGq3J+t2BprixxIsYQSrJFjdkztfznfEr7ctNUIzGkLylMRruNvVeAPUTpu/KonGz2imVTPeBlypjVVr+3eOt58NwSQG9Y8/qfERL2Qt56NlhWLy7Ri5wkhvkoAL1c2Q9p+VLTAJfQASrNThldFmm3mGUj0MjqmhohbMnc48iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbmDmjgnkIOWPJs6I+8tVdX7E0ZlS5QQ0jQv6bvKLgk=;
 b=XmPLvkjB6ndNZyvzeem1CqWP3irAsC5lMlyVOKfF3ty0cc3SWPn7YuR3KeYnWagsZxacMIgtALgKG/bV3cL+qZ6EpCybervyveuQZN3ofKBinAdBxKAaGt+qolt1fFGGeLON1yqj/+CasFRBx+aOni+OGsoNx4oGKc7ffvn2B/A=
Date: Mon, 11 Apr 2022 10:18:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: osstest: boxes pending comission
Message-ID: <YlPkWsYmGP3mOJP8@Air-de-Roger>
References: <YkrCkzWRW1xMvzSj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkrCkzWRW1xMvzSj@Air-de-Roger>
X-ClientProxiedBy: MR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 898bea07-2c1e-4bdf-5cef-08da1b93e1cb
X-MS-TrafficTypeDiagnostic: CY4PR03MB3144:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB314451E32E82D47E35B765408FEA9@CY4PR03MB3144.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/ZTvJpiA5wHfa3xOwxcZE9sf08Y6O4rl4OlMPNKytJhgqI9L6ZrAa+hfuvumjBHhnx3Rzuunm36R+kLaXp5kCptDInL632uTs3nwC5adMOA9lY/Byxud8nDUyxB7EGKyIPVvke11BXzxaz5T9LwTyjQd9EXX/qeND2RQOJJJa+On7cReIn9pJGIHjU2bPoR6FqjNrOtOEuiEhv3VdlxHcW4KJahCbAf8b4AH8GzBeYwys5Xe4BDWPATmt6BYmpSunTNxWPEHs8K3SEDiysmzRx2+lzWwgm9SlIR2Ijn7/IWXzj0kKK1gFM+HyQ0hgn8OUt8X50IbpAKKT8sN2hnl5PwjZI5jHkaYrceq5vt8w43NJjCLQnd3BLYpMXIiTNwWW0WUudjs6aSjtH6nLtyI+2uKwRpLwZz4Un+Y8ytbR2l4gJdc5S72mTtONaVwa3qcq8Uh2NmP0M0LOrSCOHKudv+zF1WiK4Q+vQyLbl2PX4Qv0wSxjOjDkTB5eNjduPKICvtvODlVaAXummN01Hx1Oww4HrbqokRTWE9yxmnEfBySJTcUuf9i8gCZmhuIQafWeQvG6YFPfILyVavO4o8pDdlvjFdY9w1QZd9ikxn8huO1iSg8h4IH431QPPYPdvE+QKzOjZWXqr1u2Rdpu9JBzyg4PEhgEOKjdcpqxdYmRO3R8xtfxJcPE+81LeFfLKJKE7N2Gbb1RxDImgT9l7onBy9Tge4UhbkLQ9EQQe9ZOLjw8iNbb5g2QkT/UsYx7GZtERlMq3sVbn593fx0Sd29w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(8676002)(6486002)(6506007)(66946007)(82960400001)(66556008)(9686003)(316002)(6916009)(6666004)(6512007)(33716001)(508600001)(966005)(86362001)(2906002)(85182001)(26005)(186003)(8936002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJKc3RQTWxkcDdhSVhtUnl6UjdTdks2UWk4WWNGNVErWGhxNGlIY0RwTUNC?=
 =?utf-8?B?T2JOaVVwM2tIdlV3bEIvd0JDaUtJcUhnZXBLa3ZWS0tLM2czak1sU2tIL2M5?=
 =?utf-8?B?cW9aSVExbjhpV21KWURnSmN4SDhrMVZrNCt1WWdrRUVhRUdrSGVmRm9IK21W?=
 =?utf-8?B?Z3Z1dnRDd2tweXYwcGh0U2JQcVMza2ZKZ3FNMmZNeXY1Y013UXZSaktCNjFw?=
 =?utf-8?B?WjJteWxOeTJKMUUrc3Y0T3preHhNRVltVE5vTmdCQ3NaS2tsaHdwUDVtN05R?=
 =?utf-8?B?Z25vT1NFbWh6TDNPSFgzSXdsSlQzWW9pd1JrWlBoN0MvZFd2S0xVRmJZbUht?=
 =?utf-8?B?YkliQjdkY09OaWFnUlRUc3VRbk9ZUkFOeElESkdYU3FzWGloa0ZMMUJoN2Vi?=
 =?utf-8?B?OFZqQTFIWjUrdlhIL2ZWOHZ1UXdXODlPMnpUcGpoajQxQXBlZXMrdE1iQzlw?=
 =?utf-8?B?OFExeDZZZDJEVGV5L00vS0c2QWs4OUZMbnhLRm9xMGMyNCt1bzQ0c2toS3Nr?=
 =?utf-8?B?bHNZd29YRWFJMjQxcFdEM05oWnRRcjNpRWYvelpvRWg5YW5WMms1dlpLTUxR?=
 =?utf-8?B?cFM4UG5zVVprZ3dPczltNUt0Q3cvb254N3JadUNReE52eUw0blMzejZxdmFD?=
 =?utf-8?B?TFQ4T09IRm5pWWlKRlVxVmd5bWM5UGtmRWxXZ2xlVmRnNng4cHpxOFpDQ1hz?=
 =?utf-8?B?TnN3QUxic3hmRS9Yb1hMZWVyRnljd0tEbWc5aWdLT3kwSjBISlNuRzc4VnpI?=
 =?utf-8?B?eEhGa29hbE4vUW54MWdGMUFTWXhTcWNUZURQRWJYWHJzd2R0K2M3Y0lBUGNa?=
 =?utf-8?B?YnhhVzRhTzBrUkQ0eVN1b042dDBURGJQV2tXTWhoclRuQmI3ZUpWdVBScFUx?=
 =?utf-8?B?OUdkUDFJZHNWRHJyNWJhclo1MEVCa0xCWTJYdXRDd3lWR1oxTVZPc3VwUUxQ?=
 =?utf-8?B?cTk0UFJOazk3VnprTWJlamRHc0VxMndIUmlHYTlRcHhNbWVnN0dDNTZuTmNx?=
 =?utf-8?B?NGR4RWx0RjVjQWc1WjdKdXIvcy9ERkdYdXAvcXBLcFBnSW8rSDNTRmlUTGlh?=
 =?utf-8?B?cHZBT0pIbEZlRVhUNk00OFJDRGpKajhsUzFscHZ2KzdON2N6ZHd6bTgwZ2pa?=
 =?utf-8?B?WDNFUENUYWNzeUpNRk42QXIwclZScjI5bmVwTmVKelM1czlqYWdGVFFxVjlX?=
 =?utf-8?B?M3BqaTdGYnlYb1dnWFczb2RkODlTc3pmTUVQdFlJWG4zZDQ3UWZqUHdZMlR1?=
 =?utf-8?B?UWlLV09kTHFQZXUwTmQ3ZVVpQS9Ib1dZRXlERGNNZ3cwejVxWjRxMmQvTEtJ?=
 =?utf-8?B?U2VYRnlka0FmMDZJaHRVSXNVTmM4N01IUTExUVdONVdBSFBVN0I2cTErM0g2?=
 =?utf-8?B?bU9WY3ZWaVFnWWFYMThjZjFoRk5oSE5ReDBnRE1YS3NzSE1NU0pFWUl4WGlT?=
 =?utf-8?B?OWJqSGpqcWVNcGlMaGFvc3NHMFRUT2FCaUhVdnFVMHdMK2N1MWczekg5TGMz?=
 =?utf-8?B?aWJ4djZZU1o5Z0I2UkRwM3k1QmhoejVlaW5NLy8yaS8wTW8xVkRNeHdHZlU2?=
 =?utf-8?B?bkszck1vZW01b05kMWdYd3JaR1hVdzkrNlByQm0xb3pGOG9NMUZTL0p0UUVQ?=
 =?utf-8?B?OTl3c2hBeDUzSEJmUkNuaFkyUms5d3BEMUNiNkZHcGI0aHNpcWJjdVVqMzUx?=
 =?utf-8?B?bFh3L2JpRlU2M3ZJZ2dtWlZqU043TG5mS0RyZXZ5bFN4OFhDQ29hYnlWV3BU?=
 =?utf-8?B?RjdHZWh2L2FHRnN4RmViM3krVDNVOGFYZTdDeG9vUXVqSnF4bUJkMTBhOGtY?=
 =?utf-8?B?c2ppMm5Nd1RtanRNblpCOGtCK3VYcFJmdlhEQStwRGUrR2lreGxtclViY0hI?=
 =?utf-8?B?eHFDcEUrZWlzQmtZZFBpRXhoNmhyUzJZMWJ2cWdIeU14YmdYUW1OdDYrZ01X?=
 =?utf-8?B?YWRMUnNMSHpGbHN0S2ZKZ0ZpYXRBNVM4bS9MdWgwT0lhY0E0MkpIamF5dGI3?=
 =?utf-8?B?TitXUVpRN2pRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 898bea07-2c1e-4bdf-5cef-08da1b93e1cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:18:38.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hGYPafbN454W4f+qpSyVxj8SIo5za/ODM17w3tZZse4eG2MgLlNFcEN70nDa6J/oJCGYo0Uu23hM3R9IBjhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3144
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 12:04:03PM +0200, Roger Pau Monné wrote:
> Hello,
> 
> We have the following boxes pending commission:
> 
> italias
>  * Commission flight at:
>    http://logs.test-lab.xenproject.org/osstest/logs/169015/
>  * Issues:
>    All fine except for the leak-check errors:
>      LEAKED [process 14559 run-parts] process: root     14559 14558  0 19:29 ?        00:00:00 run-parts --report /etc/cron.daily 
>      LEAKED [process 14558 /bin/sh] process: root     14558  2252  0 19:29 ?        00:00:00 /bin/sh -c run-parts --report /etc/cron.daily 
>      LEAKED [process 14564 /bin/sh] process: root     14564 14559  0 19:29 ?        00:00:00 /bin/sh /etc/cron.daily/apt-compat 
>      LEAKED [process 14571 sleep] process: root     14571 14564  0 19:29 ?        00:00:00 sleep 1091 
>    Those processes are from tasks started by cron. Disabling cron in
>    rc.d during the host install doesn't seem to be honored later on,
>    I'm looking into a fix for this.

This fix for this has been committed and passed pretest, so I'm going
to put the italias into service, the last flight LGTM and can be found
here:

http://logs.test-lab.xenproject.org/osstest/logs/169244/

Roger.

