Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50084CD444
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 13:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284259.483465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ72W-0001LE-1D; Fri, 04 Mar 2022 12:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284259.483465; Fri, 04 Mar 2022 12:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ72V-0001Hg-Si; Fri, 04 Mar 2022 12:28:07 +0000
Received: by outflank-mailman (input) for mailman id 284259;
 Fri, 04 Mar 2022 12:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ72U-0001Ha-GS
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 12:28:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 895c277d-9bb6-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 13:28:04 +0100 (CET)
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
X-Inumbo-ID: 895c277d-9bb6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646396885;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dN0AMt5O+yXjoCqRavd7qAnoTlWmzYwYUUprXXvzMYA=;
  b=PtKVIqewPGPzhELDDxrRTymOVSqTH96hDvl3nBXeEKG4tQDADxi4bNWV
   SEBPP5B59NUYFJMxhkbJdHTm3ZOw3Zg64cOu51Xc1PW29theFt2Agy1o4
   /bYRzqIpir1LVl9IaPo8R7eXvZLWUd5zMV+QIcgAVLq+nt16sGHtMSPWm
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65466918
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IFy9W6nrEaJKB1slIs79aHLo5gyyJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDDuOO/jZYGKnL95wbNvlph9VupLXxoUySgRqq3pjFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFhoiNa3etuonWBRzPwVdL4BlpOPdGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uCO
 ZRIMGoHgBLoQkJCAgpQGcMHpsiPonagfBxoogO3jP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77mUVBAcbXB2gvfSng0i3R9V3M
 EUS5iMoq6Eq9VeiCNjhNzW6qXiIpA8BWPJfFuQ77EeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LWNyu7aVW1yTzLyZhh+WGjo4DjNefxZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoSTLkWd4um0WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5CKuPNIsVOsYtL2drGR2Cg2bKhQgBd2B2zMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+x/UFzrqTp
 yrlMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F+nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:BRISNKrvnohXIKrIa9lbKOgaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,155,1643691600"; 
   d="scan'208";a="65466918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBh640GhcekHCsaQ7O71OcXRazG6E3P1cV6QYWkagRjr/oiV5+goSXJfKVgGt54s05pGV11O4sTgZzTbcZllzaAj6tMvDekU3AcJLL3M95lT1J5DgES/P6TzqLcV+DSMZGdyljPjHby4+pCtchUArc6Ls1vFCIxzZVn8fHW3x/EmiRbsRJ8EoFEslNbr6TRt0RSMjkVYLloihN3OVef5n9yH7oNHPE/hDOVU9n54mJ9ZvvUsenrwwEmWnHRgCPQAWTZj2acRIPcRyYwgKxg8GudnN9nrxMWepMEZbuwCAgScvdqbD4JAyiDwWBQWCP0A3gJAh0UtT8LtnXLYc8BmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNKztTb58j2y4AuBoJQ8CN7b5TakX7boc7Um12ZryHc=;
 b=Wm5BZF6lZ3kYAZX7WAAqN97XqErUxxk6RIhlu6C30DsYzrdayli2eEJQ2ITvAsy3+WKrD68QkSvdsJGCOcijBJiUh349n/95KI+SBscYRWvdu7CUgUzUkzN99XzdK30FtwU497Bb/LcxdVlSKQ4nMsf9sPfWT56fp/xdDWLlVZDbRtn3V4by7RZdfvcnl68a4XKHcvCUmutdST8s+opbvkb7ElzQLGpCWsGfq/Ju+PIgsk/Hp0jf3mNOe5bZkAhQexHE3M/o4KTPIoMhTG5xwKkq8rmHquqUAxS4QnZA7mTmi/tKNo9nQSq95hM+KpeeKiHFoFB1rXropt1yhbqKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNKztTb58j2y4AuBoJQ8CN7b5TakX7boc7Um12ZryHc=;
 b=I0GkqdTMQ/KscLfJe7v50fVLrTA1SkQEF1az+C5bmjPl82vf39lsnRe7nHl2uW4iLluRL9fa0zM3wjdDFFVu94NRueWBSUomX8PXK3uLMfoYhApAOZf8ojEjD+p52VchlV1NhCcrmZug9DY7ZM8rW7yFW+v8f7hGsb8+Tz9c9gM=
