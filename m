Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDEC4CFC3D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285832.485090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBCH-0004Wd-1E; Mon, 07 Mar 2022 11:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285832.485090; Mon, 07 Mar 2022 11:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBCG-0004UR-UG; Mon, 07 Mar 2022 11:06:36 +0000
Received: by outflank-mailman (input) for mailman id 285832;
 Mon, 07 Mar 2022 11:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRBCE-0004UL-Ui
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:06:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3820ee2-9e06-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:06:32 +0100 (CET)
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
X-Inumbo-ID: a3820ee2-9e06-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646651192;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4jiTWFzfg+Hof24nySxLLbYj+1Se52/xC+gnTX+UC5I=;
  b=TSv7VUecLmfXK/HwyScZJhxNKd1q69aX+pCfvyYLxFWnJQdVN7QyT7qV
   QmJvE5DGFn/iecYSxe7mtVOJ4W4unDggVsBN2b2ztaQK/vHbq7FTTzXcX
   R130YJhpKN7GjxG46vI8s0QyV1c+HovOJ4Uvuk195iGCd6EZdru9x+yvR
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65596249
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UG6qWapr+ytH8hoRH02YjoFt8LdeBmIaZRIvgKrLsJaIsI4StFCzt
 garIBmHO/2DM2H0Kop0YIq+8xhSvZCGzIQxTgRv+381Qi8UpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Yyq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGYzpnMkBawJiGixlIbYbxI/JPFe7rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdEOGQ1MEWojxtnHks9L8oOzOiUomTVKwNfkmKanZcb7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUdySSJ57bs+DyQC3MYVWN9WNI7m8spEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWBhRqjBNzAJrVkg
 JTjs5LChN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG8jdRkxbZ1UKWOBj
 KrvVeR5vsM7AZdXRfUvP9LZ5zoCl8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bJPbm00CC7SlOkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:VtSbWq0OJvEWVc96G3uYfgqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65596249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKC6AIlGlg6jl2piluRSMvFav30H45VdiAncc0qBwSxMWHkbVypqMWZSou6V2E2MuG69VKz1OEuQhB4AUyek94F2cNilBzfvB+YHrbmYEUqfqZ2mATNf5heUws/ZAadFHuLtsnMo4SNTDfK9b7hUiXbOPsHZ62Rav6pfEl8yUgpp2t8vtZySSd84tVDDKuOu3XD1nMmumr1JmQusidqAeF5+LpsQ8Fv4YrWqdTke2YDdG3lsmGI+H7aRuLVXxV3C4oc9RbY9ThIVf1r8HhEtbsoTqiZ0M25ZoGmjeetEfiOkyESrh8qQfg7MT8SLWzYA2Qn3XfwZan5mKo5htqC/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm398PVYfwhoOOx5KbPcWKDdvz31L6nypnsbIg8q0q8=;
 b=fl48AGHiIR3bx0t06CbLXIyOTN4TlHLY4gCFpIlNJHt9tw4PmZNUSek4RfvnOGJPHqrQ4Y1liYfXQkSK+x7iQd+psT0/X+ifiv4WzhlFS+h5Kd8cSycuf6sWriSPMV0tfZN8DGcEpRX6g6Wsw3NtGt46uis/BvHhO7Lb8PT2GMz3WefoUpClhT/PBnkj1crRQvzx5HWULbtAjRuTvYx/9HHEdt1To9ipcK9v8TgVBozCet/LFK6y3V+L9AO2v9N83Si9kqgyVe9RxxJ3X1mkBqh0ZdspENeJkO03ZkJXQz6vE80ITRhBznDuLDiDXCJlQh6zqI/843sduXH9fulJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm398PVYfwhoOOx5KbPcWKDdvz31L6nypnsbIg8q0q8=;
 b=rPJQ5rkDBlmnbtm/3vI+UAGivBFg2PdMP/CTlAkwggiXgENxzevUsP89SkzZ3iZeNDPejBVlEa/MHq0XjdMRRsKqY6pbRTEaeiyYo7xY+21w2NdMpMaj1xpAU1F0duC0GdiqJsx4cHrwpIPGs6G3mB3F6XMAT7OMlaI+yPJs6es=
