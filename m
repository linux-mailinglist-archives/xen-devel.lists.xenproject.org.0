Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B849056B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258044.443945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Odj-0004BJ-Nr; Mon, 17 Jan 2022 09:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258044.443945; Mon, 17 Jan 2022 09:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Odj-00047S-GL; Mon, 17 Jan 2022 09:49:27 +0000
Received: by outflank-mailman (input) for mailman id 258044;
 Mon, 17 Jan 2022 09:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Odh-0003a5-6c
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf3cd636-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:23 +0100 (CET)
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
X-Inumbo-ID: bf3cd636-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vDeZNAfzjRCgFt8hGu55m0epQtOZNasdba7RtKoWkc4=;
  b=Peaz1VDE/CbAVVfdTmSrJIVZt/fLsIMxDKpD7mMEMRUIkk3I6kFNEggk
   xgb3ILVZCJ2kF8+Sq1qGs80xwG8vfvkmd61Hdop93EaC1I8q65gRP/CNO
   XpT08jOupL9lSEBD5xP9vqmVE/Um9THVUZ92qDl3V1+VuOxCnctXVAzea
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LHh4JEJfGJpIDvJQ4mHWOOabhVQ4PisDz4BEA/cn0MyFydbQBPb0IWEyuwg2NaIEuwHTWlg6RT
 aUC+J3bikwrJXuzps0K62q/19MhiSMUvLHiHIyUZKqGY+dRIYrBS8BL1AjiHmExlNrWqgC1Iks
 wSiFaLpljVsR/ueUnorfqBVVgNHcDGdiCxFAnlSfh7cLEVSDbphj1ic0c0PWTrDCgeguZokbxf
 icjQncsl//wVP1tO1/qgZfZLjFowPcxJazfuZVUqp3iR/ATTyv7YXI+oZwRwv17lk2hdr1DfiC
 FR29K8EAIEZ72+WjyBORT1Wi
X-SBRS: 5.2
X-MesageID: 64269527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6zQ8QazULh17qXEIhlZ6t+fWwSrEfRIJ4+MujC+fZmUNrF6WrkUFy
 2UXDWyCOfmDNGr8fd8naIu+oBwC65eBx9FgTgRqpSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdm2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Ev4
 850msWAdQgOJpb3xbwveTJRAT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEEhmlh25oRdRrYT
 /QJMx8xaC7tWABoI3E0Aq8TzLe1pWaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19nEyVu
 2bH9GTRGQwBOZqUzj/t2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQgSCvpSczAupsHMoi0zrQkpj+yA+LGT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkuXFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARBodtzxor6p5
 ilspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/J9sNsGoueBs3Yq7onAMFh
 meJ5Gu9A7cJbROXgVJfOdrtW6zGM4C9fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qt9MfQtUfCliVfgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:SAOUxa0m90BVA2mUqi1WqQqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJU80kqQFm7X5XI3SJzUO3VHHEGgM1/qF/9SNIVydygc/79
 YeT0EdMqyIMbESt6+Ti2PZYrUdKbG8gdyVbIzlvhBQpG9RGsRdB1ATMHfnLqQ6fngOObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Li1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESlti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3h79EZpgE686Ii/r1vop43zuNOd3B13Z
 W7Dk1WrsA/ciZvV9MEOA4ge7rBNoWfe2O7DIqtSW6XZ53vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="64269527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIe4jCzGQrUw8MIyG31vb7gSsQN66mh09Dx1BNNGSg/0NBnfC7qv/Mz8ZQUWF2w/x4+GRgQtRySorlgDfGqla72rh1MY0/+uG/UTWallejVwcRgjBWtotzQVo4+F85xAoDMaMNkFCh4kvee+ImQoWN3CRDe+AflhQ2m4gKWFlZeLuRLiVcnjnZLzZshLx/y/XQxwzdv4MAHkkDFt/7wnNs+vVWV8qo9Is2vsr1vJaWF7NB1LwEm6pYUGeEkCMOtMFb3E7ZxpbkFfx+4Vtk7yAMIAz+0rssjjPytvKhIPvkZJhNl4MhaEIquJstKOSef3w3/BPoFzdpP7eYhOAOTAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ4w732WigNqFyep8JcmK9zsMMm6uzHE9SmRsR9wkPA=;
 b=e/a4+YkbbsboMl5bZlUuujwGvzeMuEUqIytyA/cDP5tytR41rStr/dH+lvKnG7LfgeRGMHGHZ0RbaafRuNiX03ivmdCs6mlaDdH6uEjFT6kWUm2G4LDJo8XkBfW7e7hljHKtHqA2oK3KfAY1pVS4du8XqQSDRLvgy/7jLO8tC+eEJ8OLn+0q3Cth7lGoitl+g0WfXAHZoR1J86azoIZbwONDvl7KJIPIxf++fPTeBsuXoAAX6qDwbzOWIB44jCkkZQlJEfLkjb3wR2y1Dao48bJgbeXbUZ6qD6OGoJQSbPaxX8qUGhqhvpeaqrIUkkqOT0yFQL4J45+dd1/TGx8PuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ4w732WigNqFyep8JcmK9zsMMm6uzHE9SmRsR9wkPA=;
 b=qswsX6/EBCB+y7PUFaAaD6X1LWa+DbVeUv5fFMkod7BqeL0No1icCtsIXkIL2ujGwGnHXJ64OVXxTpK75p3qrHBB2LEj8svvuRSrGPeGHcY/U0LiB1tvaQZFK3J9+00Mgd3Ef4yfZsfJ9MLAG2pNyJF4xlrrfC7EJKfQFEwHkRM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [PATCH v6 04/12] libx86: introduce helper to fetch msr entry