Date: Fri, 4 Mar 2022 13:27:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrea Stevanato <andrea.stevanato@santannapisa.it>
CC: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiIFyRUNXpUfzwRB@Air-de-Roger>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2593ff65-7e34-4aa8-e035-08d9fdda6b34
X-MS-TrafficTypeDiagnostic: BYAPR03MB4198:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB41984FC1DC9A53F49CD99A1B8F059@BYAPR03MB4198.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CRZ+cFuhhD9Wp8+2eMcEDLY5KSrqzHHd7ZjchKd5KHRx0/deMPxkEwElLTtmqM1Is+g3cOaSqpXsdCM4xeWOPI1dwEF1f/FKrp7zzEsBDu48xm/NGCM2FnuSw2FiIk/2w5ljFIqfjYlQH7/25NpGpqqhab6Ypa4H81gziAkelr/ZE1S7Ol8xYEklxRAmzQ85oTs9NYFrBIYVZGKsssW9F8llD1HJvCH3UIOi6rc/artD5j51Pd7aV19g8rOBtxvGtlOWHnJHNG2njbpvk5r4P136I2idEkH54lmw+wxhjfcicF7dP7GwQpxepvA6RuacDC39R+8+ct6rQhS92IV3d/815QffoJMpvPnxmassOUUaG549H5VH5yx2J1MJu77zOCk2HtFSOq/gtNnovYjQnmZ7ecEQ14JNUDLGiRUFECV3wccYE5NO0K2PM7MVTkVgsYx3f2GCfQWDLkBMzh9nktDqH/OyQr0Q/9R/r8IOB/i0ZA2OSO3d5UmDB4e6OOkgWdhXHcw0G4OF9u/VgQhmTy8VzaHJp9qa6zYWxMHloRgWsTdG2JeyYmpOfkm9J2rAwz4QYRrTapJc8mqaRSi5nZaRm1DtW520/Li9XPfiKfJma/upitdaoQkzRDnmK4pVNlQYMRTnzsWu5rCNRYviFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(186003)(66946007)(26005)(66476007)(66556008)(8676002)(107886003)(6666004)(9686003)(53546011)(8936002)(5660300002)(82960400001)(6512007)(86362001)(6506007)(38100700002)(2906002)(316002)(85182001)(6916009)(54906003)(508600001)(83380400001)(3480700007)(6486002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZFdlB4Z0F5bldFWlYzSkd0RUF0VUtHVjB4UzMrY2hxVFl1S241T1B5d0JU?=
 =?utf-8?B?cG85RmE3WitaZHhpK2RmaVBLTmpUenBTLzZyRjVsK2JLMEhtdDRMU1BPdHlr?=
 =?utf-8?B?RGdqSitsWTNNQWNjdC9HeHNRdS94N2JGRjBQQS9iWUEwdTQ4VnpteGcwNjZt?=
 =?utf-8?B?RExEWktNWkx1MDg2OTNTTWxIaUtZbXdRWlYyU0dRdTZkQngyY0Zac0d1V2Q2?=
 =?utf-8?B?L2dneFMrTW1kdG9OVTZVQm8yd292Q1pELzJyY2FpTWJ3ZDIxZzR4TlNldTZW?=
 =?utf-8?B?YUx5UDFwdnZSaXdTdTJobElNZjNpQ1JQZml4TlgxUG5rK3dIWjhRL3YxYjJv?=
 =?utf-8?B?UHh0NU1DRkxURVphTzJWMTZkQ1MxVUhPRUw5UzBYSWovZTZjVnJIcmF5eVJW?=
 =?utf-8?B?bzR1YTU5NVUvTXM4YXhnclAvM2FMYUw1YXhKL0lDMnNIMnhBT25hWEtHd1BN?=
 =?utf-8?B?Vy80cXlNZVpPZ0pYY0xFSzdFVE5CMUlRdWxnZ2hIbFpYblVCUnpZMWh1V3Qx?=
 =?utf-8?B?RmdQWjYyWlFKTTZxcEIvejNmZFZ1WEI4VTVST2ZXelF5UmNmemhwdEpaWi8x?=
 =?utf-8?B?WkZNVWx0b0NHV20zNjFTRi8xTmlLOUNCSWxUcE9OaS9MSnNLdFBQZ0VJRE5q?=
 =?utf-8?B?Yjk4SUtIdUpFay9paXF1bkhTeHRRbVBVOHppUW15dXFuWURMY1Uzbkh3THU4?=
 =?utf-8?B?ZmlGVWE1bjJGUHZ0Zng5cG9KU0NGTTNSd0J1WnU5NVNaN0doWUVwaUFDT2hL?=
 =?utf-8?B?dnZRdThKMlRLcW1PdVIyeCsrNGljNmoyWTdoMG1IVjh5V01wSTZ1WHNMdkpI?=
 =?utf-8?B?OEI0UGxmd08wdHhGdFBVc0dGVmMwN3liRVFiRmhWTGdvQVRucllhUWtCZlpp?=
 =?utf-8?B?UlBXdWx4OUpadGVIUnFjbTljbERDTzdwT1Zkczh1cEpEbVVRcXYyQ0lzcXkz?=
 =?utf-8?B?Mjgvbi9SOVhETys0SGx2UllkcEdLUU5tdEduK1l6Uk1BWjdpY0xIQXNNZEdx?=
 =?utf-8?B?ekdQSUZuM3R6TGxrR2xya3ZLUkdlYlZvR1pUU3kxenBqYkx0NExCRGd4QjdV?=
 =?utf-8?B?L3MrL1FrQkVnSGx5UkdRbjBTeXBIVW5MZjB3L0dzWU14TVc4QmVrZWZIN1dq?=
 =?utf-8?B?VzQ0RkwvUHF5VFJWZ3hPSFVSMzZsZFVncmxMbmRXL0JHd2ZBbHlEdXI4S1ZN?=
 =?utf-8?B?Y0k3UFhzaEd2bWR0S0QrM3hFSXpLU2h3LysxM2ZraEFOdFNkUWpjdXUxbFNK?=
 =?utf-8?B?djdsNFhaQnpOYThONkhCWVpjYlBnOEFZMC9vVngyRGIyT0FyVllQdjFTSjA5?=
 =?utf-8?B?WElnY0FpaVZXTkhuSnhRN1dLWnlHaVRHT2h3dnZXcWdhRGRVU051cjU4NjFy?=
 =?utf-8?B?cmhsTWJsYko2ODh1UU0xckk4NUFKWFJ3UDJLUWxyOFJ1RGdWZ3FIcHA3SGxh?=
 =?utf-8?B?Zms4TjVGUFY4OHRDSjNpaXhIZUJ3ZUNxWU4wUVIrUmMwZXd0a0NsYW5uYXJj?=
 =?utf-8?B?QWRYSXZ5MXYxamt1ZEJ3Q3FXN0o0eTBBSlF5UWs3TS8yazM4dSs5dGlWZEto?=
 =?utf-8?B?T1Qxc0tha3pHZzlId0JKbHZacWdkOUkzdVFvaWx0SDlFaVhmazgvejhNazUr?=
 =?utf-8?B?aFh2WWxEMnJ6Y29iYUdHZ1BMSDcwQlFLaWNlL2lkekgrZWNHV1hqVkhaWFR3?=
 =?utf-8?B?cjU5WnArSTZXaHNXYmY0ZENJdFUvYjQ0enhoV2VRMWRVY1kyMUpjMElsa1pT?=
 =?utf-8?B?enl5WVQxY0hXV0g5ZUlLM0FwVmJDR3p6S041VjdPZHYxVjJWMEFod2FSNDZY?=
 =?utf-8?B?V0lXdE9iQkszdWs0RURqM0YwRE9DZ1dBdkswSDdiRTZVT0VnY1BrRnZFVFpi?=
 =?utf-8?B?QU5WZzNFejFEaEo5Q0Z3cStaMnB6eVlNeUtBQ1lSdzdOSHpVbVQzT3NMbzZw?=
 =?utf-8?B?NWo0R3N1L2dMZ3Y2VFFKdGNlM2ptWTFkZlM4aTRwWllrVzNDZDE0U09xTUp3?=
 =?utf-8?B?T0t1N3E1UG1ZeHlvMUNpQ01ETjZtVEdhRnhUUnN6bnJIZ1l5V2FZSGZSZVMz?=
 =?utf-8?B?dnFHaDFQcFFBcmsxTXBvUlJTWERXWm02QnI1YnhaL0NaQTlXTE5rMWJTK093?=
 =?utf-8?B?UFFFM0I0amJUQ3N5bkFFdXRUNXZnYnJzVWFvelptYmkvVzNWeHVSdFhONjdp?=
 =?utf-8?Q?XhYwKW5KfLGFowPgk/zZUE0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2593ff65-7e34-4aa8-e035-08d9fdda6b34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 12:27:59.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ng5JxMAT3y+/3pvqM8lS0pZyijnRwA8n+CTm2gulPCoH1+PRoZ3I5pENSBBuiPXTGzVN58EYG0Vff9p6ANBkUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4198
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 01:05:55PM +0100, Andrea Stevanato wrote:
> On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
> > On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
> > > On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > > 
> > > > On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
> > > > > On 03/03/2022 15:54, Andrea Stevanato wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
> > > > > > 
> > > > > > What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
> > > > > > 
> > > > > > name    = "guest0"
> > > > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > > > memory  = 1024 vcpus   = 2
> > > > > > driver_domain = 1
> > > > > > 
> > > > > > On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
> > > > > > While the second guest has been started with the following cfg:
> > > > > > 
> > > > > > name    = "guest1"
> > > > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > > > memory  = 1024 vcpus   = 2
> > > > > > vcpus   = 2
> > > > > > vif = [ 'bridge=xenbr0, backend=guest0' ]
> > > > > > 
> > > > > > Follows the result of strace xl devd:
> > > > > > 
> > > > > > # strace xl devd
> > > > > > execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> > > 
> > > > > > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > > > > > write(2, "libxl: ", 7libxl: )                  = 7
> > > > > > write(2, "error: ", 7error: )                  = 7
> > > > > > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > > > > > write(2, "\n", 1
> > > > > > )                       = 1
> > > > > > clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
> > > > > > wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
> > > > > > --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> > > 
> > > xl devd is daemonizing, but strace is only following the first
> > > process.  Use `strace xl devd -F` to prevent the daemonizing (or
> > > `strace -f xl devd` to follow children).
> > 
> > Or as a first step try to see what kind of messages you get from `xl
> > devd -F` when trying to attach a device using the driver domain.
> 
> Nothing has changed. On guest0 (the driver domain):
> 
> # xl devd -F
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
> the maximum number of cpus
> [  696.805619] xenbr0: port 1(vif2.0) entered blocking state
> [  696.810334] xenbr0: port 1(vif2.0) entered disabled state
> [  696.824518] device vif2.0 entered promiscuous mode

Can you use `xl -vvv devd -F` here?

I assume the process doesn't die unexpectedly?

Thanks, Roger.

