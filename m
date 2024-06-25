Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3509916035
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747333.1154715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0qv-0002iz-Fx; Tue, 25 Jun 2024 07:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747333.1154715; Tue, 25 Jun 2024 07:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0qv-0002gd-D7; Tue, 25 Jun 2024 07:44:33 +0000
Received: by outflank-mailman (input) for mailman id 747333;
 Tue, 25 Jun 2024 07:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LI8L=N3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sM0qt-0002gX-S9
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:44:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c05f7f7f-32c6-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 09:44:29 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 07:44:23 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Tue, 25 Jun 2024
 07:44:23 +0000
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
X-Inumbo-ID: c05f7f7f-32c6-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PprnT2BeBnEBqS8d+mUKvYU0tiAtY9xKHag4dbwW3fE9x+/l7+BkUkZTnx0auQ+FzP1qFk0VoHmu5d5gWI8V/3vW7hugfo1ZB4A3KBzIAgvbJAzLEUeDDAUSJzoDHugpJv6w7tHF3hnTM7iko+9TE3hQTqzZjJgZzv7IAt2HXAaMwWYOPuQXg3ZfcKa9uIICV7hZ0c5nmBewohJpYbHPD6k31svNZOSHtt26TP5R3263rwbhLqPsfnKNwB+LZwuX+e4PqIhfPzrFbyXU76HKFJ/Mj1KvTSgFVN9XB8wWQr8G8YkuOIa0y8L4IsyM0bZ91fCmgFP6YOrUxGeHQoY26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJx6ViJPcXtXNzXn2gTQ/hPbyeVW91bxVRT/DOpoabw=;
 b=iRwttaARtP3f41IOwpGKUoe6bcQxvQErjLRuT3ORnnLi6xxMiHCOyQDYagW27JPOrCp1GuHlZzmXN50xh+bKE6gTJ8Cu2fFCZ2WxHcxDOnAuezW5GEHIwxh53NPrr3iw30PZPsUm3g7PJ7qtzsAojwJMDfDcSGE74dKPH6zKcEDio4Al9MzaMJIZqvPIClrAoUlHqoVUCL+Y0G0iUj9fadpqjgvhzVDcyxNdhLqWe69fsPf/KuBLIw4z+0jkkCKyw2M8Rd4rtMVgNJZhXELag2IiyPpdfw4k5SmYJlBcxrbbKPT+6chrgLIcLMevh+legOUyJxNrgIPrIRXLdMqybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJx6ViJPcXtXNzXn2gTQ/hPbyeVW91bxVRT/DOpoabw=;
 b=eLOemueODvGrLuBbLA3dvyhClk7NJB2dq5lEb2+zIeJXRr7QVsbDsgQ+KJH9N7DlHPBch7Q7jSJApY/KurCnMWqc/+EZ+yckluPONjPShIzs9xG1XrWj+RInRiL/YLvRTDzssipT6+/48FXoDCH7J45tJ0TTjCepBgsNyx3Q6eg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony@xenproject.org>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHawJTqXyg3PMEiVUiLHPQ86aZkYrHMFeyAgAGdTwD//43bAIADi4UA//+vaICAAe+IgIAEMRMAgAIOJgA=
Date: Tue, 25 Jun 2024 07:44:23 +0000
Message-ID:
 <BL1PR12MB5849099F40069F7B9C376106E7D52@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
 <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ffd019d-6bab-49d1-932c-7b5aee245f32@suse.com>