Date: Mon, 7 Mar 2022 12:06:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YiXnKvqX1FGyhzmy@Air-de-Roger>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
 <YiHZpmrYt+QvE7ex@Air-de-Roger>
 <2ebf82d3-3509-7224-6537-acdaad34dcf2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ebf82d3-3509-7224-6537-acdaad34dcf2@suse.com>
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d0e498-2c9c-4dcd-1995-08da002a84b1
X-MS-TrafficTypeDiagnostic: BN8PR03MB4995:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4995DA9F181EE9495411F4AB8F089@BN8PR03MB4995.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxS7ROn4NKGFFsnpWaBYzEsZlYrAYojpzpIZ+Ul63j98lxAw4IbqU08tSVOJvJaBjgNAFarjx2lv4k5DS3huja75xQ+5DpOLerZISxxMfMYD75W4FySS5unoQGim/J1IXDELsXPsSiPzEu6aDqBVPZe+dYrqDyeGp0Fj5QvV80AGtGK2mxXT67v1fvdOEWraGSIO5cI7KAwokRoHqlH/pYTxqC9u9tWG0wK+BKZbVQz+kz5+JRNujoZ651WTML2fiSYi4nXn2phcIZk61zftbyLYLjOnFhTTyoR1UpFMVIGbABKo3F1Ig//MW3NFyBmQO7B+I8Bagacak5IxA0wqwMXcthOUF3t/bMVDpe7Ou5iT0bsrV/DnqTfC5x3Z4CX5jig2a9uNJcAsv9l/bTYGrpAHO/81wvkCkHIHnyng6g467DnJRLlvQjP4iSPhQmD9ZtZoNNU5Nw7TBH+ZcEnOLfX6vCzztDgPmL5h5XBcd6rYODrKeBcsIa/isEjFo2st+DYw3rqA/TFlHNr7H5oSXKbKvcm84l6OZLhs/K09t8mq9I7g25Yxyu+WW9RhujVJeZmTdSG2pSJHzck+olmSKEETZg1tT97AF5DuRFu6ITQB3TP6kD13gMWHNcJl8Ptqvi//40jqrvYLlvedXCXH1RXUpBel/tJKO2VDMK4C4Tac/ePYSP9twG5cU4JQzEee7YiLCHOKNYGM3RSaQ3GoJCTqWu4dG3y7brQ1xI0s0PddF6bwiaAhQ/NnATSKbWcTigLME1hYx/BoduoVlasRwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(6506007)(53546011)(8936002)(66946007)(5660300002)(86362001)(6666004)(9686003)(6486002)(2906002)(6512007)(186003)(26005)(8676002)(4326008)(66476007)(966005)(38100700002)(82960400001)(85182001)(316002)(54906003)(33716001)(6916009)(83380400001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dBY1hPSDE0QzMrY3kzTHBjSFNjZVhPL2NlaW85ZktiaHJJcld5c2xFUlZW?=
 =?utf-8?B?V2MrNmJqNUlpYVJwUGZQd0NFRWhSVTJ2UFZvV0VvdGxBRFF1OTVrQnV3N3FB?=
 =?utf-8?B?MzdCTXdsSFlCWFQ3Y2ROWnR2RzFLZWxWYVhUNmZGWnBKb1VOLzMyRzhxWjQy?=
 =?utf-8?B?RDRFVkxkZkRDLzg3SW9ETlVZZDNXZjhqditzcGdPbVROTGp2WXJsS243ZEpE?=
 =?utf-8?B?V0g1S3lqT05sSGhJOStPK1hrYzRsWENYdkJDemJWY1NqQXkvRlh3R29ZVm9F?=
 =?utf-8?B?OHh1YVJ2bXZtOWlxSmFIYXFZZjg0VlgvaGJvV0ZaZldTSXVFbVpza1liNnZ3?=
 =?utf-8?B?NFIzdXNmZHdsczZFL21tT3U0Z2h3ZTVPdjZJWnd4MEtkNExTUWRpc25rTm5L?=
 =?utf-8?B?THIrUXNGWkUyOEdTNGx5cWRrNGhIYmlvaDlIcDBYWSsxR0RrTTJGTTluNkw1?=
 =?utf-8?B?QkU2NEVFblFIY2YvVGk4SEJ4Rko0RGhPZUp3aE9kTTZtZkFzdmN4MWpUN1Rm?=
 =?utf-8?B?NG5WWkNteEg4MnBlYkNrQklBZEhzQU9XN2kycXJjd1FiUnRta29KcHcxS3Ro?=
 =?utf-8?B?N3dFTlpndVQ4cVdQME1wcmhHOFIzMWRZL2ROcmtxVmdBRUNUajlCZGEwTlBM?=
 =?utf-8?B?VFhyQ1RCeW5jbFYvbkhOaVpMRmt6M2RjbmpTTjUyMktSWE5Pb0RBZlBRa2Nn?=
 =?utf-8?B?K1JHRjlPY2J5TVFWUmhnMHRZTnRUUyt3UmpBaVNjaWhBakVQYWozejFIczJl?=
 =?utf-8?B?Q1BQTmRtcWMrbTVPYytZcy8yMXNUa25ZWHg4U1ZUNXB4czl0V01JeFNMNjI2?=
 =?utf-8?B?c2VIYTRrTUxCUjY1eGZ6M2FpQWppVThLcjFBL21GSjlneHBpSFZXVTVNOXph?=
 =?utf-8?B?dUhlTUQ3Q1kvK3ZUZW1yT3g1Y1hpVHhPU21UMGsxOEZuTTY0TDhHSENIT2No?=
 =?utf-8?B?VExnYnkzSW5KRzFKZFlEU3BLaWJYTFpDTTZPMUdicmRCb2RDUVcwam41OEt1?=
 =?utf-8?B?QW5UYkRRUGZsMmU4QnJlbm1jalhGb1J1bEp4d0JCWjArem53UjBjN2dTOEtZ?=
 =?utf-8?B?UXJ4KzVSd2wwdHNxTC83SVRxNmc1cnViMUVPNmRRMXR1U3hKa3dKNmtaMUxt?=
 =?utf-8?B?emtsejFvQWdGaHpWVUVNdFVYQTRKSWhQT3IyU0NWZzNLa2RoVWhhWERrVklH?=
 =?utf-8?B?cUJSaDFndVZMTHNFY1VqcmhGOUljY2pCQk5KRnpuMmJFazF5MWs2YWJiOXFM?=
 =?utf-8?B?NzN0aVdpV0dpL0QvVHYxYUdRdG9tZ3FPSUcwOFBUa2gxQzNSV0pFWEM5bHRG?=
 =?utf-8?B?NFpSZndPQWVvSjFBbTNwSDZjMGFLT1UvSVFnRWQ4WFNXdHI0aS9XYm5lMm5m?=
 =?utf-8?B?TlZRckNPeUxLTHdwK05JdGRJNW5KRnliYVRTRm5XT0tlQkpqWXVUeEtTMGVQ?=
 =?utf-8?B?ejBURWRmRWd6bWpDdEhBZy9wbVZqQzh5ZlF1YjNQSzBqTXhFZk9HODNtNTlU?=
 =?utf-8?B?eXhXU1JrZjVKalBLaE42OUpScm1iZUlqK1EwbDNDSlRnS1JON0pqbURZNmp3?=
 =?utf-8?B?UTRsTGJ2WEFEMDg0cDZlbHFUcUQreThrMGdXVVM4ejRLM09JMm43cEp6TmFi?=
 =?utf-8?B?aGtySzFhM0Jrcm5NR1NudUxRUnFmMk96RUNVaVdzd2pEK1lydUtVNlBSNVMr?=
 =?utf-8?B?WUc3ZWtOejFDbFkrOGZ5VmJhRzV0S0xNck1EVzk0a1ROeVNtaXRkRXlESWlX?=
 =?utf-8?B?NTlIcUJvR29HR0c2blNucDlkekFHaFRqdXF2VDZlM0IreVF3T2FkZVRUUHpn?=
 =?utf-8?B?T096c0ZDL3JvUGkzSWlRbU9Jc0JKYkt1d21pVldNSFlnSVFxaDlERE1BaGRs?=
 =?utf-8?B?dlhPbURncEJQZHJJbUh4YUxOT0liR3lRbjNBVm1vVVBOQWFvMThLYzdnb1NB?=
 =?utf-8?B?UXpuTTBlOWlCeGtwMEJ5YW9PZlJscTR2ZHNITVJSdTI5eEtJVWVLSHcyZzlt?=
 =?utf-8?B?LzRhRi95TUN5ZHFmc0JCUHB2Q3ZwYnpiTytyalduVlNPYXdHYmhDSlg2V2hs?=
 =?utf-8?B?a3ZpeUpuTWxENVlpd3NPL0hMQ3VYYmErQU1tWWh0bVZoTXhwVEdjeERxUWxw?=
 =?utf-8?B?YW9Sd21lUU1yeDFtL2xuc2NWN1VVRzlnNkwxOEk3SWg3Qm9WeGNBSXZXRVpJ?=
 =?utf-8?Q?J4OEPRk2QPy4myOBsrD2QXw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d0e498-2c9c-4dcd-1995-08da002a84b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:06:24.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvHyBzwtmbkbjHd8uRaFHGuWCampEBBLSY/tACLRP5wEf7omxmGkC/dcr44ZxCCqXAt8pxZjC787DixmGXgU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4995
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 09:18:42AM +0100, Jan Beulich wrote:
> On 04.03.2022 10:19, Roger Pau Monné wrote:
> > On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
> >> On 03.03.2022 16:09, Roger Pau Monné wrote:
> >>> On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
> >>>> On 03.03.2022 12:19, Roger Pau Monné wrote:
> >>>>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
> >>>>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> >>>>>> binaries"), arbitrary sections appearing without our linker script
> >>>>>> placing them explicitly can be a problem. Have the linker make us aware
> >>>>>> of such sections, so we would know that the script needs adjusting.
> >>>>>>
> >>>>>> To deal with the resulting warnings:
> >>>>>> - Retain .note.* explicitly for ELF, and discard all of them (except the
> >>>>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
> >>>>>> - Have explicit statements for .got, .plt, and alike and add assertions
> >>>>>>   that they're empty. No output sections will be created for these as
> >>>>>>   long as they remain empty (or else the assertions would cause early
> >>>>>>   failure anyway).
> >>>>>> - Collect all .rela.* into a single section, with again an assertion
> >>>>>>   added for the resulting section to be empty.
> >>>>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
> >>>>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
> >>>>>>   .debug_macro, then as well (albeit more may need adding for full
> >>>>>>   coverage).
> >>>>>>
> >>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>> ---
> >>>>>> I would have wanted to make this generic (by putting it in
> >>>>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> >>>>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> >>>>>> LDFLAGS would mean use of the option on every linker pass rather than
> >>>>>> just the last one.)
> >>>>>>
> >>>>>> Retaining of .note in xen-syms is under question. Plus if we want to
> >>>>>> retain all notes, the question is whether they wouldn't better go into
> >>>>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> >>>>>> notes are discontiguous all intermediate space will also be assigned to
> >>>>>> the NOTE segment, thus making the contents useless for tools going just
> >>>>>> by program headers.
> >>>>>>
> >>>>>> Newer Clang may require yet more .debug_* to be added. I've only played
> >>>>>> with versions 5 and 7 so far.
> >>>>>>
> >>>>>> Unless we would finally drop all mentioning of Stabs sections, we may
> >>>>>> want to extend to there what is done for Dwarf here (allowing the EFI
> >>>>>> conditional around the section to also go away).
> >>>>>>
> >>>>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.
> >>>>>
> >>>>> LLD 13.0.0 also warns about:
> >>>>>
> >>>>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
> >>>>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
> >>>>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
> >>>>>
> >>>>> So seeing your mail where you mention GNU ld not needing those, I
> >>>>> think we would need to add them anyway for LLVM ld.
> >>>>
> >>>> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
> >>>> pre-processor conditional keying off of __clang__, as that used as the
> >>>> compiler doesn't mean their ld is also in use (typically the case on
> >>>> Linux).
> >>>
> >>> Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
> >>> but I don't really like matching on human readable output like this.
> >>
> >> Same here. But Linux'es ld-version.sh looks to be doing just that.
> > 
> > OK, so be it then. We can always improve afterwards, as I don't really
> > have any better suggestion ATM.
> > 
> >>>> I also don't want to add these uniformly, for now knowing what
> >>>> side effects their mentioning might have with GNU ld.
> >>>
> >>> Wouldn't it be fine to just place them at the end, just like it's
> >>> done by default by ld?
> >>>
> >>> Are you worried about not getting the proper type if mentioned in the
> >>> linker script?
> >>
> >> I'm worried of about any kind of anomaly that could be caused by
> >> mentioning sections which a linker doesn't expect to be named in
> >> a script. That's hardly something they would even test their
> >> linkers against.
> > 
> > I've raised a bug with LLD:
> > 
> > https://github.com/llvm/llvm-project/issues/54194
> > 
> > To see whether this behavior is intended.

