Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CC880C64
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 08:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695762.1085812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqig-0001XW-Ku; Wed, 20 Mar 2024 07:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695762.1085812; Wed, 20 Mar 2024 07:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmqig-0001VM-FF; Wed, 20 Mar 2024 07:50:42 +0000
Received: by outflank-mailman (input) for mailman id 695762;
 Wed, 20 Mar 2024 07:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QeEy=K2=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1rmqif-0001Uy-4c
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 07:50:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05acsn20800.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::800])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ae5cd4c-e68e-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 08:50:38 +0100 (CET)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 PR3P192MB0828.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:45::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.34; Wed, 20 Mar 2024 07:50:38 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::181e:3628:177d:1cf9%4]) with mapi id 15.20.7386.017; Wed, 20 Mar 2024
 07:50:38 +0000
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
X-Inumbo-ID: 8ae5cd4c-e68e-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMGKSz2wMqPhSO6xqeZ30Med/ckEivdCi22ro7US5sXxDGKbI8kN4nGK/Qumy59ypBycBEg9ur7CrGJ4Y1bPg6V/frYFEnDcM1+YAxZZRuMzpf7F6e9dSrPneZSCUbXcMlBRyn7jjYLIB62JDa/viBjpDyvdkNdHMITcNuSv/LjJW0PUC7btJz3KXwJJjG3SLvmFp+va/g90FRgdR5l/mAuTCDsRFW3LK0jjuFKjOjRud8prRPlI/9+a29naRBuS5pGfuBCeGVbUUwKh0HsiEQHB2d3/ekO/a8Jo2DhqG16GXf1NiO+07jGHOVZZ+5+Tne5pf6avtJbCEoVl68U+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L09xaIyDfPc1imD82wYwTmT8UcsJA4judxkiTTMaxjA=;
 b=DL2/JVRVb+/iy/LHXeZACWGX6/gUk8wS1idWKaqMYFzfqJJAwiAe8Zu/G0Xgj74zjYQ5N6BMU3wRYG7i0VIATsZO3JIO+zE5AD9KwSLIuWg6NAANXzJ2kwf0338LDgWMPfGQu3hMTh1FynpZrRuRJwzTIs2P/gx4LW9/70289BEk+eZo7tdAApMXzFFFFeFOViEIHluVAOGgjntX4ic4fJ2iLxzsquRlo/96JGhO5ty87hvE5y/tKi/b7Bkormx3F6rIB+ogffgJU5sA3tOP/WFzg5/irC22jl2NVf6UaGZc7LkAZ68S5A5pzmC/Xrgj3uvCFFbEWpxrvLibCFp2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L09xaIyDfPc1imD82wYwTmT8UcsJA4judxkiTTMaxjA=;
 b=uois+tdcleraLQ5xW87TAq5AYD7939tKYfGoEBXsSc03t9UDTV/nwSHoGOFiyxWvjss7UDhCh/3l1ZgX6oCSGurdFeV9ToTz+jO7NvD+L1FXpSzA/AFAokEioHjYH5KVddKvUQD4a9sQEESnqMVtbEaGGj1equyMTvsLzYki9lNw7o/GdcxKx9Evam/+rvH1//S/ewwcid3c/p02T6LPOk7HHj7UrNVgElfZS489hQbRewkGyoKh3ZCJ+2VP29IWg1tRzSQENhzzC+U9/G3UioyfNTPYTv++JjBuTlZFy9JnhH2EvoWT5W1vl8QiqkHy9yn3gm/jzsD04jKERtjEUg==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v2 1/1] tools: init scripts: Add missing XENCONSOLED_ARGS variable
Date: Wed, 20 Mar 2024 08:48:33 +0100
Message-ID:
 <DU0P192MB1700AA0337B5E6598E23EE0AE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710920673.git.rafael_andreas@hotmail.com>
