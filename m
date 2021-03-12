Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F106D338B62
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97024.184128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfpD-0005NC-LH; Fri, 12 Mar 2021 11:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97024.184128; Fri, 12 Mar 2021 11:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfpD-0005Mn-Hm; Fri, 12 Mar 2021 11:19:23 +0000
Received: by outflank-mailman (input) for mailman id 97024;
 Fri, 12 Mar 2021 11:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc+n=IK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKfpC-0005Mi-MI
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:19:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ec404c7-bc35-4d43-8008-9fca1445dfb8;
 Fri, 12 Mar 2021 11:19:21 +0000 (UTC)
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
X-Inumbo-ID: 7ec404c7-bc35-4d43-8008-9fca1445dfb8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615547961;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dTYqEk3VcqDeq2SWk/2UwSmLiF8lTBLnOqOhkCxoKCk=;
  b=VMaIQwiPij18eKsAjp7oqpDUfrZ+Y+T74/uJi0Xbf5d06JrL+2DDNvqv
   EwEUIMWtILmfx9O95Ju8qvBP3riwfOf1LMWfdj/2FxoHOjTosKykZOOeO
   EfeoqDoi6GaPTbhJyqei1iF156lYb1lmMR9klb3w3hHO31ow7pLfo4aOj
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4+NG2FJo25fSEZkfJPvmwi5mBcct4zYoYhUQe3L2f+ZXjVC2b5JIt2AhgEFbFQAN+I6yn3l7UM
 uBljtcOqYQLUFjHaC1tZ4kP1E8wraQTGcXTDNFP6LsdwVBp3rWl29pWO3G6dFdgxymZfdWRRL0
 JvRDv+ldeTHUvFxzDYkkPvqULyWsX3riTSe8or+LLoJVZsLghGFb3WajetrCnE1KZ5DWvcwy+o
 Ao8rolI6JOGXQC1I9wn+9UpT9waxfl24dv/IqrGo2RXW6++xPOYwiOqEPMWZf8gcREj5jArgHP
 AoE=
