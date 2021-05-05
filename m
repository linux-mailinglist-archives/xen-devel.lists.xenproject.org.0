Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2B3736DC
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 11:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122938.231934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leDdm-0008V6-Ij; Wed, 05 May 2021 09:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122938.231934; Wed, 05 May 2021 09:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leDdm-0008Rp-Fd; Wed, 05 May 2021 09:16:22 +0000
Received: by outflank-mailman (input) for mailman id 122938;
 Wed, 05 May 2021 09:16:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leDdk-0008Rj-Ah
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 09:16:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b102be3-8686-4b06-bf93-d983d096eade;
 Wed, 05 May 2021 09:16:18 +0000 (UTC)
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
X-Inumbo-ID: 6b102be3-8686-4b06-bf93-d983d096eade
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620206178;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HLUPrNUUw1lPse9vW7Mh371NOJtc/27AFoO2jahLfKg=;
  b=LIfnJgt6ALbD/wbK7yDPn9oWQsmGu4iqz80JxrmfDfGCDjBfbBUYxwx9
   4vdOJzc0JOfvkaMeVywVf01AYK1z65p3pplpJhl9z6V/XlIM26lcOJ1NM
   ura6+mTx9IuOW9WdylXOUBuwAHWeR2bYx93XUegSKehTcVFeLua5LLEyB
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iP/ZWPTKv0jJrjmGJ+n5zNfk7QT56JvPS+jm3LnlTic9CT7JbdEEg+S7MOA9CSckSbmTIWb6Fs
 H9SpHTBy0LW0nE3azCaAgL3mWKA6aRoSMfhG5NFu/OhKfaZRhaVs7xLzqkEMkJ7h0a3g+KWgdw
 th3166COomKVzGodGkVQ1sBvZQfibPQTuujuzhhp8VxypAT6Z7BAYd8lban/XtGkhScyPV6GOq
 0rgkMRW//T+4sRG/Jd6lnjMQ5L/3Vmqy1RgsVZ8y99g+SkBCo4n7h2mw/c24zPw+u9C4hcyfhh
 7Fc=
X-SBRS: 5.1
X-MesageID: 42902628
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nULHL6GEWUXqdQwKpLqFWJTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYfNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nFPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmWl9z0ZVC5CxqpnzH
 jdn2XCl96emtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c6DqAS59mX9S5zVUIicGprG0nid
 zd5yonVv4Dl0/5WkGQjV/T1xL70DAogkWSuWOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGH9tR/w6NTSWxZhmlDcmwtbrccpg2FCSoxbUbdNrOUkjTJoOa0dFyH34p1PKp
 gJMOjg4p9tADenRkGclGxuzNuwZ280DxeLT2MT0/blrQR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIZ5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdQPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMBIbDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEfE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhGU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+kLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTaRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC90FJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAahjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXDWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxagVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 r4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PYRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4ulHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBdlblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGIBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+kPzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789sN4sAZUBXYlM78nJs4aercJDREhyjc4h4jRCHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI6PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wNSWUgKuJZijcji4Ur0i+9DozPy3hV7Gd20HVAjV7i2o+v/WHBO1pJWDep26lrYQ==
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="42902628"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBepOm+DekX9tVmLPZIw/855zo9N3extc8/fI9wYDa7jul45Fgl7+o0Htt4FeQBCHRygW3+od1CY9yXT1WC6tXz7B+e14US3w5fBgpU9Y4m/emS/eMa3WFSOOOQ0xqK84TAZG9RFiGUQetG6tsZWhRmoaNUQMMvfLhonuYt+DMhkV48HebMxk8v0LhmY6ECO67L8Kw33Wp0tNqjFNrIsYQ1DjrpDI2e1sd4y1pZR26LNiv006vsGWSQ1LU0VwfUGHQeDkHuq6E9clZBsYFUo3HU/iuG8N/R49E8S9VtXunzb8OP1StlpHu34gB6fbb8U7iPwkvTZ61fFa4wI/kwgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKHhj6j9usx28MOesGH7ZYw6c5IjxCdUm47/6L3H3Bc=;
 b=D+G56WWaYtZS4avfJGrd16ddOrQkkN1INzmXMG4F3DrCFUbFvJsfiJRc925WtSZbVYo5LpspL2SdCH0WA8J3gTeQ7vvFVj1XfUmIMzARg434lSCfodnsi5aKx3TJp9GWV1tLh4MEkzsbiX3kqHmZ16qicQRJ8B7uDkbruWd1t+wQYj6LctuinbBXRVwZl5S3cTCHycnvMZmOY0HN0anq4c7F5aXZut7liF6BEwQVNv68kzETESd2Zu8Mmnr7WQcD9KBqCHH39PCoSOkQkNuW5YRuDcIOlxmHRffhVhNYLn0gx/Y4hObX8D66uvbvm6+7adwJuZZZMvyanFZn3n4EVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKHhj6j9usx28MOesGH7ZYw6c5IjxCdUm47/6L3H3Bc=;
 b=ubwzAeDZaaEiozCaB3ICaXYXO9ASufvPT8eAyNq2OmnV9n3qFCvPdx1X8U5u0y8fIivz4iMCEz+8fCdzz2kfIoM32xUt+CHr+KYvKIMgaVmVsXd+Q5Fg5uCqpX8DqlB899SZqh9y8MFNyMC1DZ65be3lMybo+7e4mExHlPbN5KU=