In-Reply-To: <1ffd019d-6bab-49d1-932c-7b5aee245f32@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4172:EE_
x-ms-office365-filtering-correlation-id: 8ab1a75b-3344-4e64-80a0-08dc94eaa17a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3ZFqc7o/cn00CCoIqf2gVIyndN38SnRErTfEE89H2Dyvqvw5BF1N4uZAB8?=
 =?iso-8859-1?Q?Mkw/TZCrMaiRvxY2TNZdBf2u+AKzh38k0wOOQmlv2AdafLLcvftfG7n4+x?=
 =?iso-8859-1?Q?fKzVBi2Uv5VV7hEKU6kXgOB/82pGx/O3KA0OGj+i0bJaxWhaVUizHmXUKk?=
 =?iso-8859-1?Q?xbBGnnP/0CbaTcExABQn9M6VB2mMUEHF9/lcDGIDrqlG2Sum6oZONXZ5nU?=
 =?iso-8859-1?Q?g+OzICH7iYrO6KwkoepwUwtmJC0A0NCDJOMyAq4VYJHogrXhd/F56WOkiM?=
 =?iso-8859-1?Q?4/a+7RRI8XsJXpD8D9jDA2BDQlegOl2EuHa6GkLghZi0ATC7tm/48MjS2d?=
 =?iso-8859-1?Q?xzvdVDEVll2a9RdlphzOjCNT1b0ZdGW4k9clJ6IHpJB7rY9eJ4G/o9/BLQ?=
 =?iso-8859-1?Q?3JB5sGKTsVLXVomrNfp1fP8sYuF74DWgorFYvZlpjXDOSOis1quPAfLDDl?=
 =?iso-8859-1?Q?2IbXJ1kvKfeWERYjQqVDC2EGgdu4vTpZfydCPhQxoQ6l80+x0Lhibq1Cko?=
 =?iso-8859-1?Q?knSKqYPBlUV20e2mfYuoUH1Rut2P5atg3hg+yAzYn/lXovvJwTGqJ1Qo47?=
 =?iso-8859-1?Q?6VED+WXZgu6ZU29o4kkthVcQ1g3qiJMyCkRjXHCC73l6oDVvb/bqkgz52B?=
 =?iso-8859-1?Q?Y1nX1QJppN0fR6ua5OS3OlMy7GuTTw/Up2N/w9JaRQ2B0J2tRce7hYQck4?=
 =?iso-8859-1?Q?dqyopo0xfGfKL1FQmVUuea4oKOxbsCL++4gLJV4Cq/5sK59SjjdkM024TK?=
 =?iso-8859-1?Q?I0ZIfYCv1emy2E4raGxivAQ6+9U2ttIM7SXjUPYpTYnTk8kNnAXnKe64Mb?=
 =?iso-8859-1?Q?gge+aDA6WmddM4MVsigycHHne5vWB/HYI3EyJbH8M0C2ks/s5ug8mst648?=
 =?iso-8859-1?Q?BD08OYcwGwNnmmNaUi2VyeHSunL50sFKn7XqU+P9Nm1QJrrh4ene0YkPNb?=
 =?iso-8859-1?Q?xQhpDSoahw/uj0kmP3jiZXcp3vDiGzLkzXlebGQJQMwKjzWZCjMk63XdhH?=
 =?iso-8859-1?Q?H2xfg+kYC9DECZcTmflw326NuFk9WqmbDwW7Ff+1K4R5zw6YOutu18iCv4?=
 =?iso-8859-1?Q?A+3aF0MPiorHkSmI3M3biBfu2d2Tg0lqDaUK3hCdLq9RFklSLe2Tj/s0HX?=
 =?iso-8859-1?Q?yJxCYgjJ8begXBJmb3Q3b1Paiq5TmgyKaUPLXboaf1rWp8ovqE20NjEVdO?=
 =?iso-8859-1?Q?ItDC2OjcucOOWf4gdhJuwQYheZ/ZTIWU4fE7sSyBYMmHwIDx/nIfElG93c?=
 =?iso-8859-1?Q?/gToTkAoYZcoR9saQYd8XDhoVymWU2RYC4q6Ma/xEWHDbC10SIBYB2PFhc?=
 =?iso-8859-1?Q?xBXqAxGS3CHgIF0IKjqgqS46CkArZ7nAOaxOqg0Vzv4BMOuhPLDzVmMHK8?=
 =?iso-8859-1?Q?TPaUTiysEGYTzsIaSu8KnhTTcS8RGdii8i9sHWOjF8hvhP46sN/+k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?p+/VC06KvvTpjLHrM1clgT6vOha6XVJWbvblNwb1Rob/6tSKMoGPpt/q+3?=
 =?iso-8859-1?Q?D27Ta85aQu5c8n7uAw85+b/d5UsJP/xsRLFicll1PdvSWAiThWSv8OSJmD?=
 =?iso-8859-1?Q?/6IOtCsIyWHUXWut67Lp1LUdBsSoboxBwmUCy8pIEuUT7rED3Qu//AhMsW?=
 =?iso-8859-1?Q?Y8qKhsinCAhkWR3SkxDWV4Sqs1ax40wwlYF+fRjWryPPFGJ7zlDxd/FW/h?=
 =?iso-8859-1?Q?hu6O4BlypCk8MW4OzVnE2+12KuspxPYUumsgVmgIWCOUrs30x+AmznX6ON?=
 =?iso-8859-1?Q?3RFdKpPyHhrY7fu621cNHUyWR/51s+NUhKvx4kL1rBoehcauxPscJRdzNR?=
 =?iso-8859-1?Q?TuE3uIo8Qr1qwEWwOl4CrQpzBMoKfmq86ExudTG3fpoVtMGaHrE2Vvg2nS?=
 =?iso-8859-1?Q?cu6Ti1wUmGhEVjbjxM1vqaunQDMSE48UrY1LXgGxJA0sZ04nbMHqcUfeZU?=
 =?iso-8859-1?Q?3iXqn6G7APjcb3MtEMLU18kWERfPxWwuJfr48vqaOik8HbQFYMQefBM+4t?=
 =?iso-8859-1?Q?s5GPVJwyVNKMw0PZXysExEqV9V5+g6AxaiSOGb4q6MqiaDjVX8okOpd+Fu?=
 =?iso-8859-1?Q?0PZRO3uS3ltqXGZwi0hhFcXUEHjIo4oQutd2ytrDmA1+wtmBoypXPdwMdc?=
 =?iso-8859-1?Q?teHX6f0ZL6pfHOPgQxaYn+NbCm6aWtJfqWdUvkrdD12V6TT4ByyQhgbPuJ?=
 =?iso-8859-1?Q?e82UETrIA7ewzBUifueQSYUQ74FnYCyqIprdC86LYy2hX+2d4XoJmTXJX/?=
 =?iso-8859-1?Q?tFgkfo6/jW0nY6sI2M3Npevx17DUWdnFPigVyrKiKA4cGCNsgSeGej6kW1?=
 =?iso-8859-1?Q?gzbgc9c0kpacwWV1189n0nfoVmtxcySwZpTu7/xkQdLbh9EWOlm/cd6krG?=
 =?iso-8859-1?Q?UI5YhTYEzWdQ11rI7r+f61hI6RDBpwcfdN+V4zxauhYT0g5I7RM8UqpXpT?=
 =?iso-8859-1?Q?I2eIB29Rqc9H6iB9fAaSHDiZO4daNKu0d7vcmpDZHpspyvHgjSGmlPm1hf?=
 =?iso-8859-1?Q?LPwtD24Rcrs8Hbm1YbG8Uj7RekvOaOeunkUQbKyATDf8UvhLflM9+Tvi0u?=
 =?iso-8859-1?Q?rW2z142WnHaenSLaqNeYER86orJQL3s2vidyZfqtoaZLd5GBbB4yScoyuo?=
 =?iso-8859-1?Q?XZJ9WaViOg9Kjd+r8z5K43nwjm3OgOEuRoFVkRcHaMNN69j/ykORsChhZ6?=
 =?iso-8859-1?Q?GZR641JOfDyH7iSn1qR6hiEQlFGwF2IpcG9dLKmWw8kjy7dQkoFdiOtHaF?=
 =?iso-8859-1?Q?URcu4GQhUSu4hApYhzq9Z2RTLVug8fUkrUOEFf2lBLqS4MySdRAcgis89n?=
 =?iso-8859-1?Q?kO9TZHjQ4NmbWg5fMqBvAK1/qoiOqsLkK+zdD1iafWEiyb/HHo5aRc5FgG?=
 =?iso-8859-1?Q?7PO0pi++eujEFte2DNiZ5+oAZO0n1kwWQAGsKlCS1ucaQwOy7v1Dhes7hF?=
 =?iso-8859-1?Q?K5XZX62tf8JkNE89n9jmhYkqQ+8R+melAciAukGv0I+b75HqQh926dn87s?=
 =?iso-8859-1?Q?WoxVrsgixwiEMCa7sztWnB9zmyQ9goOfDPYSpHxBB46p6rAHQi+8tSiDOl?=
 =?iso-8859-1?Q?X6TUORT8G8Nen4l6OvbJMW3vTjLU6jQFlIU3al+Ka0PGoFmGwKqWoeIhCe?=
 =?iso-8859-1?Q?5cHtwDObyAjJ4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A80BCD1E8668A34B96D1617554E39362@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab1a75b-3344-4e64-80a0-08dc94eaa17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 07:44:23.2153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVsvO04bczoojJ/LTFRImnELwwd8GZBlwAI3j03m92kTtOatr5ccUaLnz1i9ov+wSkfUIktR/h9nZsoBRQk/ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172