X-SBRS: 5.2
X-MesageID: 39049908
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GdfvGqpZq+gYGF5Uk6jmpzsaV5uEKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYylLbSNBAoc0E4
 fZw8JBqSapd3h/VLXEOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLooSs2eTVJ3Lsk7C
 z5gxX0j5/Tz82T5z398yvo75pQkMb80dcrPq2xo+UcNzmEsHfSWK1PQLuH1QpFxt2HyFFvq9
 XUpgdlAsIb0QKtQkiQgT/Anzbtyywv7XiK8y7rvVLGrdbiTDw3T+pt7LgpCifx0EYrsNFi3K
 8j5Qvw3PA7fHCw/lWI2/HyWx5njUayq3Y5+NRj6EB3aocCdKRX6bUW4UI9KuZyIAvB9IslHO
 NyZfusncp+TFXyVQG9gkBS2tC2Glw8EhCaK3JywPC94nx9mXB0yFYg38oPnnsM34JVceg128
 30dotvj71AVckQcOZUA/oAW9K+Dij3TQvLK3/6GyWoKIg3f1b277Ln6rQ84++nPLQO0ZsJgZ
 zEFHdVr3Q7dU7CAdCHtac7syzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+Jv+gfKtezYY
 fwBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH3qTv8PwLJHwvOCzSoeRGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH1z3fEjS+o9xDbj68+AfxJNlDPwJjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quUbEhl8ZfSZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+iLh97RMXGLR
 5Hqz1MiOSKBq3V4RpnJ8OsM2qcgXdWjmmNVY0glqqK4tqgXZ8kEJA8WuhUGR/QHxJ43SZmwV
 0zKDMsdwv6LHfDmK+lhJsbCKX0bN9nmjqmJsZStDb4rkWTpcYmQ1MBRD6wWcurgQIjLgAkw2
 FZwus6uv6tiDyvIWwwjKATK1tXclmaB7pAEUC4folOo6vqfwtxVG+OojSfh3gICzPX3nRXol
 akATyfePnNDFYYnnxDyK7l/Gl5cXinc1tqZmp3tpB8Emr6qm9+uNX7E5ab4i+0UB8v0+sdOD
 bKbX8pLgRiy8ue+TSVlDyBfE9Wi6kGD6j4NvAOYrvT0nSiJMm0jqkABeZT54sgHsvpqPU3Xe
 WWfBK1IDv0B/gy4RGcom8oNUBP2SEZuMKt/CegwHmz3XY5D/aXHU9vQKsDJcqAq0fjXPSF3f
 xC/JoIlNr1Fl+0TNGIyavaNWEebjzSpHO7VOEup9R/u7kouL56ApncVn/p2Rh8rWMDBfaxsH
 lbZqJxpI3lEMtIWec5fipC5FonlNiVNiIQw0bLK957WWtotmPROtOC3qHBprUuCHCQvQeYAy
 jpzwRtu9P+GxaZ3bEUC6gMMX1bRUg15nNl5v6DfeTreUyXXtAG2FqxKXmmdrBBDICDBLULtx
 5/iuv409O/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJPeJT6dS1NRCthaStifTDwwvfeH+ea04Cg5
 dCelFVRsNfiiM6hIly6xOMcMXM0wkYumobxypmmF7r0pWn52mePXguC3ypvrxmGR9JMnaJis
 zZ9/O/z3qV2kkf5aX+
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39049908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFZKjlWB62NLb1MMQ8cuC1M47I9WTgPxkZ9UspxRvFsBsNgAk8ZMF81mZohjBXly16TCfFZFNWNpKWd5RdNUXsLQDbKWzurRhyQn+ChwnQw0EpW5zx6wovDvAUAlB55e6qwsE54/IYtRomR4oA+bvdJ0vrq91uxBaxrQAWz/vU0prSjYSb3pGt8IXS5jHQTHdAgVCqp7Ek0Bl3g1vfy1PR27wYsavMQ/iCIxEydRk13z2o4HdBPia7FrEHgdFPGuwA8zaDSMgrXaFKcybjra5R0IvNUT8qyzlXuGWrzKTHMmEZZ1hP/lTqTaIr+dplb5BTcfEJTV0GJHxUOKbaWB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTYqEk3VcqDeq2SWk/2UwSmLiF8lTBLnOqOhkCxoKCk=;
 b=iaCOx8afvNaJlEBcUo5xXxsWstJyK4rZhyLjDsEdYt0yjX/Q0upSH75cmX5h/ASeYP0mJ4RnLzoyO4eR9dXrAI8d9qM/YnEcEiT0H9yUIyLSMVT4tpgezzajoyK/3gvGoua1262FlZkyh93S40R1q0vSZ33wT4FXNOiQsrcWZfAUzlp2lalS1hw8zwljZbdB6mWqWE5DYb6+IY7DCbzIL7eYnpZ6jMbWA+s8FuuA99NvKPvGPulF1SHTBbeuyX3hpItJVFXwWbyX8QVXWNDObCE7cv/0KqiEEAF0LlKFmhsxZ2vk5eh4pq9BQDHs9X/0ktis8+5hqUpuEKQDb1kP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTYqEk3VcqDeq2SWk/2UwSmLiF8lTBLnOqOhkCxoKCk=;
 b=rSfZZAc6qJytVomFQ2gHGfnydDhp3+jy2TOJ/gGMYWY8NhOCkjd+o/1lR4iHgd2fbDnBjfFzb8OnsMwiP65jsR1kpHUDBskjMfHRB5Hucl3u5wPjTdsIzNEIeY+PHi6EW7wxZknUd+vKm8esGsTA5GuhMfiRzFpFuulDukMSaq8=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
 <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
