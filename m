Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7D76B03A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 12:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574053.899255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmDP-0005d3-Be; Tue, 01 Aug 2023 10:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574053.899255; Tue, 01 Aug 2023 10:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmDP-0005aL-8H; Tue, 01 Aug 2023 10:02:55 +0000
Received: by outflank-mailman (input) for mailman id 574053;
 Tue, 01 Aug 2023 10:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQmDO-0005aC-3E
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 10:02:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7d00::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94556e74-3052-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 12:02:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6812.eurprd04.prod.outlook.com (2603:10a6:10:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 10:02:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 10:02:50 +0000
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
X-Inumbo-ID: 94556e74-3052-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLSHL4aCJbmaLWoejDSO2HK8Tq+j25oekT06nHDWGrgHz8CwdhmNxuAl0Z+0SsE9hQh5tQHysdoLrzHPmqjIShWRZJQzifA1oHEmcVWD/Av1qDkrZ9PW9HloeCTp4uX6tVu0IeUW2I3Ytui7n7DkyWjrBLfDogJ1iuRVXGcXWgyDSfHKk5BkdTB410a2joml+rJCqv0tuXA4naPnKhHLZZEzIRBYmWtWNHOX27BYtWLVGZDdyk0HAHN0bsfuRJFTxPj1vSYheEBIoRYQWaHz8vRrrLk6OCMZyKS4P2c6amq9taodYREVOYFhzmdWKFXYcDdauERD7jseeI3Sq1oWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7LyG1zoyz3OS5EGkp2uO6EEEnUE6rD+iMNPMFIRNiQ=;
 b=bQZTOL5PRciSDxVnd//G8NSfeR10GQ5FlReF7+76GxwclAMn2lcE2PGLXCXDHd+2EGMbmn6OFLIo76A4Ho9+ubTCGBzHheZqMLwJ9te6MI7nPVIO4Mv5oqXLtarTDRdg91g7aU5TE1mzR4NM5pr0+d5r6HCmD6r9xEPgAOOwencnkBTDAsmgqmj7DTFokBYGM/HbSAO9MWgOBNXTjXzFeDUVED3BM2L8P28uA7FHvYWDeZ50ixzkSI/z+5WGivTgeEq4Eq7tgcpbV3MsD8vMRfm9monJwLrA3QhieGNuTMaJRlynxGHV5rxigiqpsdIv6YmHsDNCBdQhbpL0c1F4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7LyG1zoyz3OS5EGkp2uO6EEEnUE6rD+iMNPMFIRNiQ=;
 b=vEtNBMv9+pHWk5Y234Jzpx1Z9S2QZr//y1UXxhtCNHmdBgWZMYhl61HGrD2WU6ZPwZn5YVImQGduqZVFBYaVagUCdnT3mI2p2zmyQAcdjFRDUbNBvk4+vQXAAlfw35l1AJ1OcAwKoqjA3rb8LmxC6NXPnEK41aGh3iPG2M5AoXMtoOb8g1GkSJ2eGzcU5uTR+bxdhrylES1iSecDerg1iWa9b+10hqfMXTKFdHoeaiguZU7XXZs5/sMTSrhgMnhbnBsQWtdIyL5igjhIC09FYGvO+5qgo27Z3QBwuvxfhQyuiDyBq6lJsQNXcWZsZCjITeHlNFQCGg5bXcmX7Boc0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0dda351-8058-a35d-2cf9-ea84d178f771@suse.com>
Date: Tue, 1 Aug 2023 12:02:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 0/3] x86: Some MISRA Rule 5.3 fixes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 148e14cf-3075-4cba-3f0b-08db9276770e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	St5ccnhY53u1p7XqsPjaf1dSMs6N7NvBne7J7w6NtqMyqVvJsrj4OoF/I+w+O6qZs2neW3dAZiKpwsZnRlBrAZzVaUYN8DlcWtODh7FFfkkjv+L4LJvhRNrSbaYsSGMRTMlVfhiAbI3+6qH/7A8gmjCS8qWGgvc6AiF9e3vSvWV2z3BHCMyKQIL8gmTTNxJsBgjoTLudsyp9DN0XgGXw8OH2/Q3QdtHreltz1bsyPg2CMacDtqVJdbGMM6I+9+qvu+kUF8OHPN2NbaQkiEhs+HB3bY/JBRHffa9EX39OAkl++sdii63NSgxjgNiQ07ywHuqxawbkpD4hrSBgwNMGL0V6A7rwa1Qmh5bv7zZu4xoTOu6dkRapPT3ka0Dw1AmE8EEwXxhRx7RGDVZvLNCNXlHxFI5lFzj7iYyrRapF1I9stOKtaqjfYkaIRHzN8q55qRLd4l7oXAV/8x+S/zU8+PbO/QFW1gWvpGjE7gFY+6pppD/rLPyz2+dhKoOFDmyfNCjbNqVGmRHKQuUZwtd3uB8tEkZGJEzh+cpuTCXCuxWxt3NaNsY3o/0g/qy1YYp2QobdcQB1fHfNqIdXF84sBN14IbWErKHPH19RNbbHh9BXPQ8UJ4IlvDIfVGjlvrhMrVnJZv1/Ws5btkLCi2of3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199021)(54906003)(8936002)(41300700001)(38100700002)(186003)(478600001)(6512007)(2906002)(83380400001)(5660300002)(36756003)(6486002)(6916009)(2616005)(4326008)(4744005)(31686004)(66556008)(66476007)(66946007)(8676002)(31696002)(53546011)(86362001)(6506007)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVA5TkM0aWtZSlRBSGcxZTF2dHBQU0VpOXU4VjN0MGdYY0xRT24wMkl0eE1j?=
 =?utf-8?B?d09hV25wQSs2MStvMFJFbzQrL2k4UDloRnBHZ0dIa2g4bmRFa01FVnFjS2pY?=
 =?utf-8?B?VWRuc2x3dW1kMVVPWjJGMW56OE1lTjl0Y21BblNMVlR2UjFLa1VDZ011Z0pV?=
 =?utf-8?B?RmpjVXdvSmVhL0JBOENWTm80b09MU0dZamNNYjFLNm5zbkNINkVVN1RmUmFu?=
 =?utf-8?B?aTVnZW93VWpVR0l1S2tJb2FDeVpvNmpxYzJ2UHlpbHdkVDhJNUJoZFNhejlz?=
 =?utf-8?B?aUR4WUNodkJEOU1waXM3aGZnK1IySFhKdloxN0NlRnJjQnMvdENFMzEvNldt?=
 =?utf-8?B?TElBOEdwTlRoU3o5bEFSZmVzWTVqSk5TM1Z2K0JmbStZUVJ6MjgxS01MNllS?=
 =?utf-8?B?U3hDTnc5SGhZQnVWVkFlWW5iQ1VzQXFOb0Q0UVVDYW91T2c5OFRaaThIelRZ?=
 =?utf-8?B?MjNKbnZMNVVOVUtiOEJ1NVRuQWVBNVlTR25vTnYrOFFTd2RWYlZkdkpWYU1m?=
 =?utf-8?B?bEhkUWNYdnNxdW10dHpLUmdTb044aWR4Si93cEs2bXZ5Qmh6MGRVdnVMN3VN?=
 =?utf-8?B?L0tDYnc1RTFRU011b1NDMy94L1lWSy9HeFZtSlQwa0RMTjZPbWd6NEtvZUVL?=
 =?utf-8?B?U2dYOTNsRWJIeXhjcERtMVRHZ2VkY21zaGgreFNDOHpoWkRZaDRrUG9EVWtX?=
 =?utf-8?B?ZTg1aUR2RnI0THlERHpUOHVQZS9taFVGOHBHM0xYaFlvM0wyQW9qeXNheUpw?=
 =?utf-8?B?Y1Y1bmIzUnRVc2s5MkZYL0xGRFRETndlcGJVRVJFZ2hxYk9nNXVLRVBuc2Mr?=
 =?utf-8?B?VFVaVXlhYnlSNGNKUUxNTmF1dnBuRUxlQkhFOWpQYzRjR0oxakhZV29vVFA0?=
 =?utf-8?B?OUZCVS8rejBkWWo1algwTS82QW1Qdm92MXd4M1NZaGpNU29NZTY0cVFYMzBP?=
 =?utf-8?B?d2JOSDVwUzA1OE0rTUdzM2RVakRKOXk2VGdrRFV4WWRFNzZrZFFaNzBqZ0dU?=
 =?utf-8?B?ZjRsejFuWDhwc1RIeWFLZ0dqQzVwNjZtaUxJenV4SStXR2tibjYvNUhzZGl2?=
 =?utf-8?B?eUVqaXpYWngwU2VFZjFyKytjd0wwSVBQMzNQV0VFUlByUW5SMDNGNFZTWnRL?=
 =?utf-8?B?VzhNUnh3MzR0K3VWVmliaFNYa3FSamlBS0pqZzNYcm9FRmp1S3A1MTNUTmN1?=
 =?utf-8?B?N2hRK1hpZDM4Ujdrd05BYzZRd3JKL21kWUdGNEpBeUdwWTJzbDNQT0RBZmtT?=
 =?utf-8?B?N3dCVDRWSGdZM0NjSzJCMUtiSEkzQlZtdmUxU0dBYTBTNTZNbGtwTzNkSWYy?=
 =?utf-8?B?aGgzekE2RnVWcUlPNTROMzIwS2t6amU0MVVlbXJ6d0JueVlBelVqb3BabnQx?=
 =?utf-8?B?Y1Vnb2ptUzF1WHhSTW4yOXZJWnpkR2xxYjV0RzZSdW84UTRRYS9iWVpINzZC?=
 =?utf-8?B?dkFoSWxVZk9FbkxNbHZ0YlA5V2RTNDI4aTdwcnE3ZmIwRHNFSWZveXhweHBG?=
 =?utf-8?B?L2hkWm5lTlBhSldDL1RHQlBBeFhWck52TXVvYVRqRC9uemNlRG5IZUpDYW13?=
 =?utf-8?B?TVBnbGxMZFhDUnhMZHlTOEpWWjJTRmIyT2ZESWYwdUZkMDNWR0Y1b2ZxUitx?=
 =?utf-8?B?NTcyTUg5UnBBQm5lS2gya2VsN3hoV1Uxc0htRUhHNDE1RmUxakx0dm5jTUxr?=
 =?utf-8?B?dnhmbENEcjR0MlgyVjh0ZGtQc21uZU5ENCtxYXFlZjB4YXkzanFIVFVRa2JM?=
 =?utf-8?B?V1UrUFRIWkkyZVhBOTJad2NrMGVya0h4dm9odXhCOXNTN3RQZ0NMSkxKVDd6?=
 =?utf-8?B?Mk5Jbk1BNHdVUkZpTHRvUTdXbklyczlNV1NEQzdDTWN5eWN5c0FEOGppdzB6?=
 =?utf-8?B?SCtmaytZVnN6MktPUEVjM3ZmRDUvYTgvd1Nhcm9VMTA4UFlnMjIxekEwVHE5?=
 =?utf-8?B?dXZCTGxTQ2xpeDNYNnpITW9xcWs4VGlOd0dXUStpcXRib2lnemViUERwa3J3?=
 =?utf-8?B?Njcxa2RNVnFMWmxTVjU4N3dBRnNHTUo4dnZMOXhDUzBlYndtOXkrUTdWWGtY?=
 =?utf-8?B?TEt4V2FIbGNESHdmSFNveVF5L1Fld3d0aWdWL1N5ZnpCay9WblRhUzI2ZHFj?=
 =?utf-8?Q?MxckMV0jdkZl7etJ9nwEkTok9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e14cf-3075-4cba-3f0b-08db9276770e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 10:02:50.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW929sSpwmFLWHg7HZKWjelLVafu9jb37y34s9ZWDkK5aTOWnvLwAkhQQS1axVY9SWg0pCNqsMAhq+gOH2glUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6812

On 28.07.2023 21:43, Andrew Cooper wrote:
> 'debug' and 'str' account for an awefully large number of shadowed variable
> violations.
> 
> Andrew Cooper (3):
>   x86/traps: Move do_general_protection() earlier
>   x86/entry: Rename the exception entrypoints
>   x86: Delete str()

Series
Acked-by: Jan Beulich <jbeulich@suse.com>
with a slightly amended description in patch 3, and preferably also with
at least mentioning the Misra angle in patch 2.

Jan

