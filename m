Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF26925C8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493575.763566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYUZ-0005ik-1R; Fri, 10 Feb 2023 18:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493575.763566; Fri, 10 Feb 2023 18:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYUY-0005g8-U9; Fri, 10 Feb 2023 18:51:26 +0000
Received: by outflank-mailman (input) for mailman id 493575;
 Fri, 10 Feb 2023 18:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eynG=6G=citrix.com=prvs=3989d3060=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQYUX-0005dq-F8
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:51:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80b016a-a973-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 19:51:22 +0100 (CET)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Feb 2023 13:51:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6138.namprd03.prod.outlook.com (2603:10b6:408:11b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 18:51:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 18:51:14 +0000
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
X-Inumbo-ID: e80b016a-a973-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676055082;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uYkLE6i11nbs5+q7zuAGj51J3zDiw8XIjvKLLP1lMK0=;
  b=MZRMhNHMGtmnFhY+yRkQoHVWm8nwOaZx8ELtc3JAhDkd2zI9zj2RYRGh
   vEf20A1xu3DqjIZqMrlYJgSvTZchQWCKmxMTZHFXxBe1qr2poMuecDy0w
   tm6NBIV8izmCGyKk9/GZZRAvtTsUWvwqwsaO+sblPaJWTeZP8ItAbRLSq
   A=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 96483984
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+Xst4KgpTrO0z73uRLidXS3AX161gxEKZh0ujC45NGQN5FlHY01je
 htvDWjQbP+IYTfxf9onYdu2o0JUvcXWmtMwTgplrH0xF3wb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDczEubA6EhN6P4+3iErR+vfoYB+z0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RePkpqU70AH7Kmo7EwwGDH6n+fKD2xCmfM9Fb
 FEG93Unov1nnKCsZpynN/Gim1aftxsBVt4WD+074giQzrb87gCCQ2wVSTgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YXec8LaTtna+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJiYq4i3HU2Tj6Rl2DLNJfKSt4FnfqPpFcoCQSwDbu
 GBewpfDqucTEZuKiSqBBv0XG62k7OqENzuahkNzG54m9HKm/HvLkZ1s3QyS7XxBaq4sEQIFq
 meK0e+NzPe/5EeXUJI=
IronPort-HdrOrdr: A9a23:8/RnG6DFK9TNNcHlHeko55DYdb4zR+YMi2TDGXoBLCC9Ffbo6v
 xG+c516faaskd3ZJhNo6HiBEDEewKlyXc32/hkAV7AZnidhILXFvAF0WK4+UyUJ8SWzIc0vs
 0MH8YeaOEYT2IK9voSizPId+rIruP3kpyAtKP+9lsodytOApsQkTuRcjzra3FedU1jDZo9FJ
 2Tou9GvSfIQwVhUu2LQkAfWe7NvtvKk4+jTyInKnccmXWzpALt0aX9FReA2BcYTndo+pcNtU
 b4syGR3NTdjxmcoiWsp1M7K64m6ecJ0uEzdvBklPJlWQnRtg==
X-IronPort-AV: E=Sophos;i="5.97,287,1669093200"; 
   d="scan'208";a="96483984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmCvKihCI5SbN3jPyoIdzBkPvDLOk+lsadJORRbKzZSo1ct7vmNDuwwZS59JkdhjEK4JgNVtzyvpn6q3LeheYl2QAqWFLHuLdzS99nP/fyIPE6iN/OioLyWYXV8ryfGsAGiqyVZcrQO9AE8W/58FuzZs7Hy1BS9apP57Yt/Ekw1q7aXXnSTMtQcV5wL0ZNYBd2VRrc01QzEPzq4KEa0OKHEbTcmeogdzgW1Vaw2rnx7Ih7L1oZJuKo4kKpYGtMg7riHzZfD2Tm3FrtyCTTgIbJ/w0cJsVmqKJuYXYHDv6VT32/DhyfrM2SxoL2M0gI37xPgL2D9JBPrGiTmfit+bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10Y/pN9zzZyq5FpSK5ush7e+XYwTwTQ2g3oGNW5huOo=;
 b=SDtIz9hTnZA68F9N0G+Skxsboubl9QpFFNuzcC7pv28u8Q8bt+UEGHOO1TLawGIghPvEaWc2MbZKfULUzmw3tCt+caCq+B0OJZrVVHkru9j/nkggV2s8tNKHE/PVwkvrOS4jRqXqJs0vEaAUq2uoNx+8ZZc68ofLoDs+aax0zcQQoYS2FngDJQ6NJHjGRxj2CCgEz2XV1erKPzgr79Z/n5uqwNG3Gt+DADIBGsrNzuX/062cBkGtjkf9fUrq3vp8jWQkE2Wd4aaHPRKOC8grR6dc8Tce7t+vjW9fi5IKiykp+3N68rAak0ecBIrXeSFr3PaM2E8kU87EdFJESONAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10Y/pN9zzZyq5FpSK5ush7e+XYwTwTQ2g3oGNW5huOo=;
 b=vFk5aZgDzkk8eNGCPzh673oumd+0/b7rlR9qTgOwtydAQ/4YFprVmcAhJBJbG643WCKk7lqyfG+FvpLFAzEejN23a5tk0T1AUJWgof/kdztxb+gCbXWqnrU4K2W4xJckF3558ex5k88aUg4KzgK5oI7ql3h/WsTB1MLzMUoOMPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <77aebee5-92d8-304e-5cd0-ff6442f82f76@citrix.com>
Date: Fri, 10 Feb 2023 18:51:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
Content-Language: en-GB
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-4-jgross@suse.com>
 <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
 <8c007a9a-1466-f200-d7f6-27c81622ef27@suse.com>
 <20230210124444.bc7siuuj5dwgf3pb@begin>
In-Reply-To: <20230210124444.bc7siuuj5dwgf3pb@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: d6004c88-bbb9-43ff-c876-08db0b97c89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SqxdOARle0P5a+RGsIqfFCM62zY3cD7oXZ6aC6uNKkT9T6NgfIhdo3ALbB8KO9mfDHVXZGgp8rUeJyhucaNrmqL0baEgG6LFFQnmlSc5miCvV20lr95Us2Q14VMjtPhezU1c25y69Tz5edIfMICEVTcGaY4sfWl9rxoLUryJ7k0lWXRG64XcZZrVvaenI47pcr7mSSezHzF2nAq2Uxh26qhIUSxLsv9yjKbfQDSoDOluZB9suI4o8UjxYUCe8Si20gldXk14Kw/QxPQwWbkpAAnjM5/57h9b6yaTdugwGmaGAbwntPTh/sWFfQH0tnWlH9tPx/QzIkbmGkY6sQi8Ec6op5MmuHL9D/S+LcSX36xCTDu51uwE+XQOqQVvzcgngLeIxr58Zu+2HKksfsql7AADa5kMP5Qy7AF3nNTXZjS0D+yoCBRjCnscO0XHh4Cx26VvAOb8mZB7iMWBUPlkdFWnTpJxsSBc7MD/2VU4HXTLGnyXmQbhTv7D15Lv8DikmlSmNOFKRm4Rd1nNm+ifbvFRDi/iwx3C1zUFfZQFvEX7yqQr45MWrY3qsAYbH8iwRjwcM/ELMLD+HIbwLO/qOo4troFrh89BVQF0Oxz5oZ8BUWtpah42z/0LVZRJuu7NyCQaWN1fgZjOK26u7ISQpv/FCTa7rzhkky/SgvvZEdbzCo5e3BbqMmqS1ozVIS04VFv9b0zJOpOLMrhxGXF0wz9fn14MPc4lo5maRZ25baI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(66946007)(38100700002)(82960400001)(316002)(41300700001)(8936002)(8676002)(66556008)(66476007)(2906002)(5660300002)(2616005)(6666004)(6506007)(6486002)(53546011)(478600001)(186003)(26005)(31696002)(86362001)(36756003)(31686004)(6512007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUFjZVlOQU04OExicHhQYms2UG91amFuS3RsMkY5Y3poYlpnRGJqZ3hKVXhY?=
 =?utf-8?B?elVCS2krN2x4YU5xcGk2b1pTdm9sdVdaT3FPcThkcS9kT0lVUFlkQzZmUXFN?=
 =?utf-8?B?ZXZHRHgvK2RYS3NGQnd4YzJXTU95eVg4emc1Y0RNN1NqV0tGNUU4L3Fjamdj?=
 =?utf-8?B?YUcycEVaNTJ6TnRuZlBwa1pDblVQc0xVY1VBSGxEQ0JOaGRsQXo0cythbjQ0?=
 =?utf-8?B?ckVuTnM3RGlmSXNQdEVlZ2FzOXIwNnBMYjY5TjZVREYvZGxicmZ0TldlWDFs?=
 =?utf-8?B?ellaRVE2UEMvQnBRQ0wxOW5RNU1vSDNkUzIxa3RScmNXVmthTm9GU3h2NGVa?=
 =?utf-8?B?TzlRb0E2Q01HdlhqUEZEZU1nWnExUW44NzFMK0g2NFBGbkpDeXpPeFVGdGhr?=
 =?utf-8?B?UmJQNWlhb01BZFpDRlRpYllLTHdxd0dKcGZ3NDRTZzlzTytZOTM5eUloaEox?=
 =?utf-8?B?TUR3V29vS2JyVWVIMG5EWXB1dTRLbWs4YXJ4QlFnd3Q0alNtMk1vL2dGZDFQ?=
 =?utf-8?B?WDJWSVFIdHdncXVPNDZxbTVqakFsbXl0b1F0ZDRNb0p6a212cHVZRHVVcmYr?=
 =?utf-8?B?Yk1RNjhCMWVuaDJiN2FtVGxVS2JwWSs1U0phc09wYVFXQ2o4WkhiTFUzMUFo?=
 =?utf-8?B?OWZmTnBRaklwN1lYaEFaKzg2K2VUNDQ2c3VWYlhSVkJkVDVLN1U4NGcxWHBi?=
 =?utf-8?B?YmNRYkh1dzJ3dlp3QlVrL0VwRitTVE1GT1F2VWRhSXROM3ZQZ3hCV0lBVjB2?=
 =?utf-8?B?K1NWTGt1ZXJ2WElSczl0WG5lck1YQTM0L2hqWDlidkx2bU9oUkpXRUZkRXBR?=
 =?utf-8?B?NEQxMXRhSnljREJKdWRINzNudUx4OGI3Y2QydjRzS0hheFQ4eUhvZlEvVTBv?=
 =?utf-8?B?WnJiRkpuVzhGQlh2dXJRbndMSi9zandKSmZPWitBb0lzbjN5WWJ0Nzl5Q1Ev?=
 =?utf-8?B?djhJemhDVjZSVHpCd3pkZ0QyeFVTUnNBdzQ4T29hbmE0K3dhKzlBem5idlVy?=
 =?utf-8?B?dEMycjRUV2I2K0RsRjFkcmVNcWIycFFJaXlYbmhPUC9CaGpiUmhtUkJTQUp3?=
 =?utf-8?B?RU53Qy9ka0EyVExRQXNiWlZRUWRZb0hlYkdlMlFLTDJkUmxxRVljd2lXbXZC?=
 =?utf-8?B?bWxSWmxIYmVMbk5QdzBUMTZRWG13WC85NnJUa2cycDh0bFpGdCtaZlhFQjN5?=
 =?utf-8?B?cnVhWDJ2YXNrRnlhbWtyQkJ2UThkMEZYbzBLVGR0UFY2Q3lUbEc5S3VKdWln?=
 =?utf-8?B?VCtHOTZpN2wvdnd0UWJFQ3VmUkxqMjc0cUFvWnNyV0FjWW5hMGhLblRjN21m?=
 =?utf-8?B?Vm9WU3ZVMXRRYStpQVJSQ1BndWY1S1ZSWkl6WElaUkNZeURJbXFNbFRFYU5v?=
 =?utf-8?B?dmpMbVZvaGljQkxMcVJTak1nUWJBMFV6cWg4R3pLUjh6VkgwcjdEc2xiNTZL?=
 =?utf-8?B?Y0dMUndLMnhrZ3UvS05UaVlkckhmLzhWVkR1dTZycTZxNmZzVlVhcnRId1kw?=
 =?utf-8?B?M0M1bU1nc2w1bDlaTmkzaGxZbjVTbG5iRjZNRldkM0ZFQU1pTDZnVzZ0N1RG?=
 =?utf-8?B?ZlJQb3NaUzk0SklyeUdVK3MwQVlCa3Fjcjc4UStRNTlHVXBXMGRiN1pVeEQ1?=
 =?utf-8?B?SUxqVVJrQmw0UVZMVUxqZkdaQVVHQ3RObjhkS1dUK2diaURhQlVlM0ZwK3Iw?=
 =?utf-8?B?bkxYNExoYXdkZkRoU0N4VVdsczcvYVhSRDVFajdnMGZqRUhNNzJkVXlSK3ZS?=
 =?utf-8?B?WWpGb2l5OWhzVzRkOUR0Z0w0WVluU2xFTGhWeTVucDRsVFJ3ZDF6VmVOcG83?=
 =?utf-8?B?NFBnNzlYTEZxM1BpTUhQZ212VlZaSEY5bTRmeDQrck1QTVpBa0xtWmkybFMz?=
 =?utf-8?B?RHFsNjM0WFo1ZTF1TU9qWDhWeDROYnNFMUhrdnRiZDdTaW5jSUVZQjhnWUw5?=
 =?utf-8?B?aW44djhKc29Dd3N5VVN5NWJlUGplMExXUzJzeVBPc2F3S3I5UkxQUmdWU21J?=
 =?utf-8?B?dCtDaVBHbjNmY2NjazhMOWtsTU9RcWFYZGxHRHpYWitmMmxHWEpFelpwckVy?=
 =?utf-8?B?bmF6NXJxcVRGT041OVBXUy9UaTdVaE8wR1kveEc3bmRGZEdQRks1RFU5ME5V?=
 =?utf-8?B?bE5OYlVnQ1RTeUE0UzIzTjRTb0tMSDlucmZ4eTRlRzdQS1RMM01zMGorOE0w?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0eQV9svz8HuGG+FDncfgzHKISzcV7MdHy51cUCgrj3nMlngf6d3TKxf1ZHOxoE3sxGq/8PRQfkf8DHEqtUUChOEC25xVrVbdGW1qJFwBgqs0VzdUfsIdjciQ16vzWWwn4AVGGrBkTuJpcV/lZoyykOcKM3bwFLIrPLYAwlpnG2rkSmoaNMB6awI2dBshL+bcUURuaRjaDuEpLpBZogCcuv8aKU4pATykisj8p2EewGM6ympSNsBKlcPXs6lMgZ1ImWE4ZOvkUQunvTtws/l5gDYOH1eQLE2m3AC6q5/OLGlwEACkZHbHc9jmvWLjl04srUtOcxdTSPkMPawHlnrf92KcUtpwrLgwdo0oDbiQTLP9fVrL2VhP+Vc7Uapguhi1lJa/87teF8dM7uMDrIL9+Ps/UvndmPJDW2sXzAZ3rDv5dG9WO9f8HW25QVoui23sRk64mDlwxRQ3BxGj40JjZdMboxBJOfIy46sADch4dg44GQjvc2d1GJ8H/vTEtm/sHQHrWYOgj3MsyaOipPiIjblvIVMtPYIrmEkwZG1xcPDhOtLusG+wb4lmPgypW3tpTL87ncLhxGVlZNSTwJWVPnEkiFRmhLq4OYH2Wfx3owCaYLVZfQ6XeZMjoBcmovAAiRZaiuSI4iqTco7cqQgU6R2UeeUWJYFDwoUS3ko7ef+SbVd1WkqdpbTc2MfOIQ1lSpW32s5FNPmxxt+/EnRzV/cma1DOakvC8FAMCRbECNXkIwyc1SgbS0jK8+kAeaSPVNSSgH9nriyCO05raHQ7bemN9rTYC9psin7YCIdaWSfvQyMzsxk7KLRM/wHlvKgE3qK4GfFvNzQT0vpg7FNjZ6AWzNkjY+2fAJ2rd2DGvQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6004c88-bbb9-43ff-c876-08db0b97c89c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 18:51:14.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrKiGyiIDTStX+ytGR+lWiWa5p+0eanqcd8k0EPicHAsMZHyW6bWYSOvAve7l6fJ6JnCfGPMUY53+i7tPnZXp493qUv9jqHm5e4RJCudaKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6138

On 10/02/2023 12:44 pm, Samuel Thibault wrote:
> Juergen Gross, le ven. 10 févr. 2023 13:14:20 +0100, a ecrit:
>> On 10.02.23 12:43, Andrew Cooper wrote:
>>> On 10/02/2023 10:46 am, Juergen Gross wrote:
>>>> diff --git a/lib/sys.c b/lib/sys.c
>>>> index 2f33c937..dc8a8c69 100644
>>>> --- a/lib/sys.c
>>>> +++ b/lib/sys.c
>>>> @@ -339,7 +339,14 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
>>>>       return fd;
>>>>   }
>>>> -static struct mount_point mount_points[] = {
>>>> +#ifdef CONFIG_CONSFRONT
>>>> +#define STATIC_MNTS   4
>>>> +#else
>>>> +#define STATIC_MNTS   2
>>>> +#endif
>>> This ought to be
>>>
>>> #define STATIC_MNTS (2 + (IS_ENABLED(CONFIG_CONSFRONT) * 2))
>>>
>>> because it shows where the parts come from, and is much cleaner to add a
>>> 3rd one to in due course.
>> In principle fine, but I'm not sure it is worth the effort to add
>> IS_ENABLED() support to Mini-OS.
>>
>>> That said, it would be simpler to just have a total mounts set at 16 or
>>> so?  Does a difference of two dynamic mounts depending on CONSFRONT
>>> actually matter?
>> Probably not. Samuel, any thoughts on that?
> We can probably as well just have 16 mount entries indeed.

I'm happy to fix that up on commit if it's the only other issue in this
patch.

~Andrew

