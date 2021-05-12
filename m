Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546437C6AE
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 17:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126309.237784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgr9I-0005QW-E7; Wed, 12 May 2021 15:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126309.237784; Wed, 12 May 2021 15:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgr9I-0005N4-Ai; Wed, 12 May 2021 15:51:48 +0000
Received: by outflank-mailman (input) for mailman id 126309;
 Wed, 12 May 2021 15:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XikZ=KH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgr9G-0005My-OG
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 15:51:46 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d972e5f-f83f-4e9b-8223-ac5c5129d1d8;
 Wed, 12 May 2021 15:51:45 +0000 (UTC)
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
X-Inumbo-ID: 1d972e5f-f83f-4e9b-8223-ac5c5129d1d8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620834705;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CbionX3ENd9syjU5+XDv3gDrWj42CrUz0zGawsll0mw=;
  b=G0u+cPVjdcf4m/PLASX1/1pk8K4GUSX94AL+fH3zRD7JeA6ww5R3uYQk
   sYZ9Wi7K6XOlS3g7bo2gGbXSXfKHz7/r8DFMMeRZRAap6BlFOkdOeNSj/
   bhxC33HyC/0MdhfyQsWIathoSxtY5nKXbTh84t/Emgm/7e3/1VOLHwRQC
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fMZ4zihJxHNtCGDeMHQlrvAfLlZDYI+A2SIy1jUj9B1/r/JmWa8ujted9M5KVQtASrifIltp9Z
 wN3ExXNhiH4LBayJlSEetRwaXy5LXWUgHpEeyQvS3aPUemqGb+bk5W3abcUGQ+PdzWcJJ/7sFP
 GfPhBKZpOmyTOqU0mLhDP6aKC1W7ahjRvfCSSAi5POtfN5Jvy5LJ3nZFNdfifHpVlYVXNYlRRm
 WiY+bG7qE6wjCNghCMUxPGi86hOd/H0cVb2VJV9FD4a17etb3iWan6KNhYIE2936sCB5xqtAYm
 mQc=
X-SBRS: 5.1
X-MesageID: 43755503
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DhscrKwVN42kd96BfxlzKrPxD+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE80hqQFnbX5XI3SEDUO3VHHEGgM1/qa/9SNIVycygcZ79
 YbT0EcMqy+MbEZt7eD3ODQKb9Jq7PnkJxAx92utEuFJTsaMp2IhD0JbjpzZ3cGIjWucqBJc6
 Z0iPA3xQaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnX4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlVFtyssHfpWG1SYczBgNkHmpDr1L/sqq
 iJn/4UBbUx15oWRBDznfKi4Xin7N9k0Q6c9bbRuwqcnSW+fkNjNyMJv/MpTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv/nZMOq59as5Vka/pUVFaRl/1pwKpfKuZMIMs70vFvLA
 BKNrCp2B97SyLpU5nphBgY/DX3ZAVBIv6veDl2hiW66UknoExE
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="43755503"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaGFIUzeB7EhopnIoPcjx3KV5+NMgyfUvAUVnXr2Zy+C0HbUIdTZBAHk3MELm8TcwWifSgxYl1/OBGmfw1rZ+qwR7GR9nvWJijvhEbh/23ptuw7PrrXK4Qb+2RX8oLp7CuB7b4lswYp7c/eyfPGA2+D2wUBL0IdojqHB0r0jdula27Tl0WH19kQxoG9/hPZTo/FXg8wULQnDO72bEAncN7ngxabu599IqNDQZKy1LBz9GwOba8SZ3kfxUcXidnE7t8Y5h7kYQ/FQudRdlDhNobNolSwuozeasPg5YYCPsjGw8rGzs0ew/y56HXQGqe802/1Ipb864lKd04TeFEsvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbionX3ENd9syjU5+XDv3gDrWj42CrUz0zGawsll0mw=;
 b=gdXbHoMiUOT5Mg9gnNTAqwTFui1NYIIWMakvgq77LHkRtg9JwSNJciuYgdgYoPhshoUwWsimtG08YUZZyrtjSOz5fIuWT24VpZqs+pEQAhYRBh9KqPoDzBkbC5AL4Ak1Z5xzhAFoRAaC74Kp6011g7v730lXZse3Cz0WYIRpaQe6uWElkqFdMjPzFu1dE6/tVh+PY2sav3h5cYszSftPGmwGHO7IRPr6Vf2axG3Jy6GO71dTnohf2eRPEQQ0KIg9JUtglnRxrOykZFjTrBZjKyYpO40oZERoMLXWd2kqCwkTlw8Pd1WPatKofYP8JV+tnwuwve5I3xrxq9B5opRlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbionX3ENd9syjU5+XDv3gDrWj42CrUz0zGawsll0mw=;
 b=vaulAe5/T4ZodAUAVtXciecJMbvlpXFQbsiBZz4fmt2lniDB45j6H7gWQai+18d3k9ZUNN60gT2XEyfs7CCxqbGHDBiN/MIk07UQawnaA4N139EVb1BPaq4ljbx7pDzfeMkrnPt/Y7rOauxytgQwAe0ORcP0fiF31R7bENVXUxw=
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210506151631.1227-1-olaf@aepfle.de>
 <a236f079-1771-7808-bb16-97b9dc5ed733@citrix.com>
 <fe7ccfe8-967e-ed12-5804-590fd9663608@citrix.com>
 <20210512170759.15c7a3cf.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools: remove unused sysconfig variable
 XENSTORED_ROOTDIR
