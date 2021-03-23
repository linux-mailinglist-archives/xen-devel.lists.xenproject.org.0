Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA6345BA7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100588.191789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx0-0000mT-Cf; Tue, 23 Mar 2021 10:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100588.191789; Tue, 23 Mar 2021 10:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx0-0000lG-8a; Tue, 23 Mar 2021 10:07:50 +0000
Received: by outflank-mailman (input) for mailman id 100588;
 Tue, 23 Mar 2021 10:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqe-0006c2-W7
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:17 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8ba6ac2-16b6-45de-b559-d8438a60d5da;
 Tue, 23 Mar 2021 10:00:55 +0000 (UTC)
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
X-Inumbo-ID: f8ba6ac2-16b6-45de-b559-d8438a60d5da
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cqD+tWGVB4nOXoM5SIKNJg9ABIWM9BwXG5qj4qpnV7o=;
  b=VlTr1cehDfTXoZ+8f9lzTvecd8+Ol10yjahXRLKxQjYkKwDNZC3Cdz9D
   uy/88zSGDI9EVPN804pqCMI9IQqnKe21Q1t1+9Hc0P8by3155LOk0PQYF
   JXyJmZaHoavMg7k+3c6csTFBvAeH5bRTvDAY0cROJyNGo88wGab1lbrs2
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tFVhLBjgM5gWqO4sNFSwKp5Q7HZE1NaaoTm2tbjSxVMDFdERRAA3k93Eavxly1OMcUi6Plsmw9
 4EyAgVuQ/M9mPS7av4kvM8LFpOuDMCQ5Tz3sB2xWfvN+mwigvIjTAaPRbnyJNX0CPEdX738l8E
 qS0Npd/Zb/YkoNIsVgdW9/BJ98yGLhf2hJWjufbgpaA1COyhsKVdwqmVobZss2Y19fXBHU2WJ8
 Cj14H8caTNKmGMAQac8o/INumoOiMri9BB9XIdUqhkZePiJdrLZV41xAS8l7/cOxUISuGfp5je
 bgM=