References: <cover.1710920673.git.rafael_andreas@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [XwTrKlg6f4ZATfloz9Fk/iU60x4veSBMf8mKytBR9Ce6Ht4Idhuv0UoRIyNBALfD]
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <963cbb19d73f3d7c7f1fadceac376dfae81beb19.1710920673.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|PR3P192MB0828:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f9d41a-f599-4def-e87b-08dc48b26e8a
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSDAxiCsf/0myDYsncr6f65usFjG82Jg1Mkme1//TIjYHjzju0NSEsT3BOEcjuifrvDLpGRmGntEbBHYBtOszk4h+U9iCNGGZBeaHk01U9hbmSup5UtwbHfmyOD1gOH1W4u9+MY9fDCLGK9XESmEgyOeJ0p+12cbkxXBDsNxz0Q6Tr+DyrG7XSkor1wOEbN/vAIr/yhgSB0KMoD+rNjYsDZpzeMJEeMJRwUJBq/s3TW1XkWPAMCAsBEgx9W68Pfdn9W8xu4HrHfj8DC0zy2xVTaf5o7YylvyaoDW4nKfujeHAhIyeQXXk+YeNO2zfAR0KC5S45MJ9pKE3jqg55DCKO0ZHhmtUJ7fP9mHJkJ/76QeGbghd6iNOLUQKl8atFsoRyC/2gqV3o2Huxg8083jZgIgevff6CvS29IQ9LgcTY0rvdyMZvxUSKNyjiLUeZ9HvdwhtqRHDTnSIR1O6Ay2O3AGUVxAsJyEikgZ/LXrtN3OaCTY+bf/GT/GZkzQUu9eJac2xGyQc26v5dkAlqT70TcKibX+I/MlcFYjTE4sKDsGKS7AySL3+JdhGSVjA5pzUa9zCzgPCKOxvJ8UyDi7kU6ysTLIlfWDU9GZMkdodM88Qm52dHjBce8LYCh0QTIQlV1eCwl7v41VopEbp+bnYrj8/suMbOjD2v5qhyo9lNkneXn/wz1BtDyQO8GS/HrUS971NUoEpPqoZtwfb21o/A1axEPdnAxS0HrBJ0N9t81lBbrbMCZK+M9WUThglZjsMEAySmTsPt9Uq5brC9kkfec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0L7nBKHpBr5MLu54pcKEQRPlzu/xn4zw4sy8Q7MpMLc7B9cjXTUeVpHcbpK7Lm5+j9KSvGup+VzFb/Pr1aBAIncdO78JZ4QAXL9iMzY4cIW/R4hwJWnm9km5T2mS5kmNX7N735Tg4QDFgdNBN205KUiD6nnxfna4Lalgi4uqFbEsxMymdtLGW0XloDSdKXNXBKIKP2AO/KfJZA+QGA2XVPjfBB4tyiegDa73PKewcvpRFJ6jiwjVl3kZ+i1XGaqcBjzkqbQF8WptIBa7iksHdtqwnWOWYKt1NfFF54tEE9iMdNv25f/aQh8Pe0cXnfo+NDV1vGN+FSnajU115KxQAsfJ2duRdw04wIp+0HcX7dfIuBWLgHDzPRuoPXr6vdmDXWF/J2oNqo7yrlR8dMuInX2z8dh4RpbYKKIPjBF3//W6Xtoj5WhMtGqd6rnojxF9IcKHXhOv0v0We/q9tL0Lo9jBershfhdQoG/uwxLyQjFeK6p3Yh0ClWuxW1gVMkEkydPOKTXhIzn0MsoG8T4KKfjgFwE+i4dKvqQ3mjjZU0ejZTfrNq0ZXW5AdNO6uz+k8NrFo2Qc6eLLzrrMFcG/FWww4vNEs8v2I4xwR9qbDg85HLkqXaHOqRQr2FcugfAv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGVPOFlhOVdmODdhcnRtd0M5VkJmR210eW1HaU1UcHpLNUNJREdFWHZMR1R6?=
 =?utf-8?B?MEFTL0tBVi9pV2RDUG5naG5tVTFvc0xWd3pFUUFsWjNaMS83dnh2Wm1Qb3Vo?=
 =?utf-8?B?WmFsZE9MR2U1UnFuVmwrN2pNZTdOU1hjZDlpZmsyYnhWek9UWUNwc3Q5NVBI?=
 =?utf-8?B?RFhldGZtMERhOVVOUVhtcGJENVpTOTRFelkvQjZRdG9zV0hPZmRhM1ErRFBH?=
 =?utf-8?B?V3hBUmFxakhNUnVpSU92M0MvNThLT3l2TER1cVJoZDcwcnBtL2pYNG1VdUR4?=
 =?utf-8?B?d3ZFTm1GUmJ2VHJ3K1JNSlFTU0I5TXVUUW1VdHkyM2FIMUN6MFgxM2gwZGNT?=
 =?utf-8?B?b09zOVE1WTBjekNzVDZxaUtWQ214Q3ZGSGg5NzBxbzFOUDhRSEplWGRUTGhj?=
 =?utf-8?B?SDloN2lFd3NyeFNqSTd3UU4wOEZPOHVPZ1hmVkRQV2RMemdkcDRBTlRRWlpM?=
 =?utf-8?B?ZHRLeHkvNUxoWjlDWUpKSHNmUDRXQ2I1VjBUaXlHTGZuOFhZSm04YWQ1aTE4?=
 =?utf-8?B?d2xFZzU4UHBzMmFsSnVjQlJ6R3VtQ1BSK2NKTTZlNHczejdxTUd5Y25MMkdI?=
 =?utf-8?B?VHRBTy9DU2RLUVl0NHIvRG4rajYzZC9iREJCVCtvVml2Yk1kTHRnOFoyZjRP?=
 =?utf-8?B?ZGE5VkRWdmdKaHhQbVg4QlE5U2dWRzRrVWY5azFhUjJDRjNJenFLYStlUXBK?=
 =?utf-8?B?a0pSMkRURkpaYks2cmJsSGh5NHFhS3Y4S1plRERhSHZKYW96eW5DQm1HQWRt?=
 =?utf-8?B?SDBrSFBkNk9tMXpnR3lkWGcvcEsrWmQvbysvbCtuRmJFeTJ0YkdNeWQ3Nlo3?=
 =?utf-8?B?ZGNqb0p1NFlMcVFlRFNINm0wWGxwTUZ2Q01JQ1YwTXNmNkxqMUxSWWZLSGU5?=
 =?utf-8?B?ZmJjZzU1REs0b3pwd3JUTWNscjlhSUpLOVdUdHR1WWphc0Y4c1JvOWpSYS9s?=
 =?utf-8?B?TWoyUU00KzRidHBTdjh1dzU0ck9VY1JnL095TithemFlSnplZjA1S2pCb1Bs?=
 =?utf-8?B?S1NBaWswUFJNTit3MHJCdWU5Uk1wMTI2c2R4SURIa0JucDlGUDZwYnFOK0E5?=
 =?utf-8?B?WmZTM0pPVVFyMklDUENXYzBvajY2ZTZFQ2hud25wNFppdXRTMExWc1lYZzZI?=
 =?utf-8?B?R3BtbXd3ZTRJQWdnM0pIMW1kWTRHRFJiZ3phdEwvSTBZSVN1cXlZV3BpRG9G?=
 =?utf-8?B?c2VNeGRHY1AxdlJwWm1vcHVIczBaOTFJYXc1bzlkL2s2NE5RSytpZHRWUUNt?=
 =?utf-8?B?WkpEL2o4dGQ1RXlVSmpkOW0vZFZLODJvV0Z6VHoxMGNCSGNadUE1aFZnMUlZ?=
 =?utf-8?B?UVVPRG1kVWJjNi9ncXR6dmIzWUtYS2tGZG54ZjliU1pPU1ZwZ2M5Z3dmcGRo?=
 =?utf-8?B?UER1YTZTM0NKS2J6Y2Q1ZDJvTGltcWlRWk81THJpR0FRZFRqaW5Kc2t0WHhs?=
 =?utf-8?B?TS9nSnZlSDZ3V3FCNytjT0s4QUYzaUlwTU0xbHdXVlFzU0NVaVVoekR0c2VP?=
 =?utf-8?B?SWpxOVNPenBSUkYyaVdlUitESXRnQWhPZ2FFRnVKajB3Umg0Mjh6ZzhyUll4?=
 =?utf-8?B?ZTVMVHBXZHFTdTdwYUYwK0t5RFJnV2Ywa3hjMEVvT1JXd1QrNkV2TWdaeHFa?=
 =?utf-8?B?cWh2L0JPa0hUd1RsYWNWZkJzVkg5dko3S29rQXV2R2p4UGUrU1h3QllDVHIx?=
 =?utf-8?B?VnJMYitCZmZOUndWR2pVd1pQSGZ4RzRPL044V09mUkV6SVBUQW03ckFDVFR6?=
 =?utf-8?Q?LvMIo73vAKa/XxCVEh8N55jdBEiJdh6+IrmWBY1?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f9d41a-f599-4def-e87b-08dc48b26e8a
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 07:50:37.9057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0828

The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
it was missing from the xencommons file.

Signed-off-by: Rafaël Kooi <rafael_andreas@hotmail.com>
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 1bdd830d8a..42104ecaa4 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -5,6 +5,12 @@
 # Log xenconsoled messages (cf xl dmesg)
 #XENCONSOLED_TRACE=[none|guest|hv|all]
 
+## Type: string
+## Default: ""
+#
+# Additional commandline arguments to start xenconsoled.
+XENCONSOLED_ARGS=
+
 ## Type: string
 ## Default: daemon
 #
-- 
2.44.0


