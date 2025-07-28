Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E622B13E54
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061714.1427301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPnU-0005NL-Qa; Mon, 28 Jul 2025 15:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061714.1427301; Mon, 28 Jul 2025 15:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPnU-0005L8-NN; Mon, 28 Jul 2025 15:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1061714;
 Mon, 28 Jul 2025 15:29:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9gA=2J=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ugPnT-0005L2-0t
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:29:51 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29146e2-6bc7-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 17:29:49 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9844.eurprd03.prod.outlook.com (2603:10a6:20b:617::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 15:29:45 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 15:29:45 +0000
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
X-Inumbo-ID: b29146e2-6bc7-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZUuyqeVIlXbAwQxM5EKGa8YxxVFQ1cZJbiPDAjaSpRTmt1X3L7OucBUjY5O5EbcQxUVnHCjIGxTbIR5Gul7sSr2Ht9d9X/yVaAQPfV2dqE/DYpIHwkQqHPCp3I+TKLT8w4O7LzcMLL9DP6xogeV/YwfNxUDqFgnY5PkK2Z7fRZuVn+LHcGek+IGaKnC85g80LgaKXatSF04K+E5mgAIL8tE4A6RbMFwiCXXF02U9HUxteNmKS2JMu+TWfJhRmTAGPaP76wYqWssZbO86qsm6JUing5XfWdg2IubxG8JU3+r/w5djgUbHbCRFlWISeDVQrmXwK4Zf9DEM4Jr2J7anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiY1rayIm9QuEz5CSMRYTji03GJ1OQr3EyZ7QdH40Oc=;
 b=RjvE2g2MQJCYnHzsNzjE2eHj+hbV26YyCKx4q/hg09MIoJra3zfxZXS7ypUrt8h6rCB3svkH1UP0r2G21Euhs8Phtfzd7p5p4l7aafjLwbykh7sRg94vTnJbLbYLoPuFoqTCSmXFf2cFFW3MOy95HWC5aEpdejtYFStxwrLgUVUMDjU+BpcyBjbXZDIejaNwVUfICvN2n4zM6aBRnewJqEoSRXOKPJWsJ0neKrerszKtKSDBE11WFrDnU2LybnjX+ew2UwPpO7nFKg+2WxVBA3oHS2mxqTicXS40frXc6VZNmiFxgZ7Oo8724rC79zhPdLsgVIZGAE4c4fSGKydaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiY1rayIm9QuEz5CSMRYTji03GJ1OQr3EyZ7QdH40Oc=;
 b=VJMmROR4MLeAVSEougK7/CazHtZHf2RSGi65JNMijzMfy4vdcJd8sgPUeDTBpNc61pYqYtZt0PThSUdbf8LlQUcmtHZOr2VTY9y2+w3ucNUe8SZc+Z0HC9OBNYro7Zb8zg6fRY68ueorbCb318sr1GIOeU+lHdNwZrJo1AmKN2EP1B2JocvS4cddJbWU51G9EJJ8+A96X+uiXv1b/2WvOW7U42KZvI7LAEcMLdG2KeamfiBI+DYdxjMrdWcfZagN91gKuEznjnmVZSKChACcmXwDchKPqMLhv9EMBcsMzgKxhrK+gYQPAp9jui6HT23XFVJLF8tDHUPsfzZCRGWt5g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
Thread-Index:
 AQHb/YCHt9uHUQWtj0esBUS8Oj/ZKbRHS1IAgAARIYCAAAXwAIAAGL8AgAANOICAACWJgA==
Date: Mon, 28 Jul 2025 15:29:45 +0000
Message-ID: <7a4b6733-13c3-4f92-9899-f71ac780cf7b@epam.com>
References:
 <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
 <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
 <5b4106be-bca9-4c82-bd55-41ada84c3b1f@citrix.com>
 <f9a7884b-d58e-4ae7-b5ca-ce751ca70245@epam.com>
 <091fc447-93cd-4f48-8f5f-e2b7996aa8bf@suse.com>
In-Reply-To: <091fc447-93cd-4f48-8f5f-e2b7996aa8bf@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9844:EE_
x-ms-office365-filtering-correlation-id: ba4fa129-dc47-4cb8-84fd-08ddcdeb9506
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWpaQmNGSjloWUNpR1cwNXU5d0RadWhBTnprQWo2V2x1M2l0SjdyT3VGS1Bx?=
 =?utf-8?B?bi9rdjFyUjFYM0FZZ3dIU1BaNXcyK3J6bWRCbVJiVTdPcUlqQW80cktaNXhz?=
 =?utf-8?B?TXk3UEFXUDFmRDI5a0QrbnovNEpXb1h0QTJZOTNYenNZSjlnelRJUEVtcmtn?=
 =?utf-8?B?d2FDRHpqbTdQQnd6NS95ZzE2aWtIa2lDV2FFNGQ2UERIZ09lc1FGK01kRWVS?=
 =?utf-8?B?c1I0eEpQVXFwVDhqVnZjVGhyWTdWM2RMcjBrSXRRUFhWWXUveXZPRmpNd3ZH?=
 =?utf-8?B?RDR0YXpQTHN0S2pjNnlsYTM5bVVoWjdtY1NtbVRtL3NXS0lva2kxWisyNVZu?=
 =?utf-8?B?ckNoazV4MVBGZjQzWm9jZzRMdHQ5Vlo1N3dBd2lIcUUzL0dsM1VES3diMUhL?=
 =?utf-8?B?MlBEVWgyMHZ1eURVK2FJREZJRTF3ZzFqNVJJTVlPMCtrZjZFVGovQjBDSWFn?=
 =?utf-8?B?T3dBSVJFcy9nNXRhUjJEUWdNRUErd1FQNytNMk9Ud3M4VWVkZnJZVjJYRlNZ?=
 =?utf-8?B?WDl6amZ4L3hKOHdXbWJWSmU4QlRsbGVOTnl4ZVFGNTFkdmFrNy9FN2haTnh1?=
 =?utf-8?B?cnZZMGtnLzV2alpHcG5ISEswWFZOa0ZsNXFhbEJlaVA2dVZacFdRdER5RDNH?=
 =?utf-8?B?T1Q1aVQwS1Rva0QrbDNKSnlPMUJ3QWkvb3FjeGthUUtDSDl1RHVFMmNib2kr?=
 =?utf-8?B?ZVJIMkdJbDRrZ0NlWVJDN0FzYWV1NzJidHZkK25abzZVUDFXQ2RUbUNtanNG?=
 =?utf-8?B?dmhSVHVWOUZTYmNpWUJwSVVHSnVLWlA3ZmhSSVpnb1cvZWRIN0VNdUthWGdr?=
 =?utf-8?B?ckkxR1dtdnYvY090T3NLMTBVRlIyOStWT01YT1RlZk02SHpwVkFTQjVmenpE?=
 =?utf-8?B?alBFOHFneVc1eXE4MDRPMnNTYzk2dmZWeFNQamNHNXlCR1R0QVhuL3puM05z?=
 =?utf-8?B?Yy9hU1EzUHpGU0JRbWlDaXFmRU12Rmt6T2Q3VjlFZDhmdThwNzNpdVZxT0dz?=
 =?utf-8?B?bVVocFhzeVhOcWpXZEdTTU1EQlRBd09qWlJ5OElsaGpDaWc2WEdWajEzWjZ0?=
 =?utf-8?B?cmtIS2hIYUtsVHhndFF4K3dXOEVGbVVsMUM1WnpmYi9HWVpVZW9OODRjalRV?=
 =?utf-8?B?OHNpcERwakE3RmtEZDJ6WVNzRkFYZ015K2VBaEpDQ1BscWwvcUt1VkdWV3Rw?=
 =?utf-8?B?eWpNY2NNYnBJYmZBbm8zTysxUjVuQUNOTXoycFNTVkgzS25hR1Y0STZyMTM0?=
 =?utf-8?B?SWY3WkMrb0N3M0tkTFFyays2NDloa3dSQTE1azc4SGQ0WVh0b2hSRitDTVYw?=
 =?utf-8?B?VG8rRFpqem9tUnIzZmw3VVh2VlVmVStYZEZlRDRSUlZVMFVpVEwwTy9CSWtv?=
 =?utf-8?B?QkdNWk5ZYjQxNUk0MTRTV2l0UVNQNlM0MXBDekZSQ0swU29MR0ZtUTFGTXhq?=
 =?utf-8?B?OWVvMGtqb1BCU2F4eWg5TlpjS0wzZHFJSlRZRFlid0JPYW93RFRILy92UElw?=
 =?utf-8?B?UXl5aVI0L1NsdXZvZFI3MWFkSHlYWndQa0pTb2NZM2NNRDNVUWQzOURxWTNV?=
 =?utf-8?B?NkE2SVdjczlHenpSTVZOKytjSFc1TVZlTE83eUs4UXNWUHN0bFltY0tYeXRi?=
 =?utf-8?B?dXVkUG10MDNGa3g0STJtaDFad1U3QUhlRzNyanA2Yk5XY3o1MW1GTXFNUFNP?=
 =?utf-8?B?ZUk5NkZoT25XZUd1KzFGYWRMYjJPRnlDTzd4NXVTbitDM1JhMThFbGVvZ0Zs?=
 =?utf-8?B?OEJkbXBKYlFieXhKQ3B0YjNCOXYxbXFITXVMNis3UHFEMm5iQUNOdkRmQ0ZE?=
 =?utf-8?B?ZksydVhyaVhmU3d3UEtDRVg1bUxUSlpTWk92RHJydEpPMWFZZ251dWNUc3o5?=
 =?utf-8?B?cmJmRU4xSGIrMEhkZ3JLMUVCdFIwaVJ1V2pFdFB5cGU3djkxQWx3UkpmMTBx?=
 =?utf-8?B?QmQyL0ZpenNnV3VGcFZBM3daTStKVWRpZzFXd1E3YTBUcmNZQkNDdVFabEM1?=
 =?utf-8?B?L1JPNmhYaGlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkhjQVRyb2xtYVRIZ2JPS3ZVbENDaUloWmJCc1dpL3psaEtZUUpFbEQ5ZzNw?=
 =?utf-8?B?cE9nT2JhYy9RcU5nSUNXSndwSkN0RDVwRjZVUzhHRzZNSy9iUnd1UmhQMXBE?=
 =?utf-8?B?OUsxUkpVQ2U3eUVQS3BPV3Foam8xZUFmQW00SEtmNGx6alBUQkhkSW9lK2Ev?=
 =?utf-8?B?dzhNZ1ZTc0hORWdIaUZZZnRKNUV4ZjRicFd2VmdzeW1pWERoNkVKNXBQbisy?=
 =?utf-8?B?dlhTNkFXRVROTzBlVTZ1T2RXby9zcVQ1WUt1bnIzUlpkRGZRQmNnclZTUU5i?=
 =?utf-8?B?K2JONkZiS3JuY1hmbzNjcTVldldReitOU0QvMndzMHZ6MlI4Y1hnMktpcGE1?=
 =?utf-8?B?azQzaHBRVGpZMWtqeDRZNHF2QXFnRVR3L1hYY2RERC95UVpzdzZMb3RRV2M3?=
 =?utf-8?B?ZlE5eFphK0lhMmV3K0h1KyszcUpLUEQ5YXZEMSttSURSK0RkYWRJcWszamFH?=
 =?utf-8?B?WUlrU3kvRGYxK1ZDN3VlWWFHTnRjVTcyeGd6YzduQ0E4MW5pdlR4cC94SUkx?=
 =?utf-8?B?OWM5Mm93U2xSaHB0UFVNKzNqTERSSGFjaWFJbUhTL3dlRm1iSXQrZyt1ajNy?=
 =?utf-8?B?b0tWcUZ5TFUwMU5xR0NtclRPZHRyeXY2UHNqSmZ0V2IrRXRxU3ZubkpCbFVL?=
 =?utf-8?B?UmJlZ0pacisxNXZLNTVYRDg4QUh0YnQwUUdQOXFFWFhWVjRRQkxiL1JVNmNv?=
 =?utf-8?B?Ry9xV3p1bStiRkkyb1dYd2REOElkUGNsNW1sYmwwS0JYZy8xZjlERWFFTlZp?=
 =?utf-8?B?aW9jcXV0YTNVUmd0TFFPRllrZkordWlDTXhXQ3p4VjQwZHRYaVg3TEpJMjA5?=
 =?utf-8?B?YW9nRTdYUVdScC93cHRKNFZHRXBEb1NaVC9QYmwzajljRWppM0dJMUppVlpa?=
 =?utf-8?B?cHdGYUFvdXJVUkU1VUVZMnJzL05ETC9CM0RGNUVmaXhURjFGOEFDZ1ZBOHYx?=
 =?utf-8?B?eUQ3a0J4MmdKVWxRd2RYdWs4ejFBZnFuZHMwcnBNbUpnSUxIZ01iSG1Wb1Vp?=
 =?utf-8?B?NTEyQ1VEN3FYZ3NDMy9qRXp1dW5ReWwxem9uRnR0dE9mTlF6VkVHTGpXUVA2?=
 =?utf-8?B?OHhEYWVuckFyOS9hcWtINXFidFljcklzNGhjQURzcWFnL0FOQmlIZE92TSsr?=
 =?utf-8?B?TEdRb2lHcWc4c2JPZUUxc2ZnbFhrVjdReTYrcGdrbTlCcVVJb2dRYmxvdnhQ?=
 =?utf-8?B?aXdzNmkzdndDWVpyaVZTTFY0Z3dFTWwrcXFML0RjUEZ1NlVMckNKb3NsbklX?=
 =?utf-8?B?eUo0VVFaRldpNmhzaFNXVjlVT0ZKSHhSU0FyN1NxTmxZVFVVMk02MmRGWWgw?=
 =?utf-8?B?UG5VNnJxYjE4Zi9SbDVMZE02aVZWRS90M3hMQlVtNzg4RHR0ZnFTZ3NIaXZm?=
 =?utf-8?B?Njd2RU9JUnFrOEZydDVrdGJXK3VreWxFMnRGdXVRSXpEendNTEVLN3BPUDBi?=
 =?utf-8?B?YWhqaEpYRTE5ZHh6WkdUYjdaR1YvaUNUS1VEZFJWdUhDN3hTa0xNdUF4Rllj?=
 =?utf-8?B?OXpHTzZJVnlkbS9meWVMRWRpVlJ5OUNKTVNCSndhNHd5Vm1yQlRkU2Q1b2lq?=
 =?utf-8?B?U3d6VFVzemNXTkJCbjBLb0Y1NURmLzEvTzcvdThEVCs3ZWhiMHZTaDFsakNW?=
 =?utf-8?B?b3VPd2dPWXR0ZDBUTnByTG50YXc1L3JqbThOcFcwUlc3ZkpkSjZoTjVReCtu?=
 =?utf-8?B?MVlNSDFlU0ZLcVZ6c0htUkxLYnYrUU9rd0t0MDJlc0w5RUlTajhYaWZRb0pq?=
 =?utf-8?B?UjB1NHNkZ3VGY2xaNGJoSmk3SHcyaVNieUNJR0YrMVVWSnowTnZqUXd1di9X?=
 =?utf-8?B?YUVwTW1SUVVuOXY1cDdFLzFScldrejNWMDlrRzF1N1VuUWlaUHZaY2ZRYmQ2?=
 =?utf-8?B?QUJLRDlDRGFoeVVoalc1NVN5ZlJrOHpoUGRDUk9KRHE5NDhIUDZqS0xBUElr?=
 =?utf-8?B?VG1XMXRveDFtT01VajJwc2tuQkFoWG1xZmVTSDlxZ1lSN1oxd1hVVmQwSFk2?=
 =?utf-8?B?V3pWSVlZQVlBMmVVNzJMUWxHeG1NOGpPUVY2U012VCs3bGtJTHEzSlUydTRj?=
 =?utf-8?B?WGJmeEVLSjdNSnU4WlltNytsWW90R1N6YTdieVlodXVxekFLSUNWQVc4MzhS?=
 =?utf-8?B?NTRBaUdVK0d6MWZ6bTJ2bVQ0T1E2TFdRWjJVaU03Q0R6ZmVvUXVrcEZhOHlw?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E02CB5358EC4E64384BDA36099E58E9B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4fa129-dc47-4cb8-84fd-08ddcdeb9506
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 15:29:45.7587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vq/0xeh2O4I3+kziuLKDaLYcpkIfxFi5Z475l2NhysNU6pIA+iNTKykuzlr8Prch369pPL31HyIBOdpj+vHkKVmlIJSsoJ3yNnhT6D+TJnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9844

DQoNCk9uIDcvMjgvMjUgMTY6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wNy4yMDI1
IDE0OjI4LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDcvMjgvMjUg
MTM6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMjgvMDcvMjAyNSAxMTozOCBhbSwg
Tmljb2xhIFZldHJpbmkgd3JvdGU6DQo+Pj4+IE9uIDIwMjUtMDctMjggMTE6MzYsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4gT24gMjUuMDcuMjAyNSAxODoyNCwgRG15dHJvIFByb2tvcGNodWsx
IHdyb3RlOg0KPj4+Pj4+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4+Pj4+PiAr
KysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4+Pj4gQEAgLTE0Miw2ICsxNDIsMzEg
QEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoNCj4+Pj4+PiAgIMKg
wqDCoMKgwqDCoMKgIG1lbW1vdmUuDQo+Pj4+Pj4gICDCoMKgwqDCoMKgIC0gVGFnZ2VkIGFzIGBk
ZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPj4+Pj4+DQo+Pj4+Pj4gK8KgwqAgKiAtIFI1LjUNCj4+
Pj4+PiArwqDCoMKgwqAgLSBDbGFzaGVzIGJldHdlZW4gYml0b3BzIGZ1bmN0aW9ucyBhbmQgbWFj
cm9zIG5hbWVzIGFyZQ0KPj4+Pj4+IGRlbGliZXJhdGUgYW5kIGFyZQ0KPj4+Pj4+ICvCoMKgwqDC
oMKgwqAgbmVlZGVkIGZvciBpbnB1dCB2YWxpZGF0aW9uIGFuZCBlcnJvciBoYW5kbGluZywgZW5z
dXJlcyB0aGF0DQo+Pj4+Pj4gdGhlIHNpemUgb2YNCj4+Pj4+PiArwqDCoMKgwqDCoMKgIHRoZSBv
YmplY3QgYmVpbmcgcG9pbnRlZCB0byBieSAnYWRkcicgbWVldHMgdGhlIG1pbmltdW0NCj4+Pj4+
PiByZXF1aXJlbWVudHMgZm9yDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoCB0aGUgYml0IG9wZXJhdGlv
biwgcHJldmVudGluZyB1bnNhZmUgb3BlcmF0aW9ucyBvbg0KPj4+Pj4+IGltcHJvcGVybHkgc2l6
ZWQgZGF0YQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqAgdHlwZXMgdGhhdCBjb3VsZCBsZWFkIHRvIHVu
ZGVmaW5lZCBiZWhhdmlvciBvciBtZW1vcnkNCj4+Pj4+PiBjb3JydXB0aW9uLg0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqAgVGhlIG1hY3JvcyBlbmNhcHN1bGF0ZSB0aGlzIGNvbmRpdGlvbmFsIGxvZ2lj
IGludG8gYSBzaW5nbGUsDQo+Pj4+Pj4gcmV1c2FibGUgZm9ybTsNCj4+Pj4+PiArwqDCoMKgwqDC
oMKgIHdoaWNoIHNpbXBsaWZpZXMgdGhlIGNvZGUsIGF2b2lkcyByZWR1bmRhbnQgZnVuY3Rpb24g
Y2FsbC4NCj4+Pj4+PiArwqDCoMKgwqAgLSBTcGVjaWZpZWQgbWFjcm9zIHNob3VsZCBiZSBpZ25v
cmVkLg0KPj4+Pj4NCj4+Pj4+IEF0IHRoZSByaXNrIG9mIGdvaW5nIHRvbyBmYXIgd2l0aCBuaXRw
aWNraW5nOiBXaG8gYXJlICJzcGVjaWZpZWQNCj4+Pj4+IG1hY3JvcyIgaGVyZT8gVGhlDQo+Pj4+
PiB0ZXh0IGRvZXNuJ3QgbWVudGlvbiBhbnkgbmFtZXMuIEluIGZhY3QsIHRoZSB3YXkgaXQncyB3
cml0dGVuIGl0DQo+Pj4+PiBjb3VsZCBiZSB0YWtlbiB0bw0KPj4+Pj4gbWVhbiBhbGwgbWFjcm9z
IHRoZXJlLCBpbmNsdWRpbmcgYW55IHRoYXQgYXJlIHlldCB0byBiZSBhZGRlZC4gSQ0KPj4+Pj4g
ZG9uJ3QgdGhpbmsgc3VjaA0KPj4+Pj4gaXMgYXBwcm9wcmlhdGUgZm9yIGEgZGV2aWF0aW9uLg0K
Pj4+Pj4NCj4+Pj4NCj4+Pj4gSSBhZ3JlZSB3aXRoIEphbiBoZXJlLiBFaXRoZXIgeW91IG1ha2Ug
YSBzaW5nbGUgZGV2aWF0aW9uIHJlY29yZA0KPj4+PiBlbmNvbXBhc3NpbmcgYWxsIGRldmlhdGVk
IG1hY3JvcyBvciB5b3UgaGF2ZSBvbmUgcGVyIGRldmlhdGlvbiAoZS5nLiwNCj4+Pj4gb25lIGZv
ciBpcnEuaCwgb25lIGZvciBncmFudF90YWJsZS5oIGFuZCBvbmUgZm9yIGJpdG9wcy5oKSBsaXN0
aW5nIHRoZQ0KPj4+PiBtYWNyb3MgdGhhdCBhcmUgY29uc2lkZXJlZC4gRm9yIGJpdG9wcyBpdCBt
aWdodCBiZSBhIGNvbmNlcm4gdGhlDQo+Pj4+IGFjdHVhbCBmdW5jdGlvbnMgZ29pbmcgb3V0IG9m
IHN5bmMsIGJ1dCBpbiB0aGF0IGNhc2UgeW91IGNvdWxkIGp1c3QNCj4+Pj4gc3BlbGwgb3V0IHRo
ZSBkZXZpYXRpb24gYW5kIHNheSAiYWxsIHBhaXJzIGZ1bmN0aW9ucy9tYWNyb3MgaW4gZmlsZQ0K
Pj4+PiA8ZmlsZT4gdGhhdCBhcmUgZGVmaW5lZCB1c2luZyB0aGUgc2FtZSBpZGVudGlmaWVyIiBv
ciBzb21ldGhpbmcgc2ltaWxhci4NCj4+Pg0KPj4+IEhvbmVzdGx5LCB3aGlsZSB0aGVzZSBleGFt
cGxlcyBtaWdodCBiZSBkZWxpYmVyYXRlLCB0aGV5J3JlIGFsc28gYmFkIGNvZGUuDQo+Pj4NCj4+
PiBJIGRvIG5vdCBpbnRlbnQgdG8gbGV0IHRoZSBiaXRvcHMgYWxpYXNlcyBzdXJ2aXZlIHRoZSBj
bGVhbnVwL2ZpeGVzIEkNCj4+PiBoYXZlIHBsYW5uZWQsIGJ1dCBJIGFsc28gZG9uJ3QgaGF2ZSBh
bnkgaWRlYSB3aGVuIEknbGwgZ2V0IHRvIHRoYXQgd29yay4NCj4+Pg0KPj4+IFdoYXQgd2UgcmVh
bGx5IHdhbnQgdG8gZXhwcmVzcyBpcyAidGhlc2UgYXJlIGJlZ3J1ZGdpbmdseSBhY2NlcHRlZCBp
bg0KPj4+IHRoZSBzaG9ydCB0ZXJtLsKgIGRvbid0IGNvcHkgdGhpcyBwYXR0ZXJuLCBhbmQgaWYg
eW91IGNhbiBmaXggaXQsIHBsZWFzZSBkbyIuDQo+Pj4NCj4+PiB+QW5kcmV3DQo+Pg0KPj4gSGkg
QW5kcmV3IQ0KPj4NCj4+IFBlcmhhcHMgSSBjYW4gdHJ5IHRvIGZpeCB0aGVzZSBuYW1lcyBjbGFz
aGVzLg0KPj4NCj4+IEZvciBjbGFyaXR5Lg0KPj4gSSB3b3VsZCBsaWtlIHRvIHJlbmFtZSBtYWNy
b3MgbmFtZXMgd2l0aCBjYXBpdGFsIGxldHRlcnMuDQo+PiBMaWtlIHRoaXM6DQo+PiAtI2RlZmlu
ZSBfX3Rlc3RfYW5kX2NoYW5nZV9iaXQobnIsIGFkZHIpICh7ICAgICAgICAgICAgICBcDQo+PiAr
I2RlZmluZSBURVNUX0FORF9DSEFOR0VfQklUKG5yLCBhZGRyKSAoeyAgICAgICAgICAgICAgXA0K
Pj4gICAgICAgIGlmICggYml0b3BfYmFkX3NpemUoYWRkcikgKSBfX2JpdG9wX2JhZF9zaXplKCk7
ICAgICBcDQo+PiAgICAgICAgX190ZXN0X2FuZF9jaGFuZ2VfYml0KG5yLCBhZGRyKTsgICAgICAg
ICAgICAgICAgICAgIFwNCj4+ICAgIH0pDQo+Pg0KPj4gQXJlIHlvdSBPSyB3aXRoIHN1Y2ggYXBw
cm9hY2g/DQo+IA0KPiBBbmQgdGhlbiBjaGFuZ2UgYWxsIHVzZSBzaXRlcyBvZiB0aGUgbWFjcm8g
dG8gdGhvc2UgdXBwZXItY2FzZSBmb3Jtcz8NClllcy4NCj4gV2hlbiBldmVyeW9uZSdzIHVzZWQg
dG8gdXNpbmcgdGhlIGxvd2VyLWNhc2Ugb25lcz8NCldlbGwsIHVzZXIgaGFiaXRzIHZzLiBNaXNy
YSBjb21wbGlhbmNlLCBjbGVhciBjb2RlLg0KSSBsaWtlIHNlY29uZCBvbmUuDQpMZXQgbWUgcmVw
ZWF0Lg0KSSBjYW4gcHJlcGFyZSBwYXRjaCAoaXQgd2lsbCB0b3VjaCBtYW55IHBsYWNlcyBpbiBj
b2RlIGJhc2UpLCBhbmQgbGV0IA0KbWFpbnRhaW5lcnMgZGVjaWRlIHdoYXQgdG8gZG8gd2l0aCBp
dC4NCg0KV2hpbGUgcGF0Y2ggd2l0aCBkZXZpYXRpb25zIHdpbGwgYmUgbGlrZSBzcGFyZSBwbGFu
Lg0KDQpKYW4sIEFuZHJldywNCmFyZSB5b3UgYWdyZWUgd2l0aCB0aGlzPw0KDQpEbXl0cm8uDQo+
IA0KPiBKYW4NCg==