On 2024/6/24 16:17, Jan Beulich wrote:
> On 21.06.2024 10:20, Chen, Jiqian wrote:
>> On 2024/6/20 18:42, Jan Beulich wrote:
>>> On 20.06.2024 11:40, Chen, Jiqian wrote:
>>>> On 2024/6/18 17:23, Jan Beulich wrote:
>>>>> On 18.06.2024 10:23, Chen, Jiqian wrote:
>>>>>> On 2024/6/17 23:32, Jan Beulich wrote:
>>>>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>>>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *eg=
c,
>>>>>>>>              rc =3D ERROR_FAIL;
>>>>>>>>              goto out;
>>>>>>>>          }
>>>>>>>> -        r =3D xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>>>>>>>> +#ifdef CONFIG_X86
>>>>>>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_=
permission */
>>>>>>>> +        r =3D xc_domain_getinfo_single(ctx->xch, 0, &info);
>>>>>>>
>>>>>>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_S=
ELF, but
>>>>>>> I didn't check if that can be used with the underlying hypercall(s)=
. Otherwise
>>>> From the commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf, DOMID_SELF i=
s not allowed for XEN_DOMCTL_getdomaininfo.
>>>> And now XEN_DOMCTL_getdomaininfo gets domain through rcu_lock_domain_b=
y_id.
>>>>
>>>>>>> you want to pass the actual domid of the local domain here.
>>>> What is the local domain here?
>>>
>>> The domain your code is running in.
>>>
>>>> What is method for me to get its domid?
>>>
>>> I hope there's an available function in one of the libraries to do that=
.
>> I didn't find relate function.
>> Hi Anthony, do you know?
>>
>>> But I wouldn't even know what to look for; that's a question to (primar=
ily)
>>> Anthony then, who sadly continues to be our only tool stack maintainer.
>>>
>>> Alternatively we could maybe enable XEN_DOMCTL_getdomaininfo to permit
>>> DOMID_SELF.
>> It didn't permit DOMID_SELF since below commit. Does it still have the s=
ame problem if permit DOMID_SELF?
>=20
> To answer this, all respective callers would need auditing. However, ...
>=20
>> commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf
>> Author: kfraser@localhost.localdomain <kfraser@localhost.localdomain>
>> Date:   Tue Aug 14 09:56:46 2007 +0100
>>
>>     xen: Do not accept DOMID_SELF as input to DOMCTL_getdomaininfo.
>>     This was screwing up callers that loop on getdomaininfo(), if there
>>     was a domain with domid DOMID_FIRST_RESERVED-1 (=3D=3D DOMID_SELF-1)=
.
>>     They would see DOMID_SELF-1, then look up DOMID_SELF, which has domi=
d
>>     0 of course, and then start their domain-finding loop all over again=
!
>>     Found by Kouya Shimura <kouya@jp.fujitsu.com>. Thanks!
>>     Signed-off-by: Keir Fraser <keir@xensource.com>
>=20
> ... I view this as a pretty odd justification for the change, when imo th=
e
> bogus loops should instead have been adjusted.
Yes, you are right.
And Anthony suggested to use LIBXL_TOOLSTACK_DOMID to replace 0 domid.
It seems there is no need to change hypercall DOMCTL_getdomaininfo for now?

>=20
> Jan
>=20
>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>> index 09a1e84d98e0..5d29667b7c3d 100644
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -463,19 +463,13 @@ long do_domctl(XEN_GUEST_HANDLE(xen_domctl_t) u_do=
mctl)
>>      case XEN_DOMCTL_getdomaininfo:
>>      {
>>          struct domain *d;
>> -        domid_t dom;
>> -
>> -        dom =3D op->domain;
>> -        if ( dom =3D=3D DOMID_SELF )
>> -            dom =3D current->domain->domain_id;
>> +        domid_t dom =3D op->domain;
>>
>>          rcu_read_lock(&domlist_read_lock);
>>
>>          for_each_domain ( d )
>> -        {
>>              if ( d->domain_id >=3D dom )
>>                  break;
>> -        }
>>
>>          if ( d =3D=3D NULL )
>>          {
>=20

--=20
Best regards,
Jiqian Chen.