Message-ID: <7504b027-f106-33e1-214a-eecf8ea5ff5d@citrix.com>
Date: Fri, 12 Mar 2021 11:19:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251b9866-2791-4578-0ae3-08d8e548ad02
X-MS-TrafficTypeDiagnostic: BN7PR03MB4388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB43887083980DA1B6F25B3BEEBA6F9@BN7PR03MB4388.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0pXRgxHWifPI4ETEzK2kyMQA9FAaEQKU/Sts8OHSNCABGTNivvkrxpsHKgIK+B5CIZ5ABfp7D4H8aH1zmanefHwAHAQLkzA+bQAvkx+tTz+c0oc1IbmBkQmcWO1NzqwbrULBFz8qv+kmrCyMVWSWyvk50izDyaaOdOwkBxK2NuJqfTSVNgN4hFRPQ2R9bUwPojNFsaD7zL+gvkaW+kuBneXeSJFlkSCq5OHTLXhxv2BM65mMGdf1Pzz8siNRFeFIXCnwtR6mP7nQ1muL3Xq3Is7/YNBs3cWRs4NFNvCtSHAMsrKIx/Yu3r4g4VUWni2tY3dy5RdOdjpVdRpkbrETMJRdEDWw8JvvbQb/svmbuWfyPeTAvZAETTHyFUmr5GYleC9+GRoi0aImm7ZB+xOVgoHvsMtPVxgAaTv1lQwvA1YovwAoyROPKvRdy+MZEyvCNj7MTNzH9yCNupPxi+7vIeYGT+C76fO/mERhgy2AM4VRY191+beWLA566xabvHxGK1jma9x0kG1sq7TKgfH+U2Ma4r+7UNBditCXSJUhjy4Z2ZjUQcXtij+fSG6LKDKMHwmkCMOZE748/7wfWVFfzwbCrrUare0tkgqmxIDCZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(16576012)(66946007)(316002)(2616005)(26005)(66556008)(956004)(31686004)(66476007)(8936002)(86362001)(5660300002)(110136005)(8676002)(2906002)(186003)(53546011)(31696002)(6486002)(16526019)(6666004)(4326008)(36756003)(83380400001)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlppMEpaT2Y3OEZram1nbDhmYjJMT0NKTExvOGJLbTdtN2lGM1ZwMDlHSTNm?=
 =?utf-8?B?b20zdEJMV25nZUtJTHJXYzM4cXU0VzlCU1RJWGZHanhKbys3djhxOVl6cnVF?=
 =?utf-8?B?dTRSMVFVQVF5MVdvV0FmN1FNR2lVL2JmWkRIMkhTMVQzQ1c4WGRqSktFcGFp?=
 =?utf-8?B?TlZxUUdnRStSUWkxYTZSS25BcEhRSXRDZExMVlFyQW9Ed0ZISTVLK000Tm9h?=
 =?utf-8?B?aE1rV1ZBM2RvUGlIR09ka1poV2VUZ1E4NDVJV3hhQjBFdkRLNy80TkQ0LzNw?=
 =?utf-8?B?bmcrUlNUUS8ranN3c3REbElPd0xsN3poUkJOMW1qMzllK2EzUlFkT2EyL1NV?=
 =?utf-8?B?Q01VVXQzNEtsWWZNOENpdE5QeHBGYkZSclZsTXFZYjhhUVNnMXlKWFV1SzJq?=
 =?utf-8?B?WjErUUNaOFg4TnlqYnRKVFFLYU1nbFhFb2dDcmJ4b3FKTGVpdTl0L0hZdHFz?=
 =?utf-8?B?YkYyK21jUzIzS3V4aThVMk9tOXpaMUU4WitPNmJXazArQk1LbWRqWSt1aEF0?=
 =?utf-8?B?KytrMWVaL0UvNzFzZFhZb29WYUJrd05tNitxV3JoMnZpSUNVWDdWS1owVWJu?=
 =?utf-8?B?MDdZTCtnRU1qV1l3Z3NNYXNDckZYZWtwQzBkK2Zkcm5kaHhYQXZIeXdyTE51?=
 =?utf-8?B?NnZNRVg3a0h4ZldHYlFPUTFtSVdjSlR5Q1VtbnpiVHJnUUd1NG5OU29IK2s1?=
 =?utf-8?B?QnA2eVZTQmlxTUNNN0hDQjBaSzVVZmtpcDlkbE1sUHBUS1MzeGg1SUhOVDVS?=
 =?utf-8?B?QjVMcllqVVZCVVNVUzlqZVdRdGM1U3BreE1NajRaQ0tJamp3MUFBTE1JbFR3?=
 =?utf-8?B?c0xBeDIzYld4V1VIeklXUDRtVFdwNlA5alZtUFkwOUZqSmxxbUVJZjhFbUZS?=
 =?utf-8?B?eVo2cXJDdWFKSGxJR2pSRWVIek55VUVxZ0pDZ2JjOHd6UDFRQ1NTQlhvZ1hs?=
 =?utf-8?B?bXYrbWxONkgvRGFON0NlVUk2QndUc1JBNlhpczZIdUJFNW8xdmZIemk1UmZD?=
 =?utf-8?B?MDZFL2JxbE9KMnQ4ZVllYkxtRWF0T012NEh1RUpzV0dleDBLaHhFZEI3Ri9J?=
 =?utf-8?B?bkFJbDVIRG10bnhDV0Z6ZElNSmpQQmx1NXhZbThZeUtUeU5TZEFaNXY2S2Ns?=
 =?utf-8?B?L3B2NU04aEozUUdiTkl5RDR1eWd2ZmpEUml0czE0T3VROFpjTGJaVVdnNzZz?=
 =?utf-8?B?MnAyZEtyb3hsZ2U0dzI5OFJzdTNGN092cnFBTUJNOEhSN0JoWmcrUWltNitB?=
 =?utf-8?B?U3V0VExGdFhMVjNLNU5ZSXRFRXhrdjExSkM1OFltZzc5VkV1ZStJSzV5czdN?=
 =?utf-8?B?N1drejh3SCtIRXBoc1kveTFzWUpDV0VCTnRJTEN3Yjh2NjVmQW9Wbktmb09X?=
 =?utf-8?B?Wko0a1N0bFdTMzE0UWxmV21neUZpUVArWTRVMk5kd25acnhGL2owNTdqQ0FW?=
 =?utf-8?B?THBVU2pLVnRZS25pNVgrTGFZV2Y1c3NoS203THdSc1pKb2NIZ0ZCbERJcmJo?=
 =?utf-8?B?NS9HT0ZxYnNmK1pLZk5MV1VIMG84bXU5eEVuT3JNaVkrcnVoalAzak8yd2Zz?=
 =?utf-8?B?allqbktuZnNqVzJhRitzbDBrRGE4Qlk1NkNQYXh3bnBVd3c4ODh6THZ2TGk1?=
 =?utf-8?B?a0lENHBFTFBNcVhCb0NPbTJwRFRJdVlvL045azRFejNyQ09iZnhQQnRXTm5F?=
 =?utf-8?B?V0ZkTmJaRWQ0NUpQUXY1MGlEakNjSTVheXZML0tVN1NIQTlSZEFuWk1rbFZY?=
 =?utf-8?Q?Tj6Kd3IXKNsL4vmDzPunRaTQ4J54tScI7CpMX2e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 251b9866-2791-4578-0ae3-08d8e548ad02
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 11:19:17.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2UKPvgMy+NvhRRiJInE8LjEzqkzYIdfZK7yPW6QHfc5yndHraZhRGkNgyxCyUzgraRFDUvi/PP+vZ7qM0EYRunIJDTZRtUouC20f7B0BQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4388
X-OriginatorOrg: citrix.com