Date: Mon, 17 Jan 2022 10:48:19 +0100
Message-ID: <20220117094827.16756-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79fa31bf-a88f-43dd-613a-08d9d99ea15c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059C5EBC7E50A01302099028F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukEnZ2PmybNUijujuE+p/pcUYQvoYeAeW2jCJBbw36bRszinBlEwGiB0so8MvVl5+Vr3RPy8BTDQ5PZtgxR6Xyc6wJIe85nhQn0a1c0P72nGiolV9DytM1kPHSBZkPmycH3/lskUg6IcCzVYYbFvq0r2pzJzN2oA7Sp29df4MyGCMF1AtNORaqO9hhx4HdbY6BSZ1ZDr0u5krsUufhOAX1FbrSJvG2aoFoeKcl8ogS6YO2NhBZgRnoPK2VBYy5WEn/VTSByI0FFjIkovNoLxM0lujkBkN8i4dqTAiNwL6Q+7OU4APjFwrpHaFl0MNYpPaWb5IB1Re90HCtDEzycnNl7ijep7BjGKLazFR2tTT/iHRaOuDYQFz9acvhae1LRNFN/9uayD5gGudWJzr8DUVJFXmRsazNvLQQTWLzD4TiPdPgdjiyb+NmeJMA48xNuoSqAp/SK9YWILQ/Mt7rCrSa4Dxd/M6PNQBKylOf5NjEvFJWxmka81wIPyFJJyUE0dLFe6B32F+RYnGda9GV11lLJFSBDyAmM4SJnlU712zPV5Yj8PF/xz3CvMVBOx09a1eHS7dsm8L6RUkkqJXJr15Z+ATVXbkg32hQPmrfI2TeN4O781lxtCH9KyhKIFKJAoTZWw+OYqF231MM06zmGg3GzxvTfdnXD+xco98K9yIQYtz1jWI3evKCzMiWN46K3f4K+sA5Xah1fJLcEZMY95jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(107886003)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWpTeFhLSGdBSGFrRHNCN3E3azRXa25Ec1Nva0djSThHejhDaVRrVlZId0cx?=
 =?utf-8?B?V2JkL2thMXd3OUFjK3RQZU5GTDljRmNaQTFLU2hXQ1oxWS94Y2t3WmEvU2hE?=
 =?utf-8?B?cTVXcTdjWmFTS2FEQnRIRnpOU2Vtcmo0Q3U1YjVsK1BMR0VuQU5rMzBFK0Jt?=
 =?utf-8?B?Qlc0LzRjMWppbU52NVloMllobmJGRldaTlowYjh6UE80bExvOHBieDJZSVJU?=
 =?utf-8?B?RHV1ZVFqdDFHNGdQd3cvMTVXekdOSUNadzVaYW1EeGRkMndvM1kwZENrRjBm?=
 =?utf-8?B?eG1oRTZ3YnNrMmFzcWhabmhlQXFpdHV6d2pjelBGQVh6ZVBid0JFcmZpYTIw?=
 =?utf-8?B?MDJ4UmFpTlFYOHJpU201cysra0FrSnJ1K2FINGhTVDk5UVhPT2o4NForbXVR?=
 =?utf-8?B?UC9pZkUwNnd5M1JKekowWHc1MWdiMDB4UnFYaWt6UE4yWjFhd0puK3RpcmhY?=
 =?utf-8?B?by92UnRyWWM0RHZydVVHaDg1Q2JrT3dFd0RkUTJTUUNaL0JrRmpLNlBlcEY1?=
 =?utf-8?B?NklWSERZY3N5cXVLZWZqaEZDWnduWDZIeU5NcTg3OXBGblVhK1lGMno2NGFF?=
 =?utf-8?B?ZGJYZXJZN2g3Yi9taDVyUHhPUk5tbUI3Zks4aXBaNk9sK1I0c2JackljVUZu?=
 =?utf-8?B?bXZHYis5MitJZ1NVQmZyeUxlUVJobUJqa2xIbEtzdEVJc1owNkdWc0pCbnBZ?=
 =?utf-8?B?N0tXdzVwTW5qY2RJUmZBUmk3cXQ4OVVURTBUakJBWUdUeXpRUXNnc3NiVFUz?=
 =?utf-8?B?eExhMnIxc3JxUFlHcjlXYkQ3SmtyVklJcHJoeTQ5OW5VTkJjdnFEaFdMUFYr?=
 =?utf-8?B?WVBYYXUxL3NvQUdSL0M4R2R5bjVaZUQ1VjZ3WkE4WnZPZjUzSHc5STNnanVJ?=
 =?utf-8?B?bWRsSWhlb1RtejBpMHUwTFlnK1BmNldqOVB0QUxhd0sxeWxQWTZqTkkxLzdU?=
 =?utf-8?B?QmF5b0tnQkM3aFhhOUwwYzhmVXQrRlRKb0hxQzNhMTRZMGd6ckZJMGtWNEdi?=
 =?utf-8?B?dmx3Wjkxc3dwSEtzYUx0VnRSazZFSStqTG1nRjVrSHFhZnBHUTVaVHh5N3Q5?=
 =?utf-8?B?UGxURDcvMkZWcGcydzJ0Y05XQXBzOW5oR015NHJSTUdFNzFCMklmdzl2a3ox?=
 =?utf-8?B?ZnJoQ3BkQjRyLy9scnJGbDM3YkVZYTRRVmE3UTNMTmRIOGFLN2FOcHkwUytM?=
 =?utf-8?B?TDRYbm5NcjdpVXhmQUNUdUNpNVNwMlRaaVdKNk1PNnNFS2pXVHZkVHVlZW94?=
 =?utf-8?B?aVZ2UE9pQmZkYmNaYVdVZWEyY0xZOGNDdzZoeTVJQWFnbEM2OFd4dnFabzUr?=
 =?utf-8?B?VnBBd0FXaFd0SUp0Z0VtWktPSElRMDB4S0NLMU03Z1ArbzJUczlNWGZsR1lv?=
 =?utf-8?B?ZU5QYUQ4bHU1QVFPSkxvNmRWZVIvMEtRUkoyemd3M3Bad2JNa1VFMHQ2WFBa?=
 =?utf-8?B?Qy9kTGVKY1hFK1lEb3RZRm84ZnVJOWp4aXhwc2xnZVV0UEtKQ2lqWW9Dd3Nl?=
 =?utf-8?B?Z3pnSG1BbURkUGVSYzVMSmx1ZzZVcnpuNFpGQ1ZMcFBiU2dMK3h5TUx0TzN4?=
 =?utf-8?B?MGtLQXpQeWJRMTd6SGRvYVdpdGZXN2Y3UzhtVEk0SGo0L3JTdEMxNlJmMlJS?=
 =?utf-8?B?MTlEZllqWGp0Z1NxSDlHMnBXVk5rbklGMFBJSEROUG42VzFHTG9DWHhFd0lz?=
 =?utf-8?B?VmJRSzlWcnpzOHdBWUxxUlROVVdnOFZwaG5jWFg1K0hTSXk3SXY2RnpobCtx?=
 =?utf-8?B?WXY3c3hSQmZFRHZNQmMxSS9TdUpmdkVWT1dJVXNScHUwY0wrQjNOU2hQWnk3?=
 =?utf-8?B?QzFGdjArblhNWlBrYVY2ZTFJYzhVdk1hbXRqdXNBOUlqQ3M3OWlibU9qS2dP?=
 =?utf-8?B?bVptZG1oK2dodVFhY3FXTmd1dURmUWp5bkZBb3c4Skx3RjIwR0p3blN6MUd4?=
 =?utf-8?B?MWRnamJjN1VMR0RMVTVsdmxxNVlsNUhPV0pqWDEwaWtXMHJldUNIc1RMQkQx?=
 =?utf-8?B?UzhQNGlKemQ0SmwxSXpHQkh2UnhjNGk2M0xWRXJYUVZLYndtV0lkZDZweUgx?=
 =?utf-8?B?b1B4S09iM041SGl2YmdkWmp2b2hNRzJRdk94bC84Z04xanMwNjJvNnIrR2g2?=
 =?utf-8?B?VmJNNE5SOHhGMjBjdHBJeDJDcWZ5TE5JdE94MXJocWZndTlVdi81UDJrWFo0?=
 =?utf-8?Q?zxN87yrh0J24NZfk6T2w6S8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fa31bf-a88f-43dd-613a-08d9d99ea15c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:18.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+b9ap6zaIDHB2rAAdUG3vaZKkYFhaXIDwd20m6ijhjnED4xAL4IhCeMN5peAPS1xMPIij46PVrm5pIXpRzCeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Use such helper in order to replace the code in
