Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A76F40C6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528438.821578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmyX-0003MI-Mt; Tue, 02 May 2023 10:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528438.821578; Tue, 02 May 2023 10:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmyX-0003Ka-Jt; Tue, 02 May 2023 10:11:13 +0000
Received: by outflank-mailman (input) for mailman id 528438;
 Tue, 02 May 2023 10:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptmyV-0003KU-SH
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:11:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a64ff230-e8d1-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:11:07 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:11:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6152.namprd03.prod.outlook.com (2603:10b6:208:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:11:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:11:01 +0000
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
X-Inumbo-ID: a64ff230-e8d1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683022267;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YB1v6eMwKwthpuGEZUBw5DLY5WhZFvqP0KKlCoDLEa0=;
  b=I0Gl62pgNa4Ym33Rapcf3DZKSLE1644n9x0Y4MBFERZLAW25QqPYv29b
   6bx/rHHGa12wBW+1hc8hV3I2id0p/MuTdzm7rbtLF2bxCfzLb7fVLn8VA
   BMzvN9jNrT+maCFtCU/iY1p1hPg6Vhvkr1EGg8Ndo5Y+uQ0uYBJJyGWpS
   A=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 107440925
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3jfhTaJOKm1AP97MFE+RHJQlxSXFcZb7ZxGr2PjKsXjdYENS3jxSy
 zBKW22HPf6LYWT3eNx0PoTlpB5Q78LXmtA2HVNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pE11/6
 8QiNwsDRQ6e3f+M8eKfFs9V05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv02bOTxXKhBer+EpWA0ONmm2XPxVcqJyYNWFip/6mwukWhDoc3x
 0s8v3BGQbIJ3EyiTd7ndxS9qWyDuFgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBBzN1ubmRYXuY/6WTq3W5Pi19BW0IaDIATAAFy8L+u4x1hRXKJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMIOiaOy+Amehyr2/8eWCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnzjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:BEak76mVvcyndKpFxTq8erpV/CrpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3Apkj6emsJRgvcs5uQjflRdlUw6It7YEHs0k/qPHS?=
 =?us-ascii?q?2Inh0EqCveA+0pIVdxp8=3D?=
X-Talos-MUID: 9a23:HYAp8AnBXRDg4gGhU7/3dnpaEtpk+JzyC3s0vq4dtsqWa3x5CzyC2WE=
X-IronPort-AV: E=Sophos;i="5.99,243,1677560400"; 
   d="scan'208";a="107440925"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdQ6UwkklcwRH6HDP8BBmJ7VSL0EAyT2Z6SbvPpZnm/Joe0fQRR4uxwRO+3GXQgIETw5uiHULHSCEB/pzwUEFFZQfQ+1zzcCe4kfGwcxI3ux5f9b3mHh9/+m7lFKeBaBRDRw5Wq3NnqQOQd2OieGk03+sDGdKOaSmapxYcVRPsHw/so7EJ9m+8DAr+gj0ea9TjO4dG+CKQkF7xY/FoNFNqn0cMzqVi/cPUuSgkogQD/eZ3uZYh5n7Sx0/gbshg7AE0u6odhmJNkyOsqO0aZk8wYBQI2qwuLobEh+PeZf04zEG/Eyk96sHz7WY4colqtBzJ4pVrYGz9CyAjC1MRg27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BE+8aTgQq0j7fMxCMU6txBUZTgnLVdNNaZi1+b/qx8=;
 b=MKzdG40lb+4c8WlZVMdGiPhPaI+GvBZ57ZVfu2Uz4lEjdchAJsqvf8q7ji8EwiJWq9zahPdoi0rd+c3w9cbQeHpLedbLhRc2AvCMB7LxZTL3axJBLj9qVpqEx0S/Zq+J/R+lLk9YHG2Fs08hffJepetEXlY2xc3wgRSGYNWmXm/KTarfLNv3nLg+CJNES+H44U2/BrNEQQUockcZoMoH97DCSfqNpHxhYMYsVCYc7z5IKLBno+8+Yu6kUSCV8SyiXOxcwHY7BtleosuYgx/2iVwLmcwf+1xdiwF/rj2B2FsoFj3wBIaq2PgA3TjdG47T0TnX0hJl+pzGf/NQCrvPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BE+8aTgQq0j7fMxCMU6txBUZTgnLVdNNaZi1+b/qx8=;
 b=okjlOUYa7lBuvRQVrFe70MaxR/1ZUdeiGVyyarlcvSIbfXiYzHHM3kSiTHxTlT+sSUd2TEB6WVNiIyw51A9Dsy6jbbm5N8Kqy/rBiklgXA7ZDpl+AbDxiP7sjz+9km4TcHmqHr7GvHaNKdxQgZvIHvFiLI2vT1MjHPX3hfiJxV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:10:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ruben Hakobyan <hakor@amazon.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/msi: dynamically map pages for MSI-X tables
Message-ID: <ZFDhr+IlwjCDPOOC@Air-de-Roger>
References: <20230426145520.40554-1-hakor@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230426145520.40554-1-hakor@amazon.com>
X-ClientProxiedBy: LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1c8ae6-692d-4ada-29bb-08db4af58824
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HmSr5/ajl6GJlEH+N7xomL2Yde8SuqG7qyrITcVvrYhblO1K88LKENs1UqafY9mxJkEibscftOI2Ys2BwCnEexkELfESbPc8B6Je0NmzZ4Osxj+p+yMijUKGxEO/A72unArE8S0oB8E9kGDAU4uGtXUyhM/8Q/y7ZhwpuCeglJSK3Be+y1SZKemz1ZC3TV5joYeFF1zcATMSZIj0j8/nEl9X/Bi5v6QDlzX6MLdC4ltsloPohz/fM3BATmIujAdNtCUXTz/AL469lKZzE3T0wPH5QUM7yPhCu0pGjK2Ty4SmPktWgeU31kDslOzHxuCRK/R7eVNr0VPXcfzvnm/c4TPyTlYYz+Au4/7Ka1j8wEWwPWW95WdYx3J6Xb/UrpbNeCb98O9W2q+InmK41DDM8k7FvOboTJmP0v5oukHK3ok9IG2S9D03Zy+5dQ11CIzKQjRM/ygUmu2UmKZ7k/+H82BoqMznTIbnCuy3N01+bQV4k2BRFem/+kRKRtXbJWeWf9KlN6jE/Y59eNdfcHiA0UgTmO7vsv2WASyN97EH6wuvw1qVQcqgPcUM95DRGOSi9z3g31YHl16qlFI4F8FufzFJDadKUgHzVjM+d3J5FF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(8936002)(38100700002)(2906002)(41300700001)(8676002)(5660300002)(85182001)(33716001)(86362001)(6486002)(6666004)(6506007)(9686003)(26005)(6512007)(54906003)(478600001)(83380400001)(186003)(6916009)(66556008)(66946007)(66476007)(316002)(4326008)(82960400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHVNOU9Yenh1eTJnbjl3allENmdKaGdybkMyK0JEenh0bk9TQW00VFdQbWhT?=
 =?utf-8?B?YTNOU3A5KzRBSkRUM2V6ckFLT2NMeERhbS9MMjBhNWR6cXhhVFUwcmR5OTlr?=
 =?utf-8?B?M3J6Z2MwQlhpZnJtWTZyQzFTM1RVODVuQ0IrNWFES3VsS2ZWdUlxNENGLzV0?=
 =?utf-8?B?UHZib0UySFdEQ29aRE9UV2lRUUh1ZTd6Q1dTVWFaVFRDWFYwMFB1YkNpQWpy?=
 =?utf-8?B?TlZCZFZmQlNoZFhiS2pBRk5lMitoT3RhUWRpYWRVZTM4emwzaThRblNpR2lM?=
 =?utf-8?B?bEYrU29CTDB6eWdLVW4rS08weXZCM3ZadmFWeDNtQ1F2UkJUc3poTGt6WDdv?=
 =?utf-8?B?VTdIR3gzRWRBNjlUSm1XclJYdENmTDJjYzNYN2lYK1J6Y1pMZFhiL3h5OVlw?=
 =?utf-8?B?NzNjYWoxNExFRnZLQkVZcVVSVmJRZ0hEWWlJSFB0elpTcVlJdE83RXZpMWMr?=
 =?utf-8?B?bDYvSDVHTW02US9TSk8wM2RHdEdLWGhkQzdQdnVrWTZBOWk5Q2ZoUXhYRHps?=
 =?utf-8?B?bXBoYVlqbW1SRUdGWDJJQi9zM1J0OFJZdE5DYkZKMWRzS0xmVmQwMEF4U1p3?=
 =?utf-8?B?cDg1bW92dG93NzRJZzl2T1ZUSXVENTd1cUJYN1lOZTFWRk9rbFJmZ1Y3dWpt?=
 =?utf-8?B?NFkzNzlXVXFLc2FxemlJV3ZHOGdGd1UzOTFEQ1oxdEdMelFGbjZncDdOaE80?=
 =?utf-8?B?eHU4Nnd4TVlTT0I5ZDdTUTBzLzFoL3BneUV2OUdtNUwwcWZaZDJEMjZoTmpI?=
 =?utf-8?B?a0VTc1pBRkZpTjRlN2JnS005allhb2pDa1JKRWtQditUc3diTEdxOWdwNUZn?=
 =?utf-8?B?WjZwRjY4YktjWlhIVTRFUU5hdmdYaU9DQW84cTRoSERBUEJUemNRanhFNUx2?=
 =?utf-8?B?ajN6SW9Tc0RlTWh0elVERWFQTmk5NXJuZXFhMHFOWUxCcmRIblk1eUJ3czRp?=
 =?utf-8?B?NThuUnF5SjgvWHdKbHYyajNuT2EwdHVyeE1yTmtpQjFSbHRidmVDNUNzZGdP?=
 =?utf-8?B?VFY4NDluTHcrUVBPRTg0Z2VRT3dPdWp2UTZuc0tWalBnRWJSSGFJUzFENXFG?=
 =?utf-8?B?a2QvclRKNG9MYzNTdGhOajZJM0FheVJOcWFlZjZIVkdTN0FzSWRhWUxOMjNJ?=
 =?utf-8?B?N0F3dXdWbVk0b0JVcU44R0lrUGpnNEtBZkw2YlZCTVNtakw1SkVvdkNTUUNv?=
 =?utf-8?B?a09jSExUUGJmaGxwZy9DYTIwRWl3RlpqSHltems5VEk2ZDcyVVgyT1pvQVdl?=
 =?utf-8?B?ajYzVFdUZzgwSVp5Z1BEQWdqM0wyWEp5d0l6NnpTNGRpTE5CUFNTNzBWaTdr?=
 =?utf-8?B?Z2tKbGk1bHgyR0dnMXVSdzVkZ0M3aUJYRTF2S256d0tDUjh3UE1TQU0xditG?=
 =?utf-8?B?cEpxV0ZGaHhPYVFVNXQ3bTlkbGpDY3czbFhIaE5MYlArbUt4NVZkQWxyWE10?=
 =?utf-8?B?akxyWHU3djlkRnE5ZG1CY0lzRXFUZGh3cHlPT1gwdkpEdXdDZUY0M0srZmdY?=
 =?utf-8?B?VEtNb0VwdkJKWUZuMlZyNEREbVRiaFQ1OFdPRWtjOEU0R04zeDdmTzh5ZndO?=
 =?utf-8?B?ajRKclEvdExZL1hrU2VhVXVUa2lma2NzNEVqVHRnMjB5MkRZUWlHa0I1VURF?=
 =?utf-8?B?cUVibVZBMlgwSGZYdEVDRDJJOEJYbVd5RTdpR05FOGNOSkZYVVF2WFJveVlX?=
 =?utf-8?B?bHZ3YWdEaXBmU3VpeUpLN1ozaDFhOEhmOFcwMlBhRGZKTUJRa3BLMjd1citi?=
 =?utf-8?B?YzAwS29xRjBVbU5RMnQrSGtGYkFRdW5wTHdhTitSZHA0dDVsa1JXRzRQWk9z?=
 =?utf-8?B?VXRyd1BUaXBCZUVWc0VNK3drYk1rY2pxQkg5MGZIM3lyNnZ0Y3I3Q1o3U3M1?=
 =?utf-8?B?b2U1YjFmRFA0d1NsRG1pUXdyR3BnU0FyUmwyaTRWSlZlWEhlYTBKSm1nUjls?=
 =?utf-8?B?dlo2bElIVHVuUk1rT0RBNTBjTDIzRytCUElBRU10WkN1Tkdta1NBZ1UyU3FQ?=
 =?utf-8?B?dkhlUE80enZMRStLL3J2cVNRK1V1d0FTY2JITlhITCtURUt6MWUyVHpvVWlj?=
 =?utf-8?B?dHhFZUI3UklVUms4QUhWTFc0V2U3akswOFNJcHZMaHBMQjhPOTRwb2pzRnNw?=
 =?utf-8?B?bE5VZFJuNnJJLzJHSTdRSVZHUGpVSGpuZlZEb0pMY3JzbEV1T2d5ZEc3TVdz?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pcZGgg7v4i8B5Xx7rE+cYCqVHTSizMlAgRybqlQxFqgEDf1LrhWNlaERK/AK6Pa0JXrFvhvB6PPlLOO+CVpaE0zsbU7tQ9jhPe6zGYIZWMsuACY7HWIKXTs+Gp7n7oC/D7QqbiT2efHPySthhVaH+gf1YYkBsoZVHxLeMiwmzW2XEnvIkzOlDuAmdzqD92NgGtxthcDYIogPurrt6Xv6SrlI6Vaqr/HbYxzqFUltrgebeJKliXZP0HjQ3xjyEW2Y5v4jqxX3NzygjxKOO20aDY+BJb9U8KbQ5oPM++L2wMvD2X9yO9974b+yDUCtTq5xQe2CkR9olLFGaR8qV8Yl4mZ4lxja/rXutLo6DJzzNFGs456zay8RPlMoxcWqkupUH9H6Ync1hS+tfVqMeWVh2+uCFkmjctGU12r3PBMbpyMBNLW7BKo8SWh2MgckIwaSFEjq0wXhUubb+8EwYgvGoYLB5P62ZsilHIGWZv3PFwTi0/Sy5cM2CGUdOYNngu5AJHY3RjO0j5XLeB3q6Om5zt3HNnBepB3UUQmNn3r8EKQUnv13aLiKyW3cO2LQnfwFr64VQOR4KGjc7v2PNLBVOPOlkhBhkbA12zuq3nDKLSzzswucCHU1j114wZROtWTJ9XEogxEH+NuI160+d7vb3HZXOFnI5l1Fhr5/ZoEenu30rSQriMkYrNulO5pN40l7sqTpHm1IR6WhdVM8XEkRoq13R6RsnJ7A0BAuqDSzNOW9W+6LV3k1KUkq8floLpqMr0OP90ch0k7B7E8Vn8ECmv+LtP9RFnxCkU0h5pId73nuGkptR0/wWT+KCOgfujhZ8CtesNGXNE0152zFCtv2eUs9iLS4zPCbliiFgXezpQc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1c8ae6-692d-4ada-29bb-08db4af58824
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:11:01.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/orvhqYJj8m3AZYWHpyR4VDBfH6rOhT+ZEI36dCkr6KDK+r51VmRv+QCxhR6I/kNcGLoJ+TYMyqsxf2lBhcDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6152

On Wed, Apr 26, 2023 at 02:55:20PM +0000, Ruben Hakobyan wrote:
> Xen reserves a constant number of pages that can be used for mapping
> MSI-X tables. This limit is defined by FIX_MSIX_MAX_PAGES in fixmap.h.
> 
> Reserving a fixed number of pages could result in an -ENOMEM if a
> device requests a new page when the fixmap limit is exhausted and will
> necessitate manually adjusting the limit before compilation.
> 
> To avoid the issues with the current fixmap implementation, we modify
> the MSI-X page mapping logic to instead dynamically map new pages when
> they are needed by making use of ioremap().

I wonder if Arm plans to reuse this code, and whether then arm32 would
better keep the fixmap implementation to avoid exhausting virtual
address space in that case.

This also have the side effect of ioremap() now possibly allocating a
page in order to fill the page table for the newly allocated VA.

> Signed-off-by: Ruben Hakobyan <hakor@amazon.com>
> ---
>  xen/arch/x86/include/asm/fixmap.h |  2 -
>  xen/arch/x86/include/asm/msi.h    |  5 +--
>  xen/arch/x86/msi.c                | 69 ++++++++-----------------------
>  3 files changed, 19 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
> index 516ec3fa6c..139c3e2dcc 100644
> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -61,8 +61,6 @@ enum fixed_addresses {
>      FIX_ACPI_END = FIX_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1,
>      FIX_HPET_BASE,
>      FIX_TBOOT_SHARED_BASE,
> -    FIX_MSIX_IO_RESERV_BASE,
> -    FIX_MSIX_IO_RESERV_END = FIX_MSIX_IO_RESERV_BASE + FIX_MSIX_MAX_PAGES -1,
>      FIX_TBOOT_MAP_ADDRESS,
>      FIX_APEI_RANGE_BASE,
>      FIX_APEI_RANGE_END = FIX_APEI_RANGE_BASE + FIX_APEI_RANGE_MAX -1,
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index a53ade95c9..16c80c9883 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -55,9 +55,6 @@
>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
>  
> -/* MAX fixed pages reserved for mapping MSIX tables. */
> -#define FIX_MSIX_MAX_PAGES              512
> -
>  struct msi_info {
>      pci_sbdf_t sbdf;
>      int irq;
> @@ -213,7 +210,7 @@ struct arch_msix {
>          unsigned long first, last;
>      } table, pba;
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
> -    int table_idx[MAX_MSIX_TABLE_PAGES];
> +    void __iomem *table_va[MAX_MSIX_TABLE_PAGES];
>      spinlock_t table_lock;
>      bool host_maskall, guest_maskall;
>      domid_t warned;
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index d0bf63df1d..8128274c07 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -24,7 +24,6 @@
>  #include <asm/smp.h>
>  #include <asm/desc.h>
>  #include <asm/msi.h>
> -#include <asm/fixmap.h>
>  #include <asm/p2m.h>
>  #include <mach_apic.h>
>  #include <io_ports.h>
> @@ -39,75 +38,44 @@ boolean_param("msi", use_msi);
>  
>  static void __pci_disable_msix(struct msi_desc *);
>  
> -/* bitmap indicate which fixed map is free */
> -static DEFINE_SPINLOCK(msix_fixmap_lock);
> -static DECLARE_BITMAP(msix_fixmap_pages, FIX_MSIX_MAX_PAGES);
> -
> -static int msix_fixmap_alloc(void)
> -{
> -    int i, rc = -ENOMEM;
> -
> -    spin_lock(&msix_fixmap_lock);
> -    for ( i = 0; i < FIX_MSIX_MAX_PAGES; i++ )
> -        if ( !test_bit(i, &msix_fixmap_pages) )
> -            break;
> -    if ( i == FIX_MSIX_MAX_PAGES )
> -        goto out;
> -    rc = FIX_MSIX_IO_RESERV_BASE + i;
> -    set_bit(i, &msix_fixmap_pages);
> -
> - out:
> -    spin_unlock(&msix_fixmap_lock);
> -    return rc;
> -}
> -
> -static void msix_fixmap_free(int idx)
> -{
> -    spin_lock(&msix_fixmap_lock);
> -    if ( idx >= FIX_MSIX_IO_RESERV_BASE )
> -        clear_bit(idx - FIX_MSIX_IO_RESERV_BASE, &msix_fixmap_pages);
> -    spin_unlock(&msix_fixmap_lock);
> -}
> -
> -static int msix_get_fixmap(struct arch_msix *msix, u64 table_paddr,
> +static void __iomem *msix_map_table(struct arch_msix *msix, u64 table_paddr,

I think msix_{get,put}_entry() might be better, as you are not mapping
and unmapping the table at every call.

>                             u64 entry_paddr)
>  {
>      long nr_page;
> -    int idx;
> +    void __iomem *va = NULL;
>  
>      nr_page = (entry_paddr >> PAGE_SHIFT) - (table_paddr >> PAGE_SHIFT);
>  
>      if ( nr_page < 0 || nr_page >= MAX_MSIX_TABLE_PAGES )
> -        return -EINVAL;
> +        return NULL;
>  
>      spin_lock(&msix->table_lock);
>      if ( msix->table_refcnt[nr_page]++ == 0 )
>      {
> -        idx = msix_fixmap_alloc();
> -        if ( idx < 0 )
> +        va = ioremap(entry_paddr, PAGE_SIZE);

You are missing an 'entry_paddr & PAGE_MASK' here AFAICT, or else
ioremap() won't return a page-aligned address if entry is not the
first one on the requested page when mapping.

> +        if ( va == NULL )
>          {
>              msix->table_refcnt[nr_page]--;
>              goto out;
>          }
> -        set_fixmap_nocache(idx, entry_paddr);
> -        msix->table_idx[nr_page] = idx;
> +        msix->table_va[nr_page] = va;
>      }
>      else
> -        idx = msix->table_idx[nr_page];
> +        va = msix->table_va[nr_page];
>  
>   out:
>      spin_unlock(&msix->table_lock);
> -    return idx;
> +    return va;
>  }
>  
> -static void msix_put_fixmap(struct arch_msix *msix, int idx)
> +static void msix_unmap_table(struct arch_msix *msix, void __iomem *va)

va can be made const here.

>  {
>      int i;
>  
>      spin_lock(&msix->table_lock);
>      for ( i = 0; i < MAX_MSIX_TABLE_PAGES; i++ )
>      {
> -        if ( msix->table_idx[i] == idx )
> +        if ( msix->table_va[i] == va )
>              break;
>      }
>      if ( i == MAX_MSIX_TABLE_PAGES )
> @@ -115,9 +83,8 @@ static void msix_put_fixmap(struct arch_msix *msix, int idx)
>  
>      if ( --msix->table_refcnt[i] == 0 )
>      {
> -        clear_fixmap(idx);
> -        msix_fixmap_free(idx);
> -        msix->table_idx[i] = 0;
> +        vunmap(va);

iounmap()

> +        msix->table_va[i] = NULL;
>      }
>  
>   out:
> @@ -568,8 +535,8 @@ int msi_free_irq(struct msi_desc *entry)
>      }
>  
>      if ( entry->msi_attrib.type == PCI_CAP_ID_MSIX )
> -        msix_put_fixmap(entry->dev->msix,
> -                        virt_to_fix((unsigned long)entry->mask_base));
> +        msix_unmap_table(entry->dev->msix,
> +                       (void*)((unsigned long)entry->mask_base & PAGE_MASK));

Did you consider calling this msix_unmap_entry() and just pass the
entry VA to the function and get the page from there.

round_pgdown() might be helpful here otherwise.

>      list_del(&entry->list);
>      xfree(entry);
> @@ -892,10 +859,10 @@ static int msix_capability_init(struct pci_dev *dev,
>      {
>          /* Map MSI-X table region */
>          u64 entry_paddr = table_paddr + msi->entry_nr * PCI_MSIX_ENTRY_SIZE;
> -        int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
> +        void __iomem *va = msix_map_table(msix, table_paddr, entry_paddr);
>          void __iomem *base;
>  
> -        if ( idx < 0 )
> +        if ( va == NULL )
>          {
>              if ( zap_on_error )
>              {
> @@ -907,9 +874,9 @@ static int msix_capability_init(struct pci_dev *dev,
>  
>              pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
>              xfree(entry);
> -            return idx;
> +            return -ENOMEM;
>          }
> -        base = fix_to_virt(idx) + (entry_paddr & (PAGE_SIZE - 1));
> +        base = va + (entry_paddr & (PAGE_SIZE - 1));

Now that msix_map_table() returns a virtual address, you could likely
do the adjustment in there an return the entry VA from
msix_map_table() or equivalent? (see my naming suggestion above)

Otherwise please use ~PAGE_MASK.

Thanks, Roger.