Message-ID: <fd9a2bbb-09e4-468b-f718-47e149acf011@citrix.com>
Date: Wed, 12 May 2021 16:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512170759.15c7a3cf.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9aeba5f-02ef-4640-a3c9-08d9155a1b7b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4422:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4422153ADD7471388ECA84C6BA529@BYAPR03MB4422.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ib/vAYR9tpplH1Zgk1nOZu4f9ztOUMtFGjFrwTWE0aiW5PpW4Nsf4hPK3vlPgTCETNCphq4tfWSBREoirGMMe5J3UeXzX+xpbHTKt2IQNwyj72Incc6QMDVruyrVNGOcK8/w2B0z4S1V4YObl96xHrNRXiF/M4RddJYlSP4PbpTPBfx7KsrebvYWHqXgQos1oZnWGveDSfvNeeLDDwtyPozzVjJk8itYSj6I4QxWTi1A3qx5yk/Cjaq9AVBqfyHWxHpkf+Sr0O9DiqVzH7ZIF+LTbSc0McqZo6URVngz/yHTVrtXu+/UBC8js9EmWpGPRWA7/S7PpkkJMbVuaMJddmuEjygzKOD2cTOEn2QAa2M1NnyCHpyRuhefWiABViN7aYIXSUjjI9N0xarE1+fnzgq0qliYdzNEnQNPL7cV4K9HFPURIX6KR3l4OH3zK23lDI8uaES5e80/qkf34eeG4D90bEFFvns2EXNTojVqu3Gt39LJGCnOm+0iZZkhW9qEmZWPMv2IRxY+6FaxbpBcMhcS8YCwuft8SaiOjaNWgsxYCngQYFsiE994GBAfiNgBpZEsO+fcmlsPv5BX7VUyHaWvbrg+bLr0eFQY4r644DAq64wzgs0hg9i3iS0MWk8wpK5l2+wgJVUiHT3f/tWfWK1vlBWuDs2+OqRms4EZB6HcaIbE04FhyWxofOkIYSBk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39850400004)(376002)(136003)(5660300002)(2906002)(6486002)(6666004)(66556008)(66946007)(54906003)(16576012)(186003)(316002)(38100700002)(4744005)(2616005)(66476007)(16526019)(53546011)(26005)(31686004)(956004)(86362001)(8936002)(478600001)(8676002)(36756003)(31696002)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?DaV64ODF3+YEcCnhoby8dyDCef6T/s4yORVSGRwTPN8yXCeW7ZwSkXGQ?=
 =?Windows-1252?Q?RLxNXifGDcSt+AOPYuIKtOy23WjNygq+6wSV00Xkl+RkdMX77cOhsKI6?=
 =?Windows-1252?Q?ht7xp0RwOqjQEq/rEh74kqk7+r2G3VQUkyeFmdXukoYXIbUoyrCJ5C8U?=
 =?Windows-1252?Q?3FkzmYGSQRbUPxqZPITVxU1etyXO89c3hZbvKLgrgDk0yWF8VnIzSDsX?=
 =?Windows-1252?Q?97vRNQ3Kh3vXGUiN/3v5HrAzzZ1Xr8aeseFQQthaZrAZ88SELtsfsin0?=
 =?Windows-1252?Q?Am35xa5uxUAsB4V425y06N9nnunkYhjFm307/TtQdfTuZbVC9VJ7dmz1?=
 =?Windows-1252?Q?LfErVs3xpRlYh5EGO7vC7Ru+wrkDQRbNQFY4qoEFTBUyneZoaFIyc0Cp?=
 =?Windows-1252?Q?M0Gs/K6iQ/jVwC8veInBBUhi/ZvIvD6XCO7w9QA6wiS/lokN/dP/a6rU?=
 =?Windows-1252?Q?4sruiS0UlIIeU5SPpkUWFcj5fsGyJKdqCpwE/ymUXchBWR28nYpFTGlm?=
 =?Windows-1252?Q?r6V6v/0pFCUQzsy1q79jwgI76IRwBd48utdkeA2vhQ4J7AMFuW0Oqwkx?=
 =?Windows-1252?Q?ttpzBwyeVRLZ50tHIPfzxNBCo8uE33eKxOsGIoveR4Syd6sVmve3+vuJ?=
 =?Windows-1252?Q?murimvvJgj302EJVcdA3G1rkVfr8+1on22JTb1puaIYM0h3BGQcpkhfT?=
 =?Windows-1252?Q?RxOTxR2m3aqqKGsu2B8HyFWlbT9PCS8gUrYU4rTRzApksosL3wORe20q?=
 =?Windows-1252?Q?xKrt9JlQ6oDiqrijhHpSAyhyFAPbwTaudSyQkOPFAWZWssvLmiua8C2G?=
 =?Windows-1252?Q?xVrMdbN7wV454QThux/M1nydqhKlvUe+zusRftc2ppY6jBgjffuNFD0/?=
 =?Windows-1252?Q?AGXrLGjJQagwteDQ6e5mkhw9ViucMSB2x6sezZeoDUnMfOzY+4nKO9Cc?=
 =?Windows-1252?Q?jkY4CZpOgcbk32V9N2IayMgcV/O8vyiZHfq+O/D8zf2ySw/m0UNCWsaw?=
 =?Windows-1252?Q?Fueq2czgwipqBRSTN7JMawmvBgEDzr79QJo6ufCiCms27Pomwd1nAgHq?=
 =?Windows-1252?Q?YXoiUzysFF/OnlXxu+T9CEunGIwsH5I16tWqYPdlfegC/OrgsDGsreAM?=
 =?Windows-1252?Q?KTbJ/7xtvKO0IlZblUy6RBvXQDYAp+gMs74O9BG5wnU/cjeBcfg419XG?=
 =?Windows-1252?Q?ej8bB7TlZTyVEPnZsLIgeOxjqgrqrc5mursrCM79Hce3LFaYPQ4jyJlY?=
 =?Windows-1252?Q?7ZJCMY1Mkf4Ijn7q3++93ItFN9SAGA04EgFc6R0L4ipWKZlIQinUEk+r?=
 =?Windows-1252?Q?S7FLaKPuIP8D8dY+LeKEb98NYCWKsC3jLlVuTo/i6S78RPqe2EgMckOi?=
 =?Windows-1252?Q?Ee7FUdtR0YVKNUCYMumE+8McNKwOKOqFDMCMDWzkV+VFJxPvGTBJOyir?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9aeba5f-02ef-4640-a3c9-08d9155a1b7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 15:25:00.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uuIJDLjZwBmU1g1LzsZ88zM+c6ezzOrm0LU3BA/guW/f5HRJ8VkbGo8eWULE9yRDMlt7+fvcaB785uoca0i/pI7UHRTIMWipfhyTK38Clg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4422
X-OriginatorOrg: citrix.com

On 12/05/2021 16:07, Olaf Hering wrote:
> Am Wed, 12 May 2021 15:52:16 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Olaf: View on the above?
> I'm fine with the additional CHANGELOG.md change.
> I thought the suggested addition is obvious.

Thanks, but as I'm folding it into your patch, I shouldn't do it
unilaterally without someone else saying ok.

As it happens, Wei offered his A-by on IRC for the change, so I'll go
ahead as suggested.

~Andrew