Date: Wed, 5 May 2021 11:16:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/guest: Don't hide the indirection on xc_cpu_policy_t
Message-ID: <YJJiWLqGoHLSnj01@Air-de-Roger>
References: <20210504185322.19306-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210504185322.19306-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68b17c64-28d7-4c9d-7741-08d90fa66ee3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB43007F259EB53544CC14FCCE8F599@DM6PR03MB4300.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QzC9gI8pHhBr3JJxgAQAKgVpyOGj0WEdguF42IIumt9+TsLRW+V2GLHl2xH0S/SXXJsa1m+0WoSwmtVhI7NaErsszEVY02o27DGqs7nXWkdmznphdxAXg1YH+8eItwMHm8NwzvHaFJ/8KpLT4/61xp6Ef0E9zqcxHY73xa5Kilu4tKYohwgsU0SEAg55tP75RmK5Z6sTaGAfDL/Anav34Vx/a6hlUS6vDSe+NwjwJ5RBiG/MOGEzPfQgpluueJcEHvf+81eWV09DlOTNjfTCRbGNiJ5LUxptrt+2ugOKitUNFDEGBmY/vPNXujOj3S1jxVIcRC/zgOivvooVLN9fFmbXoQNarzUD4SRgYhmH/LkSHbcwCqiMe61NWongS66EzIP4IQR7cdj2YGz4eODm1hge7qlQcHaD0RNVR0ME9g02vVGg6DeQRgqBuXnA/CmvqDJ9AwWMq+Mo1+cFORnbt428FENXTB4ltHATQvMPweZxWif4PkQbnkF5cNZD8/s1+J4ynZta7xOz6IQzTpHhd2ct9Cw0VIToZjK3dWVDgLw5MM3bI91O5rUBaUeI06KfG4D4bgRGXjJ5dvh6fyzbEmBk6oNzdWguJmm3iyOJo0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(2906002)(6636002)(6666004)(26005)(956004)(16526019)(186003)(85182001)(33716001)(66556008)(9686003)(86362001)(66946007)(5660300002)(478600001)(316002)(38100700002)(4326008)(66476007)(8676002)(6862004)(6486002)(8936002)(6496006)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUMyOGhhWVVLclMxMTIzTzd4cWMrUXdYVS9zNFdNSzBMa1Z2UkZhei81WnNR?=
 =?utf-8?B?QzZic0l3eW5pMXhkY2Ywd1R6UU9EV2d0UkMzdFM3VXpjTWFzdDF4ZUJ2Z3Iv?=
 =?utf-8?B?OEF1WnRJQnVrcktTa0R0ekJjSTZZOXVWbEdtNDlieWxmMkt0WHBNNFh4Qm1F?=
 =?utf-8?B?RDUzVDZTYSt2UUxXalBnUkVSM2pQL0lIOTVhSzAxWkRoaGwrR054VEFDV1Nm?=
 =?utf-8?B?WDI4dTNySFFjMmtON1Awa01RR04reGFFbkpETXRjNEZNc1Nla1ZMeFVYS2ZI?=
 =?utf-8?B?Q3Z2Q3E1c1Z0TjczektWTEtTZ0luRmNmQ1ZESm1oZXJGSUdiNitEaHAzWUdJ?=
 =?utf-8?B?NFV5cDJDcEJHNjZudCtUZXYrcHVBbEZYZ2RicjJxY0pTSmwrM2VGMUIrM3RN?=
 =?utf-8?B?YzFKQTFDYnY0b1VtRGQ3ZG00R3ZOTmJtUGRycUNCU0hDNFR3R3FieU9IQmhs?=
 =?utf-8?B?RDI0UU8rR29tbW82QU1TRU03MUJBcUdqREd2SWdOSS8wclFrSGk5Q0wvaGl4?=
 =?utf-8?B?SHVjaHBkT3ZmYVdkdkM2Q2JZamxIT0lqVE45WWNNaTdQME1WdFpWZkI0NTZN?=
 =?utf-8?B?Q3pTRzJTTlM3aW5LTzJSbGEwYm1ucHoyZE92Q00xbkZSOGV3V3ExMDZKb0gw?=
 =?utf-8?B?U25tb0UrUEU4TXlmYm1rN25EUG1ZaW1qcnRIeU50L2M5OVJiRy9jNVl4cWhu?=
 =?utf-8?B?d3EyeXRubDRudU5JN0NVV2FzUUF1VTFwdlRsMlZtVEFJYU1KTlNKZmN4djNV?=
 =?utf-8?B?TnR6aFZOeUYvemt3Kzl5NmdQdWJhR2xwWDlOQldNaTU0WlBXcmd2Mnd1UUVy?=
 =?utf-8?B?ci9XRGs1a1lMb050dmEwK3o5MXVGS1lGN25MOHU4TFJtdy84a0tVZFY0S2Zi?=
 =?utf-8?B?RkJOMkpWdE5VTjZqRGtTQ0RTQmkvWThvL2YrVGc0VDRWM3l4VEpPRllzMDBV?=
 =?utf-8?B?Y3Q2OU1Lb2hnWk9CYUpsazlXdkJySlpaSzR2cnoxN2VaVU8yUmxjYmdXc1Q4?=
 =?utf-8?B?RTBDS0tuZHUrZmlKZkpYeUY3eGpWNDZZZEhjY08zTjJ6THgvVmJFRm14anBZ?=
 =?utf-8?B?OTV1Y0llTmo4dlFUTHhIQk9qQ1N3cStJVG1SSHF5VXBtOUMzeVErNjF6QVhw?=
 =?utf-8?B?TC84c0tLR2crRkRwajRnamIxLzRKZ1lyQU1ZUEltWkMzNm9NWnVYbEhBczJi?=
 =?utf-8?B?S09ERlF5b2FjTkZIUXBIcDNSKzkvSkJOVEs1ZHVIdkZpRFVNanltd0dEbExI?=
 =?utf-8?B?QnZUOE41N2hKc2FsdWRGbE53TmlQaDVmSy9iL1RaSXVaNEk5Rk5UOWVNZm1K?=
 =?utf-8?B?VTNwOStaM1dQRy9Bays2ZENHVWJ4d3p2dHhyTkI4UjFiQ2N0ZG1hV3JQS25r?=
 =?utf-8?B?NHlDcGd4YTd1bC9xeVN1RmcweVV0Yk9TWklGaDdVL09QeC8zSllqNDVxVkd3?=
 =?utf-8?B?MzQ3UnZXNzNWTWRtNStkKy9DK0VydEdGZkxUaFpoWERaK1hpdGkweUc5UVlI?=
 =?utf-8?B?ZGU4a2ZBWk44WUQwQmpteStxNG1sL3V1cDdqRnZTTC82MEtrQXdWODdxaldD?=
 =?utf-8?B?VTRZV1VBMnp1bWtTMnpUQVJjWDUvRW5WOFExa3pqU3BGUHVKTW5GaFZRb0Rr?=
 =?utf-8?B?dnc0YStpcFUxNkZBNkdKVmV1cU1KemZIWXlKeTVGdVVweWY4YWU4QjlObTdl?=
 =?utf-8?B?bnV5bStKRVpHZ1RqZGZ0TWFqS01GMGVwKzhEd1kzQ0VRR1h3djg2N2FheUgz?=
 =?utf-8?Q?QKmt+FngPhb8wcPVMpMJ5lgTU2ekNp0ERbccKzg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b17c64-28d7-4c9d-7741-08d90fa66ee3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 09:16:15.1234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dmkTG2dALY/Xw/IIHivVdZ9tPTXrHocsnjUIXeRwr5oGzWykgMdGQ0TsfO2yZMNiVO4PmRHd7vWqLfA6tSyoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4300
X-OriginatorOrg: citrix.com

On Tue, May 04, 2021 at 07:53:22PM +0100, Andrew Cooper wrote:
> It is bad form in C, perhaps best demonstrated by trying to read
> xc_cpu_policy_destroy(), and causes const qualification to have
> less-than-obvious behaviour (the hidden pointer becomes const, not the thing
> it points at).

Would this also affect cpuid_leaf_buffer_t and msr_entry_buffer_t
which hide an array behind a typedef?

> xc_cpu_policy_set_domain() needs to drop its (now normal) const qualification,
> as the policy object is modified by the serialisation operation.
> 
> This also shows up a problem with the x86_cpu_policies_are_compatible(), where
> the intermediate pointers are non-const.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> Discovered while trying to start the integration into XenServer.  This wants
> fixing ASAP, before futher uses get added.
> 
> Unsure what to do about x86_cpu_policies_are_compatible().  It would be nice
> to have xc_cpu_policy_is_compatible() sensibly const'd, but maybe that means
> we need a struct const_cpu_policy and that smells like it is spiralling out of
> control.

Not sure TBH, I cannot think of any alternative right now, but
introducing a const_cpu_policy feels kind of code duplication.

Thanks, Roger.