x86_msr_copy_from_buffer. Note the introduced helper should not be
directly called and instead x86_msr_get_entry should be used that will
properly deal with const and non-const inputs.

Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Rename _x86_msr_get_entry to x86_msr_get_entry_const.
 - Add newline before endif.

Changes since v3:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 48 +++++++++++++++++++-----
 xen/include/xen/lib/x86/msr.h            | 20 +++++++++-
 xen/lib/x86/msr.c                        | 41 ++++++++++----------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 3f777fc1fc..686d7a886c 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -386,16 +386,6 @@ static void test_msr_deserialise_failure(void)
             .msr = { .idx = 0xce, .flags = 1 },
             .rc = -EINVAL,
         },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0xce, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
-        {
-            .name = "truncated val",
-            .msr = { .idx = 0x10a, .val = ~0ull },
-            .rc = -EOVERFLOW,
-        },
     };
 
     printf("Testing MSR deserialise failure:\n");
@@ -644,6 +634,43 @@ static void test_cpuid_get_leaf_failure(void)
     }
 }
 
+static void test_msr_get_entry(void)
+{
+    static const struct test {
+        const char *name;
+        unsigned int idx;
+        bool success;
+    } tests[] = {
+        {
+            .name = "bad msr index",
+            .idx = -1,
+        },
+        {
+            .name = "good msr index",
+            .idx = 0xce,
+            .success = true,
+        },
+    };
+    const struct msr_policy pc;
+    const uint64_t *ec;
+    struct msr_policy p;
+    uint64_t *e;
+
+    /* Constness build test. */
+    ec = x86_msr_get_entry(&pc, 0);
+    e = x86_msr_get_entry(&p, 0);
+
+    printf("Testing MSR get leaf:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( !!x86_msr_get_entry(&pc, t->idx) != t->success )
+            fail("  Test %s failed\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -763,6 +790,7 @@ int main(int argc, char **argv)
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
+    test_msr_get_entry();
 
     test_is_compatible_success();
     test_is_compatible_failure();
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c0..4d84b7cf27 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -17,7 +17,7 @@ struct msr_policy
      * is dependent on real hardware support.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             uint32_t :31;
             bool cpuid_faulting:1;
@@ -32,7 +32,7 @@ struct msr_policy
      * fixed in hardware.
      */
     union {
-        uint32_t raw;
+        uint64_t raw;
         struct {
             bool rdcl_no:1;
             bool ibrs_all:1;
@@ -91,6 +91,22 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
+/**
+ * Get a MSR entry from a policy object.
+ *
+ * @param policy      The msr_policy object.
+ * @param idx         The index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * Do not call this function directly and instead use x86_msr_get_entry that
+ * will deal with both const and non-const policies returning a pointer with
+ * constness matching that of the input.
+ */
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx);
+#define x86_msr_get_entry(p, i) \
+    ((__typeof__(&(p)->platform_info.raw))x86_msr_get_entry_const(p, i))
+
 #endif /* !XEN_LIB_X86_MSR_H */
 
 /*
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a38..e9b337dd70 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -74,6 +74,8 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
     for ( i = 0; i < nr_entries; i++ )
     {
+        uint64_t *val;
+
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
@@ -83,31 +85,13 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
             goto err;
         }
 
-        switch ( data.idx )
+        val = x86_msr_get_entry(p, data.idx);
+        if ( !val )
         {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
             rc = -ERANGE;
             goto err;
         }
+        *val = data.val;
     }
 
     return 0;
@@ -119,6 +103,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
     return rc;
 }
 
+const uint64_t *x86_msr_get_entry_const(const struct msr_policy *policy,
+                                        uint32_t idx)
+{
+    switch ( idx )
+    {
+    case MSR_INTEL_PLATFORM_INFO:
+        return &policy->platform_info.raw;
+
+    case MSR_ARCH_CAPABILITIES:
+        return &policy->arch_caps.raw;
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