X-SBRS: 5.2
X-MesageID: 40055664
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WKVnSq+UZ5A3TXsdg1Ruk+Gncb1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmxybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUDD38Zn/+
 Nbf6B6YeebMXFTh8z3+RT9Nt4mzsWO/qzAv5am815GZ2hRCp1IxQF/FwqdDwlSTA5JGZI2GP
 Onl7J6jhCnfmkaadn+O2kdU4H41pb2vb/FQTpDPR4o7wGSkSilgYSQLzG01goTOgk/pIsK3n
 PCl2XCiZmLk/b+8RPE0n+W0pI+oqqG9vJmJOihzvcYMS/tjAHAXvUqZ5SnsCouqO+irHYG+e
 O8xysIBMh453PPcmzdm3KE5yDa3Dkj8HPkw1OD6EGTxvDRfi4wCMZKmOtiEifx1ks6sNlwlI
 JN0m6J3qAnby/ooSXn69DEEyxtj0q/yEBS8tI7sno3a+UjQY4UibZa0FJeEZ8GEi6/wpsgCv
 NSAMbV4+sTWU+GbljC11MfjeCEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89cZ9Z/O
 7JW54Y2I1mf4szV+ZQFe0BScy4BijmWhTXKl+fJlzhCeUhN2/SrYX0pJE4/vujdpBN7JZaou
 WPbHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo5djvLnxQ6fqLD2DRFgin9DImYRfPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFM0Z0+xLG26mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXz2LMVE5Ua7R2/gjHHqKjDQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOLyZDvKwwdE
 53O6jmjau/uGmz8Q/znitUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0XwGGKPQZlT8TdEB
 dWolN+/a7fFe3T+QkST/acdk6KhXoao3yHC6oGkqqY/MH/Z9cTFZA9QpF8Eg3NCj14kQtns3
 14dQcBX0PTfwmezJmNvdgxPqX/f8M5qBq3KcRUwEivznm0lIUKfD8neBKAFeSQmh0jQjJIgE
 YZyd5kvJOw3QyABy8TosQddGdNZmOWB7wuNnXdWKxk3orEVkVVYg6x9HqnoiB2QETFs34/vF
 DFEESvCLb2K2sYgF53lprP2HdPVkj1RTM1VllK9bBYUUz9/lhY98ilD5DDi1e5Ykcew+0bLT
 HOaSYTJAQr3NysyBuJgl+5ZAkb75E1PvXqCbwpf7TIs0ndVbGghOUIGeRZ841iM82ruugXUf
 iHcwvQNz/gDfg1sjbl70oNKW1xqHM+l+nv1wCg5G+k3GQnCf66GiUQe5gLZ9Wd5XPjXfCGzd
 Fwis80p/K5NiH0ZsSdwa/aKz5FJRW7mx/Bc8g47ZRVt7k1rr19At3SVibJzmhO2FEmN9jv/X
 luMphT8fTEIMtibsYScyVW8h4gk8mONlIitkjzDvUldV8ggnfHN7qykvL1gKtqBlfEqBr7OF
 GZ/SEY5fvDUieZ3bMRCq47Iw1tGTwBwWUn+PnHe5zbCQ2see0G4UGzNWWldqRBDKeCArcdo3
 9BkqK1tv7SczC93g/evTF2eP0Tt2mmRN6/GwKKF6pD9cegNVGFn6ut54qygV7MOEqGQlVdgZ
 cAc0oaKtlHgH0lioY81yCpUKz5ok4/iTJlkERav0+o3pLj+XvRGEFNLBbQjZpXVyRCK3Tgt7
 W6zcGIkHDmpCVf0ZbNFE1MbshDFtgZQI/wNTpvI6Erzc6V1rtqhD9CbhcoB3M9jz643/oO58
 bH5Mnv
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055664"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSN2XjNK30WKoKDpaOaZ4ktG/uQLzwTvI7jCXmZbjIuYSogteQtby63ZrGztfSyUjRZQd448eUVCdyCH0Q1Y7tZRenitqKnllJH2+n2CU93wGIYJ3S6GyLUDJkFnjGR/941JR7FsP6k1CeNIHXkA+zTgyHQSCy9VjLsGkhzsWXBVpqCCh/Po20xC1SebLT9R3NSIOEzX8f/G/ghHy5cAjUjyvMuQMwJW715Azmq4fUZT84PnCBn01CkROZCWR2IY2oXYDp2a0KGdawTdnUcd4pryfDer6uFGhtLI1hV8sRAgL51wfV6KW+BuHxCUDkez3gbALXQv96zDpHncnB+DgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY3Kjsh0dxbfkIPBdEUM6WIbCGm2IEEAQFQ7pR2GimY=;
 b=YA8mMe2Zy+0BtGxjhPMCSr3QU8o3EzRaHD2Or8eF1RwQqtj1eZq1BoBzMk21UMmNEErTH2gYHyGO0jSqjr+R0143vfbyRZoLiAaJOHlDTqy0lJc8nbaCW0DQPu5T2/oK12FNQiSfczJVpwK0XhDIQ/8ApsP9D12N6z/Se0EHp0TDMhgqc5S/b6bgDJSXYbBoq2WUf9Qn1G7oReiBokF1uXkPbNcz22bGQgwgq1Hg+BGFhShkuOwgfVhKp7j1FNhAEmO1+sFFW3eH8lcH8/fivfzJiShMtxNpQ9V7jB6a11PTVpTBP61cVXZUw6aix4tpfDNQJs/2M9x0fC4Yepyiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY3Kjsh0dxbfkIPBdEUM6WIbCGm2IEEAQFQ7pR2GimY=;
 b=JhGzIIbD4S7GRBu0C5YRTn9UXMfw/Bd+4D1p02LPK2ab9181AzkqWCdrvCIdWO5PIwfdR/b71+V9pA0Mlxr3zKIqmusmkaXftJ/TjVGRz4ADQRhAN18CH570j1vkcxPUmvEXHvsOJMp/jS1CB0je0kID7dVgG5kuNWx+JZOS0Fo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 13/21] libs/guest: switch users of xc_set_domain_cpu_policy