On 12/03/2021 07:54, Jan Beulich wrote:
> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
> handler early enough to cover for example the rdmsrl_safe() of
> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
> of MSR_K7_HWCR later in the same function). The respective change
> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
> backported to 4.14, but no further - presumably since it wasn't really
> easy because of other dependencies.
>
> Therefore, to prevent our change in the handling of guest MSR accesses
> to render PV Linux 4.13 and older unusable on at least AMD systems, make
> the raising of #GP on this paths conditional upon the guest having
> installed a handler, provided of course the MSR can be read in the first
> place (we would have raised #GP in that case even before). Producing
> zero for reads isn't necessarily correct and may trip code trying to
> detect presence of MSRs early, but since such detection logic won't work
> without a #GP handler anyway, this ought to be a fair workaround.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I am still of the firm belief that this is the wrong course of action.

It is deliberately papering over error handling bugs which, in the
NetBSD case, literally created memory corruption scenarios.=C2=A0 (Yes - th=
at
was a WRMSR not RDMSR, but the general point still stands, particularly
in light of your expectation to do the same to the WRMSR).

It is one thing to not realise that we have a trainwreck here.=C2=A0 Its
totally another to take wilful action to keep current and all future
guests broken in the same way.

The *only* case where it is acceptable to skip error handling is if the
VM admin has specifically signed their life away to say that they'll
accept the, now discovered, potential-memory-corrupion consequences.

Rogers patch already does this.

~Andrew


