Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64BB314CF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089825.1447297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOi5-0001Ad-L5; Fri, 22 Aug 2025 10:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089825.1447297; Fri, 22 Aug 2025 10:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOi5-00018J-IM; Fri, 22 Aug 2025 10:09:25 +0000
Received: by outflank-mailman (input) for mailman id 1089825;
 Fri, 22 Aug 2025 10:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upOi4-00018D-K2
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:09:24 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 131af707-7f40-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:09:22 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DBBPR03MB10344.eurprd03.prod.outlook.com (2603:10a6:10:531::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 10:09:20 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 10:09:20 +0000
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
X-Inumbo-ID: 131af707-7f40-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMnKUbEgVqSDpy08fsb+iqpCMHKA0hv8pwWSVwhPSBd7bTgq+kNaBikR2+jfvzVY8H8YO+8Qgav8pGdyb10eraXU0K4nvplPHWd86iqSuyYX7xEmuUpc66yXcOQ0dII2OQ69nQDJCCuey3F1juxYxpNpOs7wfkd2LdlUH7mUdItNRa8zRhM6ypotWgqXMhUVzr0XfvsrNiFTnP6HrlSLHnw6Sm/3eDM3dlJU5ecbIOHzyICERuK4hIzIbcEgneTSQvxJlAnX1XUHD903qEHwRZE/NCh+gdtEml1kIMIhsVsCyQC85pGvRPgFHSnmHcZfBvFF56KV5Eus9Hl9+ERdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr429g1Sn1INzynHm9pWT2y0tCDebL6oWyiqr1pmEyY=;
 b=PldXlCedKJSEvDEQlTDbkJ810OvOPQc8e0e1Mvbhy8wbNufvWCooM265nm1Wx7UAoDd3FJON2u0lzPvQbk33vujeWsfyjH3rHbbKFDpeOOdSzfb5Fi6KD/Sl/MaLvcXMdPLOAk0oKOsJxk7sknGiSXyOWdmCGcCFjmcvVZk2brNoKhHgSRCCqXS+mZCzt+zuD9Naj3imfsD71Ai8kX1NHenZRJ4HWZlhA5WXR/Qa4TIKJW+phhySgSkiw8IOG4eCuhW4LKik0tFeFrkj/yHRrj82k5VsHp9umvU5w0RNlXBCGTvtN+daZW7/yf9cHjn1Cx88+AWwd+AyR+M+EBMo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr429g1Sn1INzynHm9pWT2y0tCDebL6oWyiqr1pmEyY=;
 b=WICrbqqAZ7cKD9rUVvrVv3TPwhWqxO3ZSFM/CbOXQZXOy7N8vRFtqor5al9PYnBxIFN/Z44KQiXU+ik/vpUbFFrMKDzdWpgC4hPCRJatUJBAyI8QN2oYSxkfSFflQYY+IU360X8KjYq4rxtxvIPf8UYquyFyJZ7zvW2GycxLEP5LMOhtJgFif3cn2N16NUBGXjdyqN087d3Hu/zf3t89uUeYVb7qmz1IiT7IcWuwAttKFQK5bBHnfjhzHx1xibOGvG7PEsUM1qM4CNeo5Ge8t9uk9FR6pHunirmVI9mHJQFKkx6xgATszRxDUKBfcFxPmQvZnSK7rHywz7k+9TYDDg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
Thread-Topic: [PATCH v2 01/10] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcB5d7cCAQRdJCgUKSzBGsZt4ytbRtXheAgAEbjYCAAAhPgIAACIOA
Date: Fri, 22 Aug 2025 10:09:20 +0000
Message-ID: <213ff54d-02c7-4423-b35f-f3a98dff80dc@epam.com>
References: <cover.1754514206.git.leonid_komarianskyi@epam.com>
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <915641a6-8cc6-45bf-a1ee-d69b286e7d30@xen.org>
 <b2b7906c-d810-4162-b700-7f1dc2153f4b@epam.com>
 <26a5f2dc-0eaa-49b0-b15f-482a47808051@xen.org>
In-Reply-To: <26a5f2dc-0eaa-49b0-b15f-482a47808051@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DBBPR03MB10344:EE_
x-ms-office365-filtering-correlation-id: 0c8f4e59-6887-4dbd-afef-08dde163f61d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QU12ZnJ4MENabjZUNUpNcU5PZTRicjlpeXhuWEVwaG80STNqbHNjUHFUS0k1?=
 =?utf-8?B?WjEybzdVNTZMbTloU09FYXpnbmw4YTZSRlhLY3pHb0I1VTZLWGZ2NjEvbEpu?=
 =?utf-8?B?QzF4VlFBV0kzZWp3Q3VmeHJpcDVWVWFwK2tCUzFmVTNYNDlRMnNSdmF3WTNW?=
 =?utf-8?B?VE10MHpGa0krYmRnaGppRkx4bURwUEY4Ti9uenZNQXFpNkE4VXY1VmpiWlMw?=
 =?utf-8?B?aS8xTjhTL0o1R0ZNUVNSTDF6bDNtZUU0WFpyaTh0dVYxK29HQ0FtUmZna0Jp?=
 =?utf-8?B?UHpHa1VVaW13SnByaWxzbTlrc21LTnA4ZnQrZW8zTGt0K2VvSlRWRnVTRm5v?=
 =?utf-8?B?V0pyZ0pSOUdRLzlTQnpNNG5sWWRIWEtkc2RaMWNCSkZzNFBTWDZwU2lSaUpH?=
 =?utf-8?B?MEpCZ0xFZi85QVUxVXZHa0Z4ejA4ZkVHcno0encrTTEyOS9sYW5ydFhBQWNL?=
 =?utf-8?B?cVhYeEZJSzlOcHVBc1V5TFV0cllJWldRTVBEeU1XS1RPL2FEeDhJa0JqZDZB?=
 =?utf-8?B?OVF6ckZMekN2d3hJRFRSNGVZVnRPNHAzV1lrcFA1eFFTYmFQR3B4RnVyaU1O?=
 =?utf-8?B?OUF1bi9lSXpNS05GMFdiQUVKdkEwOGVwRkRqamttZE5HUFR1MUhPcnpyYXl3?=
 =?utf-8?B?Q3hRcHd1WGlpZHU2QXVKbWh6ajAvbnZlY2lMT1pKNG5ueDlJY29SUWk2OTBM?=
 =?utf-8?B?MkkzS0pTUCs5MUVhK1V2dldEV1FpNUs5Qlg3Vm1pS1I3ZE5OQldVN2pSMUhD?=
 =?utf-8?B?VkVDUU02clk0TUUwK0lUa25QZHlveThEWE9SUWszLzF3RXptOGRZeWlXWHBH?=
 =?utf-8?B?L3RrSExrVnZwQ3N0NHZhOVNRZzFJd3IzWVZYc3BUOFhMU01iTjdzZStIYmo4?=
 =?utf-8?B?T2pGVmJLMk50OXN6MFpRcGFvUjltQ1RKZzE3VGMrNDZXYzF4WSt4MnRsSU0x?=
 =?utf-8?B?anQyWWp5cjc5WmtlR1l2YVkyckN5cFR2dExBTzBiMjRydGlLK3dGMjZZSFFh?=
 =?utf-8?B?S1g0NTJPNXBRekNDQVhWaDhPUThjbE1YaSt2MVYrWm51UlVnWEhkdnpVc3J1?=
 =?utf-8?B?VUE4TDBuRDdkcUdsWXNHN0l0TThxU1ZUendyRnhrZ0R1RVN6MjExZnQ4bnNQ?=
 =?utf-8?B?anpTZms3bGlmUC9mczhWbVFFa1c1YUt4M2lEelJ5aktQeEoxZnZFUXFuZUti?=
 =?utf-8?B?ZTdHTmJyclgzRmNVSkxTUEZ1NlYxSDJDdlJHL1lXeFNQNWs3TW5TbzRpbjNM?=
 =?utf-8?B?MStCUHo0SnYzejZQQTRTMnF0akE1ZUViemV3bERlYXhLTmdVZWdVbkx5U3RC?=
 =?utf-8?B?V3JBb09BOFFxTU9NVnAwemF0RVdqQmFuTVBiaEVQdW85bXBnc1A4NFQvSkFy?=
 =?utf-8?B?SVU5T2lhelcva1JodXp4THhabFpSbXQ5cU5FdVRibUdVcDN0L2hpaDY1M3pq?=
 =?utf-8?B?WVh4YjlCME16TTl1NWNJanBDRnhMNjNud09SWC9peXR3c3dzbk1aZUtraEND?=
 =?utf-8?B?ajlaOWQrQnNtYkJQQzlGbFF1R2N1UWdQQUpkeGdWeW1ITDFFbTBGSStQR0FL?=
 =?utf-8?B?clZBM082SEg5SzhqU1lKV09PMFVBVXZGaXZXUWdvYktQQUt4eW9RSWNyRWJm?=
 =?utf-8?B?L1prOE91TUF6UXNjLzhES3VLR0hURkIxd25VU0R5NDFGanI5ZTMrcSs2eHBj?=
 =?utf-8?B?aEg4OTJlWlQ2Z0Mzd0wzT01OUldqaWx0RWlmUnNjR0lNeU50eEp2V1ptN2RC?=
 =?utf-8?B?SFl2Y3cyNjVoa2tkTFE5dEtLdHFHdjVRTFN1Uk5rOUFBZlR4bm42bnlUUnI3?=
 =?utf-8?B?QXI0MUc5UFVJamplSGRHQmVYTWV5Nnl3TmxvajZZek1iWVBLZGszb2VSUVBH?=
 =?utf-8?B?bDZ6WXc1S2I3MDY5L0ZhUGRkelFqb3dkWHlWVXM1VnlKb3NMNURKVzA3dFgw?=
 =?utf-8?B?QW5ab2JldFZ5NXd1eC9pbDNyWG5lYk1XNnFmRkhGNUtrZTlOVmVhNkNwN2wy?=
 =?utf-8?B?Ym1LeDlUcHRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3VZaDVQQnpmMUg0czVtaVdPbXNhWEtxb1VGYk41bDJyUE9XQkJPcjNxNm43?=
 =?utf-8?B?Y0YwNTBXalRuS2VUTXJneW03aWdJMVV0TkxiT21kNGF2MUorakx5S3hNdGVM?=
 =?utf-8?B?bE0yNkN3dXRpSEhNbDRRYVp5Z1Ryd005RVY0RUh1VnBmaU11V3cwQ1FlZmFu?=
 =?utf-8?B?Q2ZkZEFwbjNqOW01dHRrSEl2OVlYUEpNQjV0NE9VYkJQZE40U25kMkNhbm5n?=
 =?utf-8?B?MHkwOC9oa2JkYjZXNmRNU1hSOFFNQTgzS2tzMWxZcjZRckVmRU9QanMwUjJL?=
 =?utf-8?B?NHJiZ3FjOTNnbDBET25NZ0txVFZ6Tlo0STM1VWZPM2pEekpmVVRhY0JhVFl5?=
 =?utf-8?B?OUhrRTNvcENUVk5XR2VzMnpsN0J6ckZBdnRYT3dMcWtMeDFyQmxCNGg5Vmxk?=
 =?utf-8?B?YUxPZlBTd2VRU3NRVW5YbjYxTTJVUjFWQ3FQNFpGRmtjR0p3TkYyMU0zdTZr?=
 =?utf-8?B?R01CY0dxSkdXWHgvS2E4NkdXMFZNN2pxdDNqZWsyWTRleHdYd1FnRHNNU053?=
 =?utf-8?B?RnNmSmRVNlFhdGtSQ2I0NDkzUFgzbFlVYVhhTHpBaHdpZ2lFbmVHTjNoMVJh?=
 =?utf-8?B?dGJSd0F0ODBkNjMyV3ZVa0ZUS1hIQ0MzUnJNQ3RMQ0YyVTJCOTBwUHRUUEpv?=
 =?utf-8?B?VDhidzJmRW96blJoYzFqZThhOTZ1cVBXK0xLVEJMOFVsMlZCOU5uU1Rjdnd5?=
 =?utf-8?B?alZoRHBrcS9sNmNQbU95S1h3OVNCQy9CWTFLWm4rcmw5c3N1OTdvQU1PMmNB?=
 =?utf-8?B?NlJBRU4xSmZxL0p4VWVQL1lZSnBydVdSM3EzcmZUUWhUSkZsREptZ3lRVDBE?=
 =?utf-8?B?WUVGeVNNQjFhZzRRa0VqUU02M04wV2QvajlrczhRckc2UndxbUJKRmpZYmtF?=
 =?utf-8?B?VEZkS0pRSm5OZlVjako3elZxa2trb2lWS0lmSjUwY0x6Uk41VUM3em1nWk83?=
 =?utf-8?B?UmNlNlI1dTlkL2lVS2w4MUpRVVliSnorQzBNUEpNVk9xZ2taWVlNMFBTd1l3?=
 =?utf-8?B?d25ZVnJCL29LeEZDclRHZWRlSlBPL0tEa3U5M28wZlIyMWsxRDJRZU9tRnhH?=
 =?utf-8?B?UzdYS291VFNxc2x1NHJ6dnNtU2VyTEFoaGhleVdjNzY1aXJ0UXJTakRBVWR6?=
 =?utf-8?B?OG1UYWtKckk0T1RxRW9jWWVFS3AveExGYjBTU1N5ajJ4M1hFbGJOK0x4aVpC?=
 =?utf-8?B?aEVuS21SOGZEZEorbnE3bEYvM0tWazFsMGhxeGJicHNxUk10UEZuUGtmUmE5?=
 =?utf-8?B?d21vVjBoSUM2OGs1YmJkWCtXaFJFTCszbitJd2pEdlN0SmpwMUtqU3BORGEr?=
 =?utf-8?B?RXV0OXlHWVAyL3hEVTBVdFIwWXFKZFExa1dPRTFKOEJxQnkvODFPVTJqOHRU?=
 =?utf-8?B?Wkl5UGJpK1U4NFpsZEJqeVJaVnNOWHVvek80NkZpaVM0dnR6cW5XL0ZtWDVm?=
 =?utf-8?B?TWlhQWVsaUtMa1BZQ0U4QXF5cGNIdkl1T2k5TDVRMkFzaEdyZTFvUEFXcTdT?=
 =?utf-8?B?TTl3ZkN4YWZ6cHJBZEJEV2pBd2tNQjQ0S0JFNFZLODdkVjlReE1WbE5XQ2NR?=
 =?utf-8?B?MS95VzhCNFRFR0pTemNzeDZtamF6NUxLdHNsYmJPSkpnN0RaSjZpRXhnVTcz?=
 =?utf-8?B?bkdLa2YvV2ExYkJDYTVKaWpTYjd2V3BvUTNIaWttOHREQjB2RUI5QjRWQ09j?=
 =?utf-8?B?dDlYOHpMNFN4QU9SaUovZmNFcWdTOHVCNjZVNEZ3ZVZ4cmVTQitFbTd4d3N6?=
 =?utf-8?B?dkMwa25RRThxcGZHaWtKWHZPVHNXRnloNzdlQ1MyM0plcjFCVUl0S3BoTGlN?=
 =?utf-8?B?RFA4YmthQkdwMUNYZjVaMUV0OUgrL1dsTnlYb3o5Tk1VZVc5UHNuNHEwemth?=
 =?utf-8?B?UmdwTWNLZGM2MkVZM0VkY1JmaUl3Z3NrU1NBeHlNT2NpSnZNWUhlYno5cnlM?=
 =?utf-8?B?MFFwaXo0R0JrK0JFRHY3OE41Q3JwTG9BUlBmYzJzRlFMUXlRcHdlYVNRUWs4?=
 =?utf-8?B?T1o4VEVuK2JJTUQzSXhrTm5kR3U3MzIxcHFYUDhhWGs2Z1ZPQ2lKZytUN25i?=
 =?utf-8?B?czNtdmtRMEFDZTB3cVJIaFBJVG5rQUU5Y3RQZkFiVDhuUXBXSndocDR3RmQv?=
 =?utf-8?B?dFRvVndRVUJVbGIwOXpmbGUwbWZkVkV4MXUrWnpFYXErUnZUZit0UzBWdzVS?=
 =?utf-8?Q?XAdfvQ5ZyUy6kyxGOmnFbLw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09C768CCB17EAA459802AC39A40ADA6D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8f4e59-6887-4dbd-afef-08dde163f61d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 10:09:20.2997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DQff0jw2ExBJ4YKme92Yf4qMeOwomOyBu+O2jKoWvsEw/7Nnot0+EYtBA/OY/BYAdJKcxpWp5cKsKfuIvBwNrCJrvgW5j3mX3MxmAAcNiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10344

SGkgSnVsaWVuLA0KDQpPbiAyMi4wOC4yNSAxMjozOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSBMZW9uaWQsDQo+IA0KPiBPbiAyMi8wOC8yMDI1IDEwOjA5LCBMZW9uaWQgS29tYXJpYW5za3lp
IHdyb3RlOg0KPiAgPiBUaGFuayB5b3UgZm9yIHlvdXIgY2xvc2UgcmV2aWV3Lj4+PiAtLS0NCj4+
Pj4gwqDCoCB4ZW4vYXJjaC9hcm0vZ2ljLXYzLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA5OSArKysr
KysrKysrKysrKysrKysrKysgDQo+Pj4+ICstLS0tLS0tLS0tLS0NCj4+Pj4gwqDCoCB4ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vaXJxLmggfMKgIDEgKw0KPj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdl
ZCwgNjcgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4+Pj4g
aW5kZXggY2QzZTFhY2Y3OS4uOGZkNzhhYmE0NCAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL2dpYy12My5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYw0KPj4+PiBAQCAt
NDQ1LDE3ICs0NDUsNjIgQEAgc3RhdGljIHZvaWQgZ2ljdjNfZHVtcF9zdGF0ZShjb25zdCBzdHJ1
Y3QgdmNwdSANCj4+Pj4gKnYpDQo+Pj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4+IMKgwqAgfQ0KPj4+
PiArc3RhdGljIHZvaWQgX19pb21lbSAqZ2V0X2FkZHJfYnlfb2Zmc2V0KHN0cnVjdCBpcnFfZGVz
YyAqaXJxZCwgdTMyDQo+Pj4+IG9mZnNldCkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBzd2l0Y2gg
KCBpcnFkLT5pcnEgKQ0KPj4+PiArwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoCBjYXNlIDAgLi4uIChO
Ul9HSUNfTE9DQUxfSVJRUyAtIDEpOg0KPj4+PiArwqDCoMKgwqDCoMKgwqAgc3dpdGNoICggb2Zm
c2V0ICkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2Ug
R0lDRF9JU0VOQUJMRVI6DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNFTkFCTEVS
Og0KPj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lTUEVORFI6DQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBjYXNlIEdJQ0RfSUNQRU5EUjoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lD
RF9JU0FDVElWRVI6DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSUNBQ1RJVkVSOg0K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0RfUkRJU1RfU0dJX0JBU0Ug
KyBvZmZzZXQpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lDRkdSOg0KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0RfUkRJU1RfU0dJX0JBU0UgKyBHSUNS
X0lDRkdSMSk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVBSSU9SSVRZUjoNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEX1JESVNUX1NHSV9CQVNFICsg
R0lDUl9JUFJJT1JJVFlSMCArIGlycWQtIA0KPj4+PiA+aXJxKTsNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRlZmF1bHQ6DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4+PiArwqDCoMKgIGNhc2UgTlJfR0lDX0xPQ0FMX0lSUVMgLi4u
IFNQSV9NQVhfSU5USUQ6DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKCBvZmZzZXQgKQ0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lT
RU5BQkxFUjoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0VOQUJMRVI6DQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBjYXNlIEdJQ0RfSVNQRU5EUjoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGNhc2UgR0lDRF9JQ1BFTkRSOg0KPj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBHSUNEX0lTQUNU
SVZFUjoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0FDVElWRVI6DQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAoR0lDRCArIG9mZnNldCArIChpcnFkLT5pcnEg
LyAzMikgKiA0KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JQ0ZHUjoNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChHSUNEICsgR0lDRF9JQ0ZHUiArIChpcnFk
LT5pcnEgLyAxNikgKiA0KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JUk9VVEVS
Og0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNEX0lST1VU
RVIgKyBpcnFkLT5pcnEgKiA4KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgR0lDRF9JUFJJ
T1JJVFlSOg0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKEdJQ0QgKyBHSUNE
X0lQUklPUklUWVIgKyBpcnFkLT5pcnEpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9DQo+Pj4+ICvCoMKgwqAgZGVmYXVsdDoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOw0K
Pj4+PiArwqDCoMKgIH0NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIC8qIFNvbWV0aGluZyB3ZW50IHdy
b25nLCB3ZSBzaG91bGRuJ3QgYmUgYWJsZSB0byByZWFjaCBoZXJlICovDQo+Pj4gwqAgPiArwqDC
oMKgIHBhbmljKCJJbnZhbGlkIG9mZnNldCAweCV4IGZvciBJUlEjJWQiLCBvZmZzZXQsIGlycWQt
PmlycSk7DQo+Pj4NCj4+PiAuLi4gSSBzdGlsbCBxdWl0ZSBjb25jZXJuZWQgYWJvdXQgdXNpbmcg
cGFuaWMgaGVyZS4gV2UgbmVlZCB0byB0cnkgdG8NCj4+PiBoYW5kbGUgdGhlIGVycm9yIG1vcmUg
Z3JhY2VmdWxseSBpbiBwcm9kdWN0aW9uLg0KPj4+DQo+Pj4gQ2hlZXJzLA0KPj4+DQo+Pg0KPj4g
SSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyBhZ2FpbiwgYW5kIG1heWJlIGl0IHdvdWxkIGJlIGJl
dHRlciB0byBjaGFuZ2UNCj4+IHRoZSBwYW5pYyBpbnRvIHNpbXBseSBwcmludGluZyBhbiBlcnJv
ciB1c2luZyBwcmludGsoWEVOTE9HX0dfRVJSIC4uLikNCj4+IGFuZCBhZGRpbmcgcHJvcGVyIGNo
ZWNrcyB0byBlbnN1cmUgdGhlIHJldHVybiB2YWx1ZSBpcyBub3QgTlVMTCBpbiB0aGUNCj4+IGNh
bGxlcnMuDQo+IA0KPiBHaXZlbiB0aGUgZXJyb3IgaXMgbm90IG1lYW50IHRvIGhhcHBlbiwgYWZ0
ZXIgdGhlIHByaW50aygpIEkgd291bGQgYWRkIA0KPiBhbiBBU1NFUlRfVU5SRUFDSEFCTEUoKSBz
byB3ZSBjYW4gY2F0Y2ggaXNzdWUgaW4gREVCVUcgYnVpbGQgbW9yZSBlYXNpbHkuDQo+IA0KDQpP
a2F5LCBzbyBJIHdpbGwgY2hhbmdlIHRoZSBwYW5pYyB0byBwcmludGsgKyBBU1NFUlRfVU5SRUFD
SEFCTEUoKSBpbiBWMy4gDQpUaGFuayB5b3UuDQoNCj4+IEFsc28sIGluIHRoZSBjYXNlIG9mIGdp
Y3YzX3BlZWtfaXJxLCB3aGljaCBtdXN0IHJldHVybiBhIGJvb2xlYW4gdmFsdWUNCj4+IChkdWUg
dG8gdGhlIGdlbmVyaWMgQVBJIGZvciBnaWN2M19yZWFkX3BlbmRpbmdfc3RhdGUpLCB3ZSBjb3Vs
ZCByZXR1cm4NCj4+IGZhbHNlIHdpdGggYW4gYWRkaXRpb25hbCB3YXJuaW5nIG1lc3NhZ2UgdGhh
dCB3ZSBhcmUgdW5hYmxlIHRvIHJlYWQgdGhlDQo+PiBhY3R1YWwgdmFsdWUgZHVlIHRvIGluY29y
cmVjdCBwYXJhbWV0ZXJzOyB0aGVyZWZvcmUsIHdlIHJldHVybiBmYWxzZS4NCj4+IFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0IHRoaXMgYXBwcm9hY2g/DQo+IA0KPiBJdCBtYWtlcyBzZW5zZSB0byBy
ZWFkIGZhbHNlIGFzIHRoZSBpbnRlcnJ1cHQgdGVjaG5pY2FsbHkgZG9lc24ndCBleGlzdC4gDQo+
IEJ1dCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBhZGQgYW4gZXh0cmEgd2FybmluZy4gVGhlIG9u
ZSBpbiANCj4gZ2V0X2FkZHJfYnlfb2Zmc2V0KCkgc2hvdWxkIGJlIHN1ZmZpY2llbnQuDQo+IA0K
PiBDaGVlcnMsDQo+IA0KDQpVbmRlcnN0b29kLCB0aGFuayB5b3UgYWdhaW4uDQoNCkJlc3QgcmVn
YXJkcywNCkxlb25pZA0K