Date: Tue, 23 Mar 2021 10:58:41 +0100
Message-ID: <20210323095849.37858-14-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c34239e-bbc1-4e7e-605c-08d8ede28a66
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969C0C41DAADAE3E87105808F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXIkZ34+UgPAT83aLO2rXjwWKANlatQh1mO93kMP9s38l7/QNmrAgSx7+rIdcwYG/d8dFy3dsm9SQdHcWTjM5B7iwgDmI0imGJWrN7YkcOtitiIN925K7KE0Ue4odX86QLzXfXIhAOXAJwVLRn3cnwjRsBANat/JGVKzFuwURVdVidwqNmqk6WSjTZ9okF/+lG/HYzepavx2B+Oln8xv71HFrDmn8lwvgEJVVQgU5Jm8j67sC98W8Gqbreic6YpPHj+VQyYApVBaWvj/arGHPrvcZJLbhF0kIKdYNHvrctJgUPmUZbzvQj7jEdGMdKRBzCPCxB/WQ4/6+1VK95+d5kRFK8BU8J+ugiYJM/R067Mo/kJM0s0cqysg4HwRyQuUgmDf0iXrFZyeuWokR60tWSXiSzRVEGvKPn+2Wu9bSb8wtJHfn5x65yyhMs8SXlQhYXh99LCFU0fPhL6Dm1lhu/vM/9whxeNsR3e5yn+6ZaSr0SgYvnf0i4ufZ1qP5YAO9UERZYD0KDQV8rDZrSV1mJ5LqTifnAoF18+Wpyyffe/NAx2nyLTXkTNYoMmxD/dRpeKRUTZPxThfYBw/l0R0WJEopoPsFPAgDpjQvQHFqQge9ow3GEBKWXKY8Ei8GVBdmtnsDB46p1F4bO5dYlABZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0gvMVp3UGhONkNoZHFxSXpKUExGR29LUEtWZDg1U0J4QVp0S0NzZnNUSHAz?=
 =?utf-8?B?MFNKbU5oVmlvbThVVzZ0dVlCaGdQU0Nzenc5cWQ0clZpa0gxbmZISW9iODBr?=
 =?utf-8?B?Y1RrQ1lpdVkvcTdvOVVYWVlWTThVZnc1eENodlNseXltVm9iLzBUYlNCS1F6?=
 =?utf-8?B?bWtQSWhiZkxBd0Frb056WFJMcXdkdlIrQ3c4VndDOVdHdmhyYXRpZzZxT1lN?=
 =?utf-8?B?VUYyWnlaNFpSRithb0N5QUU3SG9jQkFRR3JlN0dzci9WR1FoOUlyWVd0aTBs?=
 =?utf-8?B?RUVvaVdMN0dETWFCTGErYU9SOEM0RDk2bzVGZjVDT1RMYXVkNFdDYzFzcU9H?=
 =?utf-8?B?a1JvQkkrOE9KRlVKRGNySnF1eEozTTIwaDU3NlNPbTdqSG03dEtDWHVmU3BY?=
 =?utf-8?B?YVZpQ2RNS0RSWEhTSnRGY1h0OGM1STFYMWpkK1p5V1VIRGZ5VEpqWFllNHhV?=
 =?utf-8?B?MFFlQS9YNk9BNXh6RzBCdG00VHBwbk0rRU8wbjNySlNxSEJyYzFrU245U1Yr?=
 =?utf-8?B?YXVtMzNmUERldFFLVmxHKzI2V0xobGVpUFRZSUlsc2hVUzZZMUFiemdlK2cr?=
 =?utf-8?B?aUI4OXpmTU5VRmZWVUtYazYzcHBJNzcva2RGcDhCMTNXYXg1dzlPQ3AvQzNv?=
 =?utf-8?B?cWtDcXMyU0NIQnVnZjZIY2p5UTMwTFgwR3phTVB5V1dzaXJady9QT0Y1MW9u?=
 =?utf-8?B?Z1UrN3g3YXYrL2IyMy9ETlhpVFZBWkxhVTdEL0hUQ1ZCcGkwZDlJU1hpSDNY?=
 =?utf-8?B?eTZlb1dpcEZuM2tsTVZxdDU2dFJqU28xV29EYnNnUFlOZW1TdXNWMzlmZ0Fq?=
 =?utf-8?B?Tnhzc015L0VlNU5CZTNoQ01OUnFTVTZkK2FHaHpCc1AxeGRQdFpGTVNuRzNa?=
 =?utf-8?B?M1hlakR2UzdHcCtpSHg1cXhkQjhNVi90MzBLT1MxSWliTkwzRUJzWld5MzNM?=
 =?utf-8?B?SU9YRXZQU3hRTmdPaDJYeHo5S3RFNCt2aTRuTjFaa1JQVktaSUtNaThvNDNR?=
 =?utf-8?B?S0NlM0xNM3dObG1VZmZhZFVGdG5ySE5BZDlsTHZMMGFZVnVBdWZKZXB5bUdw?=
 =?utf-8?B?SWpSV1lBM0pPNWE1azRrdDlxSmRZa0MrN0ZXMWRBRXF3OThBVG0yOWNzQnU4?=
 =?utf-8?B?cGwzVncrVTcvR2lObW5qb1lJR2NibmNZQTdPN0R5VVJvbHgweGUwSUEySUVS?=
 =?utf-8?B?ZmIzaDdnckZySkF2enZIWThPVU5nWU9VNm9UREJQQU9BamVxdjhSK2FxM01H?=
 =?utf-8?B?bk5Vb2duQktMSWhXdzZ6a2RDRURONnBKVXE3WFJqYjZTTjUrTjhnZTdGaXZU?=
 =?utf-8?B?Nmt0Y0tnRWxkMGprWXFrWE9KUVNSSHJPalhBUmJONjVra3kwUjdTVjdpN3dL?=
 =?utf-8?B?NWdvZEloMGdwVUVDZ09ZTHd5UmptLzNTQjVMNlB6eThybHl5a1NNUFE1K1Mw?=
 =?utf-8?B?UGx6dGZRWms1VDBnNDZzOEtNL1prNGdMOWxmNE9DSFowbTlDdG9xY1dSZ0ZW?=
 =?utf-8?B?VjZVL1dqMldhaWlKZjd6QXlrMDJmb01xQjJKOGg3VHE5ZHpSZmRRcDlQcWhv?=
 =?utf-8?B?aFIxM3JSbzk5MHBDL3ZxWml1MUh5c1p6VjV1ekVUMGtXNlVqNnlFZWhITmZv?=
 =?utf-8?B?RDZuRkJpVFdCZUJ5eHdhcmNLdXdQbkdSby9abXVVWk5HcXdoOEdYNHN0RUVo?=
 =?utf-8?B?eDNHakVMOHlWeWk2dXcwU1BVa3Nxay82VGM5ODZMaThnZ3ozbktBZG01aDNE?=
 =?utf-8?Q?yKbcj30yU+96oaan6LO3eg6ud16ky1mUBuzbU0c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c34239e-bbc1-4e7e-605c-08d8ede28a66
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:51.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eceh7IR/BLgBDKMpPgEw8YBp2pBZsHg47vBirqMeeaViKR/Kf7Wxk8R+Z1k9xbugLj5edwng0Lm61l+3fdFGhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

