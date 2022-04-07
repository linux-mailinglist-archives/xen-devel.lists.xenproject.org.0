Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E804F7BE8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300585.512798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOdf-0003lD-BI; Thu, 07 Apr 2022 09:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300585.512798; Thu, 07 Apr 2022 09:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOdf-0003it-80; Thu, 07 Apr 2022 09:41:15 +0000
Received: by outflank-mailman (input) for mailman id 300585;
 Thu, 07 Apr 2022 09:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncOdd-0003im-JU
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:41:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7edbf93-b656-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:41:06 +0200 (CEST)
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
X-Inumbo-ID: d7edbf93-b656-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649324466;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WTGLgbQ0WkBnRcIFG0/J3+KcjhKLJrfkPfxNdAj+Czo=;
  b=PWxTStJAl8IvWzBkVC76+FLfqK6oQQYtdvlvA4JNoF6x9d95IxSy6U/v
   c9P5BunF9T5JoiRLuq6y7OBoZWIe8NH82NZq1uVV7EF7KkdOJwKEqTf+Y
   PwoTt9J/nO4IM3bXsZ9PHo3wcaiFO3VA/cwr1nOdMs7J+mqnE/D9ZywYR
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68140121
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ktl9r62JllocnUY+J/bD5f9xkn2cJEfYwER7XKvMYLTBsI5bp2ACn
 GUaC2rSMv3cMWume90gOoSxpkhQuZDUzt5jT1E+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw3oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Oi5eTUlooYZfQv7g/fRVWFX9hELVJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1pkSRa+EP
 qL1bxJBRg3uOS12IGwwN78Uk/+u2lzjWBlx/Qf9Sa0fvDGIkV0ZPKLWGNnYZN2MA9lUl0Cwp
 2Ta8mC/CRYfXPSHwCeB2mKhgKnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQJ8Yv+wtGD117
 EOuw/HHCTJp7qK4UX3Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3hpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtIji7rnXzURhpdnh+pnzup5p1xWG3DZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYif7N/8qPtLuVJ1zpUQFKTgDfqqJBjapSsIvHDJrAQk0PRLAt4wTuBZEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrLbeVo5RTt5Upc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZD5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:rhuULqOJMUSARMBcT1j155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRZxRBf7Lc0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22urKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68140121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX5wNIUbwP+imZYiGeT0g1+7Jz3Y0zjorFZOKlET0r6SNmGDwdWhGhfgP1XP8aeRzfvxXeQIs5w+ifvPjwXv7qWSWbLRWkHPZfS87EwzK9Oxle3yMC7lzKirFXEeeg5bnCkotYDbIilO6A6TkkZMzGO9q0LWYB5/Lw9tkmcn8nd+3lfDA5br4zU5/BorxGIX+X/6NsPurluEsO0eWa9VDYDWGXW97VyP2qpJ+SdzZ+GEe3tI+dZNWuqFiXjW1UAQliTvgX7BO5/yUhw4orQpCo6BpiP+q2JwiMBoSsFLRwJFikGtYns8OghaRCeuqvTfCZDdEnfwt4zKV0VuTlCSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq9sl9b0QstNOmyN2kU3r7P4OKgqjlnWCRO0YZS0w+Y=;
 b=QRTKE0/w8/ltfKSr7gQqN0TJuntm0WfZ8DmhzBcZvoa061QFpcYxKA42PgghRp+ftwbQae6CWmEiYugsqXcn5sofYkWamKiF5KC0rnyVHZBjyMApHjCgt5PTpZ4bvbfHgbzV9GCnqVnvDLYKpj9ZiS/oyb0t9JRAG5KREl7n2unBZC+KeR915bFIMfv1PmfyanIpZpmzZJUxvc530YWKREhdE80AtxuEnjhloxS2uKDuJFpJeLKNnfLg0yGwhk0OFKgNDfHcQ9v5VXqZMTix9An7gzOH8hiU0NOcmy3R5d4eof3gAh+ZikkJHxYOQd7Z02pgLiLjCpLW5e7AOsR54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq9sl9b0QstNOmyN2kU3r7P4OKgqjlnWCRO0YZS0w+Y=;
 b=hwbgTDmVeq8pUH8LMEJaGMAVSrxUKrcX7wacY9vH/U4RcDkmbLyZMOXKyMgqwQjiMfBGfosPMWzHDsqnL4AElw4CmX08CnqWWVO/X5xg6iXnEZ5cm0gBxr48hwECNTtoXNcv5flAWaI0IoMcXl57zjcpW6DKPWGbR45GFbAQkrk=