Got a reply back from the LLD folks, and they consider the GNU ld
behavior quirky. Linux linker script does explicitly mention .symtab,
.strtab and shstrtab:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a840c4de56

So Xen should be safe to do the same.

> >>>>>> --- a/xen/arch/x86/Makefile
> >>>>>> +++ b/xen/arch/x86/Makefile
> >>>>>> @@ -120,6 +120,8 @@ syms-warn-dup-y := --warn-dup
> >>>>>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
> >>>>>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
> >>>>>>  
> >>>>>> +orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
> >>>>>
> >>>>> Might be better to place in xen/Kconfig with the CC checks?
> >>>>
> >>>> Well. I've tried to stay away from complaining if people introduce
> >>>> new tool chain capability checks in Kconfig. But I'm not going to
> >>>> add any myself (unless things would become really inconsistent) up
> >>>> and until we have actually properly discussed the upsides and
> >>>> downsides of either model. Doing this via email (see the "Kconfig
> >>>> vs tool chain capabilities" thread started in August 2020) has
> >>>> proven to not lead anywhere. I'm really hoping that we can finally
> >>>> sort this in Bukarest.
> >>>>
> >>>>> I'm also wondering whether we could add the flag here into XEN_LDFLAGS
> >>>>> and EFI_LDFLAGS, as those options are only used together with the
> >>>>> linker script in the targets on the Makefile.
> >>>>
> >>>> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
> >>>> the respective post-commit message remark.
> >>>
> >>> But the calls to LD in order to generate $(TARGET)-syms do not use -r,
> >>> and are all using the linker script, so it should be fine to use
> >>> --orphan-handling=warn there?
> >>
> >> But XEN_LDFLAGS is also used elsewhere together with -r. (Whether
> >> that's actually correct is a different question.)
> >>
> >>> Could we do something like:
> >>>
> >>> $(TARGET)-syms: XEN_LDFLAGS += ...
> >>>
> >>> And similar for $(TARGET).efi?
> >>
> >> Yes, this ought to be possible, but would again lead to the option
> >> being passed on all three linking stages instead of just the final
> >> one. When there are many warnings (e.g. because of the same kind of
> >> section appearing many times), it's not helpful to see the flood
> >> three times (or likely even six times, once for xen-syms and once
> >> for xen.efi).
> > 
> > OK, I think our build system is already quite chatty, so wouldn't
> > really care about seeing repeated messages there. We can find a way to
> > generalize passing options to the final linker step if/when we need to
> > add more.
> > 
> > I'm fine with doing the LLD fixup as a separate patch, so:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks. However, something is wrong here. Unlike in my local builds, the
> pre-push build test I did after committing this triggered a massive amount
> (tens of thousands) of objdump warnings:
> 
> CU at offset ... contains corrupt or unsupported version number: 0
> Invalid pointer size (0) in compunit header, using 4 instead

That's weird, I wasn't aware we had any objdump calls after the final
image is linked.

> Helpfully it doesn't say whether that's xen-syms, xen-efi, or both. I'll
> have to investigate and fix; I can only guess at this point that this
> might be triggered by a difference in .config, or be hidden by some
> other change I have in my local tree.

Hm, I didn't see any of those when doing my test build on FreeBSD, but
didn't check with gcc.

Thanks, Roger.