To use the new cpu policy interface xc_cpu_policy_set_domain. Note
that xc_set_domain_cpu_policy is removed from the interface and the
function is made static to xg_cpuid_x86.c for it's internal callers.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h             |  5 -----
 tools/libs/guest/xg_cpuid_x86.c     | 22 +++++++++++-----------
 tools/libs/guest/xg_sr_common_x86.c | 28 +++++++++++++++++++++-------
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 46f5026081c..164a287b367 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2625,11 +2625,6 @@ int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
 
 int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs);
-int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
-                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
-                             uint32_t *err_msr_p);
 
 uint32_t xc_get_cpu_featureset_size(void);
 
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 07756743e76..f7b662f31aa 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -204,11 +204,11 @@ static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
-                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
-                             uint32_t *err_msr_p)
+static int set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                                 uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
+                                 uint32_t nr_msrs, xen_msr_entry_t *msrs,
+                                 uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
+                                 uint32_t *err_msr_p)
 {
     DECLARE_DOMCTL;
     DECLARE_HYPERCALL_BOUNCE(leaves,
@@ -405,8 +405,8 @@ static int xc_cpuid_xend_policy(
     }
 
     /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    rc = set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
+                               &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
         PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
@@ -638,8 +638,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    rc = set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
+                               &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
         PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
@@ -833,8 +833,8 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
     if ( rc )
         goto out;
 
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, nr_msrs, msrs,
-                                  &err_leaf, &err_subleaf, &err_msr);
+    rc = set_domain_cpu_policy(xch, domid, nr_leaves, leaves, nr_msrs, msrs,
+                               &err_leaf, &err_subleaf, &err_msr);
     if ( rc )
     {
         ERROR("Failed to set domain %u policy (%d = %s)", domid, -rc,
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 15265e7a331..02f0c3ae9ed 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -151,7 +151,10 @@ int x86_static_data_complete(struct xc_sr_context *ctx, unsigned int *missing)
 {
     xc_interface *xch = ctx->xch;
     uint32_t nr_leaves = 0, nr_msrs = 0;
-    uint32_t err_l = ~0, err_s = ~0, err_m = ~0;
+    xc_cpu_policy_t policy = xc_cpu_policy_init();
+
+    if ( !policy )
+        return -1;
 
     if ( ctx->x86.restore.cpuid.ptr )
         nr_leaves = ctx->x86.restore.cpuid.size / sizeof(xen_cpuid_leaf_t);
@@ -163,14 +166,25 @@ int x86_static_data_complete(struct xc_sr_context *ctx, unsigned int *missing)
     else
         *missing |= XGR_SDD_MISSING_MSR;
 
+    if ( nr_leaves &&
+         xc_cpu_policy_update_cpuid(xch, policy,
+                                    ctx->x86.restore.cpuid.ptr, nr_leaves) )
+    {
+        PERROR("Failed to update CPUID policy");
+        return -1;
+    }
+    if ( nr_msrs &&
+         xc_cpu_policy_update_msrs(xch, policy,
+                                   ctx->x86.restore.msr.ptr, nr_msrs) )
+    {
+        PERROR("Failed to update MSR policy");
+        return -1;
+    }
+
     if ( (nr_leaves || nr_msrs) &&
-         xc_set_domain_cpu_policy(xch, ctx->domid,
-                                  nr_leaves, ctx->x86.restore.cpuid.ptr,
-                                  nr_msrs,   ctx->x86.restore.msr.ptr,
-                                  &err_l, &err_s, &err_m) )
+         xc_cpu_policy_set_domain(xch, ctx->domid, policy) )
     {
-        PERROR("Failed to set CPUID policy: leaf %08x, subleaf %08x, msr %08x",
-               err_l, err_s, err_m);
+        PERROR("Failed to set CPUID policy");
         return -1;
     }
 
-- 
2.30.1


