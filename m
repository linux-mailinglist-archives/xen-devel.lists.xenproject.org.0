Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8675C93C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 16:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567567.886810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqpd-0000Al-AF; Fri, 21 Jul 2023 14:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567567.886810; Fri, 21 Jul 2023 14:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqpd-00008i-7A; Fri, 21 Jul 2023 14:10:09 +0000
Received: by outflank-mailman (input) for mailman id 567567;
 Fri, 21 Jul 2023 14:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqpa-0008VA-WC
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:10:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49648e75-27d0-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 16:10:05 +0200 (CEST)
Received: from mail-dm3nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 10:09:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7094.namprd03.prod.outlook.com (2603:10b6:a03:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:09:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 14:09:49 +0000
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
X-Inumbo-ID: 49648e75-27d0-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689948605;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tmGFNAh0DXwlYmpV23+dFivminsOr+JdnDfXfDMA89Y=;
  b=fai97Na4Y5h3OyLiDKAwrTAJiEy2PV0DJI8PpAqsdNBuGXxcfAi5dGkV
   7zhjPAdWtVtlORHEU0ZQmaADKGJbqAT+FFQ1KXqJTHq3qTj69mb7Dqyhq
   f1Fj0mgFB2MBf4UHbm+xtjWckFLQPx7/d6ffkrMXppwvfhBcmUVVdbBIf
   g=;
X-IronPort-RemoteIP: 104.47.56.48
X-IronPort-MID: 119619626
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/ntF1aJRJIH0wZepFE+RFZQlxSXFcZb7ZxGr2PjKsXjdYENS1zUGz
 WsbXGnQPPzcNGv8KNxybdjnpEgPvZSHmoVlQQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZnPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vDSZzx
 fFfFwkdRR2KjsiQ756CYe9F05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv92Laew3mlMG4UPJeftaFIomy6/zAsFAIRXlSGv/TosnfrDrqzL
 GRRoELCt5MaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq10bOZrii7PyQPGkYEaTUZVgsO49Tlo4YbgwrGS5BoF6vdszHuMTT5w
 jTPoC1lgbwW1ZQPz//joQCBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:hpsijKol+qRmadmuKHJ1YJoaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:UbQiKGFwsaAuXbfJqmJ/+AkpKs1iTUTN53rZKmWeJkpQY7u8HAo=
X-Talos-MUID: 9a23:Ayv0GQUrhFLzmcnq/BXLx25AFvZB2viRFF8Kmpo7pcTVDRUlbg==
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="119619626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbiDy7YTFuJCuVtJT2NabQv74hcQgS9sIoU/9FQ1SHC3bWxhJ5d99mgQfU9UVFFz/BQgpSuJ3bjbJP3rChsBw6rTJMb08GPGNt950BsrnUUBp0ggLP0JFxZz6EPvMuMCcf5wP/n/hStqAohWDUVe3xQU9eMjSj6UNSMQOFP0Zq8kXQaKvIsd9MuRbf8CZmjyAsirsxGOR0Z5H65sUvefkEemrOR0tA1xKdEA0GTWMeYEI5ixVHeiIDQ5OPoNgL5IN6NyCICadOZZVo5dQtOUSd+IqejjQnCDGxKImwDzbu+qZTJUOgFuSDNgx3ku624tlySHKQpANbk8HWgnrDTWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86jMzWe3de5VBjC6nF+oPSaKCxPcywDaOC9vNr8jykM=;
 b=be14VrUR67Dk61K8xRoJNkGaHFE4CIqSQjULIDINz/Kqtw6MzBSqth6fyxf2NE9yodDoi9Tl1BdNK4vCZzWvrKXRjTdveLcSSJUlg5hiDM4u78fFZm39q+ah8kAcEJ771ZBvJitBxo+EdZ2kSdWt3PJeZevSDd5OHJ27EEe0BXJBHItYDFcOMjDbpgDA+leYMLrDPDXkSZQGxn/ab0PAjkv7LfuDJaEkBdqITwx5d7yXyhbc0Ntq2umczVOa4Znf+AuLjvVVpST9jO22e2GDLDvMYUzBIumrOI5eaNKoqqbq660h1GOCfeQOKXKxQaMXFCwG50UBOZXg3sDtv1emIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86jMzWe3de5VBjC6nF+oPSaKCxPcywDaOC9vNr8jykM=;
 b=iY4Mt2SuwmuRs3B7VwEqWMcEbKMQZiSa3l5DoD4ip0tdt19yMrXIDsOXiak0J14dLn373egCV4EKr39ELbach5Tt4Bgb1fnoOkGtffVxdz1TVe/apw1sy+wjvB1BVHttdydCCsIDclBQKzMObmEzW1y03le07j0pUTY9IDEKhP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 16:09:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <ZLqRp4oiwiaI_-gw@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e922db4-145c-424a-3794-08db89f42516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zeQXndydWAMfVRdqrjCmUDBX3x6/X+cvItNxdfu16nCfWXPV0bqPKOZo0WVcYlZP2BiSrostwRNdLgdK2WDmwdnpFWv31YejddwzYkB3ReIQz/OYwf32hOf+wD4edUDfORdDnUaRRn1lZmAM0laIcKKTOq1OBv8RSpNPG5jN6oIhtUtVvysFzwrrrGl92lKhmFjrWOxbwZz3Fnq687ZcMpdusc3n2QKBXsn/YEHF5KrbA1Rom24n9FJs49fA9QRYslVtT3RctQ+3vUcxEADlwhyTohPz8unO6+j8aF2O0pd5EQS+9UHoxX8ouLBioRDKv3Ms+rdCZstPGyaeNyRdV6/x/MNiVGYTSfyx7QhNjbxOWyvphcdo3mw5+KU5i20WNAhk/UrnDMbEhiFjzT5GsE1rFf/4oIXkxAEyKdHkneaxU9wGcApiiKVo0afaI597uFaF8mBFTImVSqJRd01QWp4mmKJ3/fhjnhja+gPz4GqXMGqfv4EYmgP/xyXXJKeSa71ZvsaZzYGnAswT/mHhh7IkMTzFq9/cZETH1TSRrKz/MyT7QN1ajHXolcoE65C1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(6486002)(6512007)(6666004)(9686003)(478600001)(54906003)(186003)(6506007)(26005)(2906002)(316002)(41300700001)(66476007)(66946007)(66556008)(5660300002)(4326008)(8936002)(8676002)(6916009)(82960400001)(38100700002)(86362001)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWZGUFJLM0szcTBNR1ZYQ1QxaG5BNmd0N0pyTC9Ddkcyb3A3NXdIcSs5alhK?=
 =?utf-8?B?WUtFMzRsaGduOUFiQ0kvMHZoM2RQcDJ3SzJzNXZ1Z2hBTU5DbytoYld3REdZ?=
 =?utf-8?B?Qld5cERBaTFpclF6TzFYdjc2TmVjTkxveVJrTVNUZ1h0bVcyZ0t6ZDRDMFNa?=
 =?utf-8?B?UEY4SWRzUlgrbXFSdlNEWTZzbjhNTW5TQzFIT3UwSHpvR3FaWlJqUzR2ZFFn?=
 =?utf-8?B?WUpzLzhSZmdGTzRvdTZyRllQK0tTWGl3cmtzR2NpVk1QekkxdnljVk5oMFp6?=
 =?utf-8?B?U096KzIvcEI1MGtGUHlCSnBmd1ZmbUovMmV1S1YvckpnTXdvZ3lDQXlTcG9K?=
 =?utf-8?B?VzFZUGRmNU11MnVBQ1lqVUN4TDhQSFJjaHJCRE04M3hVdlB5TUpjZ0xibXpQ?=
 =?utf-8?B?OWVqdkRhNytYSFY2NjZoNFBOR3ZCVVNjbXB2Zk9IdnR5clZvOGgxZXMrazRL?=
 =?utf-8?B?aGxtVk9BYk5iZ3Zoc3U3aGNIeWRSYmZqRkF2UkU0bDd5VHM3RVVhTVo0QmVQ?=
 =?utf-8?B?azhwNzltai9tMzhMUkhsV3JZZ280SnFVUzZDUXAzVnlZRUY0dGpVMjdsY0dC?=
 =?utf-8?B?KzRCN3lZeCtBOHVmRFZ4VXZRTGFpaU4vYTBIU2V4QitsU3g2UGY5V2FWVkho?=
 =?utf-8?B?Ky9LR2VpTXIyYW9VZGQwNXltYWRWdmtjLys3Ry9LRzNLTG5YUG1nck5aQjh1?=
 =?utf-8?B?cFQrNmRXU1BOeGtsdEZISzlvdFdLMTRRaCtMNVFqQlFyMWVDNHc1TXEvM0V0?=
 =?utf-8?B?ZVFCNytUSHhyL3pSejIwaHlvZStCSFJUSzRSblFKdDBnWVU3Vk5Ua05mYjFN?=
 =?utf-8?B?MEwvMkdZQmhXM0I0WXE5RGVZT29qSjlHQTZVY05UZmEyWUdtTmJDSHJYVEVU?=
 =?utf-8?B?ZTFyVi9SYVYrRCtGTE5wYm1QTUV5RlBBZXBTVThkYXR6bXYxbzdWZDl5SEh4?=
 =?utf-8?B?cTloMHZKTWNkWVBmb0VUZGhIWk13R1M1MStQdlloOEV0UEFsWnNtYVBRbjVV?=
 =?utf-8?B?L3BUT1IvYnQrVlNvNlltQnVzN2pkUGtYN0hzdHk1cStIcThlMFdZdzZtQk5O?=
 =?utf-8?B?YWFyODI5N2RsUzBRTzBndnV4c2FWYXZKRS9qcWQzMFBycGpXbGtMdnVybWN5?=
 =?utf-8?B?WGhqcnkrclhBYmlBVWVYb29LbHdIOXVLZlpXYUpUQStHNUYwbFVsL250Zkli?=
 =?utf-8?B?SURhY3BWY3ltY3VlQlh1UThrMWNoZHpmN2hnSDVYT3l4ZzNKTDZwdmFYRXpp?=
 =?utf-8?B?dUsybnhhY203NGtNUGJjamUwcXNFWUhMaEtueFhUTUl1NEZXSWFENmZFNkY0?=
 =?utf-8?B?aEU0c1VnR0V6anlNU1lUSGlZU2pOTVdvMWJ2N1RBY05WWjMvL1cwSTR3NzRT?=
 =?utf-8?B?WkhTSHhqeTg5V25oMDhrc2kvcW9ORGpwcnBhVlU5aUw5U2tmK0IvcldYK1dr?=
 =?utf-8?B?ZEttZTVhN0dPc3FJaVZhSStYWkFhMjM1UDZmS0lBWW12M2VUdytnU25henQ5?=
 =?utf-8?B?WTVwczQ3c0hyajZlYkxaOXFId3RlQWdMN2tjTmJQblJGcDVsbk9XTy9UNzls?=
 =?utf-8?B?TlhTMDE0eXQ0SDJEcGloZFJQNkV4eWptT3FOMS9oR1pVODg4anhhV1grZjN3?=
 =?utf-8?B?OXAzR0YyVUpsYnNJSjh5ZzY2eG9QMi9tVlZMQUZ3VStoT1lPOUk2NU4vLzRT?=
 =?utf-8?B?akFJMnRTcldNOVA4bjlEL0Y5bDlBOG1tQVhpZHlmTDF2U0xPem9VbmgxQi9H?=
 =?utf-8?B?NjFCTzYzV0orL2FvUSt0bDJhOXpDcFRtenppNWVWelI4ZStEdEpDRTVGRHRN?=
 =?utf-8?B?Rmt1YXZhVTJmUDJxeWgvTW9OdTZpK0IxVUk0bGs0bnV5R2ZhbXpBMmp3MmFj?=
 =?utf-8?B?RENUNmJBMExLWEJwQ3AxQU9OeDAvK29YWlM5dUc2dTcrV1ZHcjA2SEtVWDk0?=
 =?utf-8?B?M1A1YWcwcWp6cytVY2xqbVdUa0RvVUdKMTVtTmhhOHNkeTBiejVCWDk3OFZL?=
 =?utf-8?B?cjExbFQxQ2wraW45V2Q4c3h6NWJ4cms2Y0k4ZjJMME1ubE9LQUlqMUcvTHA4?=
 =?utf-8?B?V0s1YzdnTW9aNkp6ZkN6bWFBNFZLcWdMcGc1Nlg3eHk5bldqazEzRWliWCtj?=
 =?utf-8?B?TnQ5ZXZId3Y4bzJ1bVNmTlpXZFQ1MEZQUnVzY0JXTjVmYjR0V2h3eFQyalVv?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DMhSJAP8viIOQDCM4hVGSNKxtXbqRfF5oYwWCs6lkUp1r79R8Bwh0FfuLWa58kk29PzOZHCH76iwstsRDsZDL5sh8iS1jfgySP4BYXKMpM8PLJGbXYacooJFsKvmFmBlNA10rCZPC4/F98ugSvck5u4B7ZcLqxiaVBAKqy2MKARpcyCRkkkKZFvGAH3w1Qzml4NBPozhnoxAFcZ5P4TSYE0SxjBLQ59yhMUtrSXN5/bbvqbNUCiTGIjoZyhoclyYP/LW9n0Kf6n+YXcJ07iU4CkhHzpGrwFcVBl9Y9CDk8TBRN1Nsdzi/QCPNhT+pqTbnbjrgT00UYyn+L/Gm7ljt1imcM7AnrB44cu4wTr9BtSbAtFe9wvojoS05AIdDVtVktsqMJl+ZUY/DGXOLM1aOZ7VLR7IjdzkHHzQ/QVnBRosRfAbZ6ZfDTRDEeRyJ11VvBzAn32S8G/EdL6148vUwKL5ROrunkoq/XwE2UJB1mna6k5rTGZsYdFpkxzGZKO9FM4gnrvPs7TltzxDrnlBMd270Egw2/1av3KWqZ1VJKDcW4Hahkvec+vSIj7O26oUtCODzyXxOTWl5JmnISt2YT/25TmlN2dwbRGywBuwoVCJLvkAHCWjjnE5Fe2BDNQ+MB0+zf07bMukkkntsy3q8YALeyTHdhaPuaT0I2Fy6hVinFiNomMuPkaTnJyI0XawUSS1mGeqCVEx6iqSQ5sjwoxHO2fsU+OqOQ0FXZWWIvte5fMIhNfQmIntY0hGHSE3lfa4gJO3OuZCtI7/8iDFNbcmV7vRFaZRZNh/sBUP9j4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e922db4-145c-424a-3794-08db89f42516
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 14:09:49.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6WmqO8WLSqk3lCvl2reDDR3Xfeo/Matny91i+KGQHaPhTBqS/waYxC5PCE8QyAqWp80/FEXnQjP5TjEctWAoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7094

On Thu, Jul 20, 2023 at 12:32:34AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v8:
> - locks moved out of vpci_translate_virtual_device()
> Since v6:
> - add pcidevs locking to vpci_translate_virtual_device
> - update wrt to the new locking scheme
> Since v5:
> - add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
>   case to simplify ifdefery
> - add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
> - reset output register on failed virtual SBDF translation
> Since v4:
> - indentation fixes
> - constify struct domain
> - updated commit message
> - updates to the new locking scheme (pdev->vpci_lock)
> Since v3:
> - revisit locking
> - move code to vpci.c
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++++++++++--
>  xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
>  xen/include/xen/vpci.h  |  7 ++++++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 3bc4bb5508..66701465af 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -28,10 +28,33 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                            register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge )
> +    {
> +        bool translated;
> +
> +        read_lock(&v->domain->pci_lock);
> +        translated = vpci_translate_virtual_device(v->domain, &sbdf);
> +        read_unlock(&v->domain->pci_lock);
> +
> +        if ( !translated )
> +        {
> +            *r = ~0ul;
> +            return 1;
> +        }
> +    }
> +
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
>      {
> @@ -48,7 +71,27 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>                             register_t r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
> +
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge )
> +    {
> +        bool translated;
> +
> +        read_lock(&v->domain->pci_lock);
> +        translated = vpci_translate_virtual_device(v->domain, &sbdf);
> +        read_unlock(&v->domain->pci_lock);

You drop the lock here, so it's possible that returned SBDF is already
stale by the time Xen does scan the domain pdev list again?

I guess it's a minor issue.

> +
> +        if ( !translated )
> +            return 1;
> +    }
>  
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index baaafe4a2a..2ce36e811d 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -177,6 +177,30 @@ static int add_virtual_device(struct pci_dev *pdev)
>      return 0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + * This must hold domain's pci_lock in read mode.
> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;

const for pdev and d.

> +
> +    ASSERT(!is_hardware_domain(d));
> +
> +    for_each_pdev( d, pdev )
> +    {
> +        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;

Since you are already iterating over the domain pdev list, won't it be
more helpful to return the pdev?

Thanks, Roger.