Date: Thu, 7 Apr 2022 11:40:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 0.9/2] VT-d: don't needlessly look up DID
Message-ID: <Yk6xqHM37nXhAGQM@Air-de-Roger>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <7671478f-e7c0-c43e-6395-1adc70333e04@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7671478f-e7c0-c43e-6395-1adc70333e04@suse.com>
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7de10cf2-1ed1-4329-0ec0-08da187aba4c
X-MS-TrafficTypeDiagnostic: DM6PR03MB3900:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB390095AAC2D27E821C2202B68FE69@DM6PR03MB3900.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeOVQr9z7+RXZpTfaGt1XnolSelHTYhRp958KjSnv2LY0I/uaXcOdNd5XtIt4R1PldUhGjlLuBVzGgLO9wBihGMhGzhsKsWV8cIHsXU9UXqJ9nDqfQhisfl1uVjVtbdrLyibUYmFher4d12JbaFq6pPAPOSwL2C4pwo2AumgqD/2Ad4ev79JckoMdP6hlsVJNxr8a3scMI58FeFV+r8F3qsTnmkUrJtZNOl03P3N6bi25BhnI3XVVEPlrzUBtRPs3g5tsfAplc+sHXmWVTDwxwlDomcfvYl6X0UXPlt4nJpIdt3Jv071bWOQL5yMopCW6fHJ4g51I/J20uFsmYJIRC74AiRtEZrYrybnxAt5dqYOiyvE8HxH7/WxpITx4WZGWPoJmyjZdrJQN1G3h0Z/ta515JPtJQwDVM/7p4mQFNwg0Ik7OCImAsLuoxqPRYL46xkyk3I+N+cQ6ETROIrXub0aHV0lzonyN2Nxny/mNrh8QTbIhnlyeqzBXAJe8uCFaCX9DPmPkyqo+ZszvIBHtPJDWjfcpKtSbwN7ePlEHox/TRMfxrAnOwTGfccMcH8/+7rmYMg71dGY0SqFwcOJeCeBnvumkhMdLjW4NlKZV2hCyrjpM9lGCmGtcFvT7P6ZdMaWxBbGQng8gwPq+NEUlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(316002)(33716001)(66946007)(66476007)(66556008)(8676002)(38100700002)(4326008)(86362001)(82960400001)(6512007)(9686003)(54906003)(6916009)(4744005)(508600001)(186003)(2906002)(6486002)(8936002)(6666004)(26005)(85182001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0hNZVBIU3o3ZXdJS3phdU04VW5VUU9sWHhEQkJuVHNtbU9CRGh1a0wwaHZD?=
 =?utf-8?B?MEgxMjEwKy91Z0dYOWp4V1pKUW5IT0lrV1dEa3pEY05KZFl6d1VaWGNGQytW?=
 =?utf-8?B?Qk1hTUtraUhObU1TRXErK2hOWTErUWFWWTZDZmZody85WjBEQzkvZ05LMk1F?=
 =?utf-8?B?eWNPUnIrQTJKUU9nMUN2S3duUGJQbFkzZDlSNXN6RXJvM1hlNzdnQWJlWU9L?=
 =?utf-8?B?UlhKL2U5ellnMUJybXp3ZUxiemxKaVpYRzJoVzVlaW1nSW9Yd25WcUhYVkQw?=
 =?utf-8?B?aWNaTWsvVENiT2RqRTF0TlZaWnpDUzgrY2NILysrMHh4cEZHU2Y4K09QYTZW?=
 =?utf-8?B?cGhkOW41bkkxQjNoV25PZmVIdEd6VmJWK3VqYVRuTXpsT2dQZGRULzBwSlU0?=
 =?utf-8?B?OURnMDdocG5pQUFFREs0TkptNnVTaWplZDgzT2VzSk43RThkSzg1MHVvWm9n?=
 =?utf-8?B?S0tGRWVMR2pVejNwT3h2cTlJZit5TE5GNncwYkk0REdUT1NQSXBKOXlvY0ln?=
 =?utf-8?B?VEkzTzR3WmRuOGF5QTl6TFd6YVo1bzhqWm03WGM0dVl1Q2tNZWNIQUJGVDN5?=
 =?utf-8?B?K0tOWjQxNm92T3d0cmZZZDE1MTZEVFRtZ2hQZU4wUVVOMGZvVmhxemdYcFR5?=
 =?utf-8?B?RHNjYTFWS09RRUZjU3dGV2lPUzVxOHhEYlMvRFo0T0ZNSGlIckpSVTF2MW4z?=
 =?utf-8?B?Unl2Q29xNXFaYTRwSGpPVE5vRldsOHBxd1IxVG8zMWxZWmhCVVk2dGRiRnMr?=
 =?utf-8?B?cXRkT0J6aDVxWnJWK3hFZ3RVSTVmV0NudlJCbnV1MTExWkEwczEwM2VQVHZO?=
 =?utf-8?B?dFdiRWtMV2kwWFY3WVpiOHI5cmljZ3laOWo3TW44cnM2alNjemxXemFuQWRB?=
 =?utf-8?B?VFRNSXRYemRKVVEwbjRUU25NYTZkd2ljSFVWK3JBemo3aFhVUjNWZTZlM1Br?=
 =?utf-8?B?K2RzQ29VSmxKaHVhYU1SRDQybXcyWktQNXBVcDNoNFFYaG5tSklBMEJ2ZUpE?=
 =?utf-8?B?UDlzS2R0bWJJV1RpdGg4ZFVlZEJKa1dITVBvZHU5NUpUa3V5Sy94eG9nRm9m?=
 =?utf-8?B?TFNlMzRRTWwxbFRoQXNpVU11QndDcTB5T0xqemx2ako2RSs4NEZ1UHZjVmti?=
 =?utf-8?B?RDgyV0VuYUdCREl2dlNwcFRKSzQwaW5Gdm5xZUwzMVFGUlAveGJSUzgxbUZK?=
 =?utf-8?B?U2krOE9RMHg1cFFjK2RhN20xenBRcWJzRHVNdENkQzBSQkl5dFlrbDFsZTBR?=
 =?utf-8?B?ZGlJTTB0RFIxVkRKNHplSlVBYi9TalowdmU3T291SFp2YmpYM1huWTlrYzc5?=
 =?utf-8?B?NGY5L1FQZlhHc0ZhOXcvVnlrZG9TaTF6U2JvSHZrQUhMZDFnVm5aT2NWaVdL?=
 =?utf-8?B?VXA1VGZNalNUOUpJTGF4alQ0T205c3lDRE84cDhZeHR2UnVKeGpFclZlUWZn?=
 =?utf-8?B?bW95eVdSNUpLZ3IvQlpHbFE0K0gyajNydXBpNlZVa21YYWprRDhhSm1CQmo2?=
 =?utf-8?B?TUljK2pSa1JubGRpZ2xuRlY3YWphNTd2SVc3S0lCM2djeG9oZ1ZQTUlFSE9V?=
 =?utf-8?B?OENUcmIvb3MrU2dVS0UxYkFDVjZCa0I0R2s0cDVTSmJIdXVzOGNWb2pPaGEz?=
 =?utf-8?B?VmFyZld5Z2IrbHhWdnEyRkdlbE91OEdQb05oRDhpeVNQTUFuL3NucXNmRmRL?=
 =?utf-8?B?bVNhVC81aGY4N1dxSW5NMXJkcjdBWFo0amQzMjUyUUV0dWRhNHRwSzRsa1pw?=
 =?utf-8?B?QVdLSjE5OXpDaHl3QjdVb1JaTmtWVVVFcWZick1adHJIVzN5UW41Vmh2TkpX?=
 =?utf-8?B?bFhoM0dNT3NpdU5FTFF4Z2Rwcnp6Y3FJdXlBK0dPZHRJcVZuK0FTY3hpSXl0?=
 =?utf-8?B?dE1WU215Wlp1UGZ0eVFQRVVHY216WUR6NUFCVGY3dDhzOCsxZ1JZenBMWDZr?=
 =?utf-8?B?SW5QTURlRXJVTTJHU3VLNHFBZk03U1Btc3U3Q2c5Mysyby9Ya1gwY2FPUE1a?=
 =?utf-8?B?TTRrN1dBako4aS9la3FDVWtnblJwQnRnRURzcUpHdFVpM0N2OXFlSVljQWEy?=
 =?utf-8?B?eTVPM1ZCV0dKRUhNQjM4MnF1SC9ucHBjeUZEbDhyOFpVbmJYSm9ZbU5KVjNY?=
 =?utf-8?B?MllpbmsrQkdQZ0RZbVAvNFRsN2gzQmdKcG5CUEFmNlZNQi9zQlRIREJBMldU?=
 =?utf-8?B?cUZwelZWRkZvM3JxZXBzQUpPYVlHNjlXYmdxYVI5UWg4MUhBZzYzQXprMGRO?=
 =?utf-8?B?RlJTK0FzVk9HV2VOWGdUeWlpR3JBRnZnSUtRNU4yaXZQMXIzcG5lQnJPNlpG?=
 =?utf-8?B?K2tPa0tEaVdGbUdQb3FLaGVybmp0cFUyaERQTCtnNVlsTnBHdDRaNjdtRnNU?=
 =?utf-8?Q?05zJXpCIlTVFVMxg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de10cf2-1ed1-4329-0ec0-08da187aba4c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:41:01.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOHxiHnyd3/aKUlAqApjl3vSQqzNDKUOPtnuF0rFiuQvcIcn6+imPHUnLOPCxHbvZvFhl3LfAxhaHiYaCB59Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3900
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 11:27:53AM +0200, Jan Beulich wrote:
> If get_iommu_domid() in domain_context_unmap_one() fails, we better
> wouldn't clear the context entry in the first place, as we're then unable
> to issue the corresponding flush. However, we have no need to look up the
> DID in the first place: What needs flushing is very specifically the DID
> that was in the context entry before our clearing of it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

