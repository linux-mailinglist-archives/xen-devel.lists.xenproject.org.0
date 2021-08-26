Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2813F878D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173009.315685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEZI-0002J0-Gn; Thu, 26 Aug 2021 12:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173009.315685; Thu, 26 Aug 2021 12:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEZI-0002G5-DW; Thu, 26 Aug 2021 12:33:16 +0000
Received: by outflank-mailman (input) for mailman id 173009;
 Thu, 26 Aug 2021 12:33:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJEZG-0002Fz-Sa
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:33:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7a3caee-0669-11ec-a9f7-12813bfff9fa;
 Thu, 26 Aug 2021 12:33:14 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-473g442kORGY5U0dmnM4ww-1;
 Thu, 26 Aug 2021 14:33:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 12:33:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 12:33:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.16 via Frontend Transport; Thu, 26 Aug 2021 12:33:09 +0000
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
X-Inumbo-ID: c7a3caee-0669-11ec-a9f7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629981193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWtafB0ootCVPI9jhuSP2flVgwPhT0YnJA1eiCBAh2Y=;
	b=ZX/ohF9gKSldX4phc8DK2UFDwQ4qVFROVxsnP+s7vxFSzFXDzhYxRH8141JqGLypCV2m7e
	x8yuUypUXAp+fqc6Sle4jy3/Wo5jfcAlL/88Ww3UxYBzB1vziMzszvZ+w4H/E2dAKYK1Y5
	Z5rdxIfpMJds5ZoYh6fTOBcLQ3dWrZs=
X-MC-Unique: 473g442kORGY5U0dmnM4ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0cn3t4Qs6dUk3s+4kB5CV12JTi66ZqUOFrb6/99BNyFxOjZ2wGuNRmDUcxpRvRhSXsKAiz8YoVbuLpRK2AwhvgAu3jIAE0+naLPkeLTkuDdWYijocqfxKM8N8k3GNfZmhysSkih9YZ9MOVk3tST3foTf+sk+w/BaFK8cJi85AGVLpFRQbkZH3qJ52qRandFA/o3COJAN21w2ruYxyEXtkXfTfHmipuJOmdJivJfDyWIlh9X2LRlZHHZTRdcvFYTn9n82IN0FRHpMkyMvfM7HNHziKW0DLRNl1pQS3ap7vQ7JiUs3UMAqYDeN2Pw5gxzwtHaBgIWc25Q4+8kIAkKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEsPCMr11BnFmve3pFKcIxyR3ZldFnfLnTTlG6tJ9kk=;
 b=H0pwXJnQTXnrcSOtsgMJGjJXkFaEYVjg5/BoNoMJjnaDdnqNiyTnQ7q63Sz0r+N++TecqVgRSTehWTxnoFrSmFdT7GAgBa+fO9Q1APUCtn9ruerIUGrHFFvayFmQ+Dtq0yqJ1rElz2ohhfGL/RwKKCs/0tEr2Tqz7XlNIl6FYIPtB6BHhz81Mj4E46MWge1W4Cza6NdsERDiSGKszncC2Fjp0uncf9TaZ4AJPSBj7V9Xl7DQEwuhR9/igawzejjTCZav/A+WD2qzb5DVHfb/TcOCy3W21u2wVi5sUAaRR9w3DMqWHg0Azqq9iALEagovYGRgXGEIAP1GE+9krkwi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 2/8] AMD/IOMMU: obtain IVHD type to use earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <e4124802-d671-0e19-a062-f71b251cdfad@suse.com>
 <d9647381-1acf-621e-b150-ca00b62c9efa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61ee54f7-8c17-9782-23c7-cc8a534018ad@suse.com>
Date: Thu, 26 Aug 2021 14:33:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d9647381-1acf-621e-b150-ca00b62c9efa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b354181-61bf-46fe-9fe6-08d9688da9d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150949F26507B69B593E897B3C79@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5thwVYG6Tg15neR0CiCRMDAcsDQ0iMRRTW2s0WplqtAVE4zT49I+LjkLNrQzJrS9VA3rNW95PuGUNOZY0aDFdwdHGwSC6zi/obmqG24sm47IKtho+36SAKXcHkmmBmU/HpJ3QLIwDxG2cJzYePpkCcDMYOBOslr1Ah4jpCFKiAxmCAsoJZ0mkfwj+4brI3mjiww5HtNCCgH6NKugrCrr18cdnMWZu8q6VmKE299bDd5gO7h7bI/3g0ZRZKRgT9URs7MIVIYBbjZ9VKDBZ0btszU8ytUzHr41dQF92v5UuZsscfxXjIzVe9c1muRfzJsHIm4ZmjqZA/Dubsnz3nj271nDGvyyhu5JEi72RN7INf1L9AonBuFy+NAWxajzy/AXL33hbApQRcuqsPMxknjghmTLzG4vQryWoXs6IElnzXZ8AtOWswgA8j23UtjUJ84OZ/R36RyRy+abuoFAo6clmP9hAddItdXYdRYOTCcxxB370fPyGQ6/1dK/G/bGtN3r/vOY1Aqo7VO7gf/fp+XF3b3zbjrESB7qB3RLwxGqRiCY25WuJ2JjDlLqpneJKmqH37uRz9Q3T3+mOKZwMbbxwWSfAYRkrB2Ytl5/uXOXW16jCBIgc6LL3y9uHJt29KUoKV75UnDBKw9lkpRkwc03QxbwwMoXxvJYYapSpJiJ0JaQWzk3V49cFT6g2sZJEES/o5USWQiedvza2jRDHygdgSIYLI4Rl9i98ZKntB8anvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39860400002)(346002)(136003)(6486002)(66556008)(31686004)(53546011)(36756003)(66476007)(2906002)(26005)(86362001)(66946007)(5660300002)(956004)(8676002)(2616005)(31696002)(6916009)(8936002)(83380400001)(478600001)(16576012)(186003)(4326008)(38100700002)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BTvKEzWLvACK0OyID0HZp7G/lb1UR0wf1oj5PDkZSZYt/p26HKvbdJq/YNUf?=
 =?us-ascii?Q?PyCYekXmpWXhJttbH+ZENstMc61SbOI/66/kaLZ+Kiz8X7jD6zfxRt6RO/uO?=
 =?us-ascii?Q?tQ7Sg+3FNJnboEmTD+h2zkB9XLg4IXMGc88PNDvEQQGNNzw60Zb6ha4FQ52s?=
 =?us-ascii?Q?7z60UqeQyXU+ASS7DeO/k/NZRon0wZKSrwgGqJMGFtT/jaXKA1A3DebGgjxL?=
 =?us-ascii?Q?b81gslNPvPOtS3zutfzmgnp2/f46WuuS6aSaS3ZKZIiHk/HT7UdXHkvUO4n5?=
 =?us-ascii?Q?hjGPdVbD2ier+oxzLtTnNIM7G7L3abOK6rPbpkQA12yuBRb+3PP0vwQGQGsm?=
 =?us-ascii?Q?3PBJ3OHPT67Lg177amq6QwU65kqoMGwG8DKvyePk/eGeDSAvEBpXY/fV0OQG?=
 =?us-ascii?Q?IQtjkZLm+aNMY6xGcpQRw3qH3arQrmE1t6Fp0WF1HgHwvAm8ebUNw2VrbM8y?=
 =?us-ascii?Q?WHIHTcs8OMGWP17P/DQX/mWFKOf50olOdAnreCUWQmzn5bPQBrxOHy5jMGl1?=
 =?us-ascii?Q?+20/3NWhQWBnju7Gbztt/OMJye6FRycNHEqbkldIH3TQUJM/4dLFhHNssJ/S?=
 =?us-ascii?Q?YqVYMu0Js600ubZ+AGfxKDYUhV9clPxYA7VDORIkIcSyhSSUC8QG2lxByhLh?=
 =?us-ascii?Q?LTu2QESrgcj8naNfv37OJGlV1Wfgarnlk2/HcPUDZ/JX3G+VIFt02ku0YI4m?=
 =?us-ascii?Q?qg6Ktjao5LwAlRdfs0XdCblK2XntBNqfXVg8+J8gMN95yuKXzxIACc/Vj130?=
 =?us-ascii?Q?5Q7h8rnQn+b8/vG5/lIceJO4I2Op5NBve9yz4ucNKVZ4CeobOduH1nJX0toz?=
 =?us-ascii?Q?aib2uWL6roaSo2MRHsPYnyeoR5WLueLkEX3knDyxG8mppy1GK2v7noJrtQTb?=
 =?us-ascii?Q?+1RbrUpURupK2OrJyNi23nzL+DM6gkADVqpBxp6uM3gjV8NWg/ZRgdtYGz4u?=
 =?us-ascii?Q?EeXHyJtWjYLfZ65P3gTLS9UnxYZ8iRzIuI3rH++BmkFaSAlH+eXz9ggW67QK?=
 =?us-ascii?Q?XhoNG1U7n59X3hiB/9mhtM0Km97PY87mJhjef60N4pPEj4iM9xGN+WVKIo8M?=
 =?us-ascii?Q?Uhtq62iX4NVyL8ttVid6CFjj7dL/UWaDgdBpH3jj9zMJvZ1YVPYaQOowES87?=
 =?us-ascii?Q?u0j2Jhop1BH0LM0X0RhCbFv3kEBZ5wy92NXLoSiNXmXiRtRzB6bKaHUdrrVT?=
 =?us-ascii?Q?0btMmvxsubASGCdU9SxbTc+XSzAZVPwn3IwqgARqUbZWs7Pda/jU7px7DHjI?=
 =?us-ascii?Q?FS439APEppi0wUIPJPW4zoFkrm5vzUMqBW1AhCjw5fncV6NbOuKHcUgMutpX?=
 =?us-ascii?Q?C6Mn3sz8eKq5veF3qq/YpA8a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b354181-61bf-46fe-9fe6-08d9688da9d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:33:09.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3EyZPITv+9+JMu+oDMOXhuAhROSNyqmOEr5WbNTtu47j2iQlPLn//W21qM463hRUN01XcjRswnDCH0TWA/Ksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 26.08.2021 14:30, Andrew Cooper wrote:
> On 26/08/2021 08:23, Jan Beulich wrote:
>> Doing this in amd_iommu_prepare() is too late for it, in particular, to
>> be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
>> to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
>> (luckily) pretty simple, (pretty importantly) without breaking
>> amd_iommu_prepare()'s logic to prevent multiple processing.
>>
>> This involves moving table checksumming, as
>> amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
>> now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). I=
n
>> the course of dojng so stop open-coding acpi_tb_checksum(), seeing that
>=20
> doing.
>=20
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -1150,20 +1152,7 @@ static int __init parse_ivrs_table(struc
>>  static int __init detect_iommu_acpi(struct acpi_table_header *table)
>>  {
>>      const struct acpi_ivrs_header *ivrs_block;
>> -    unsigned long i;
>>      unsigned long length =3D sizeof(struct acpi_table_ivrs);
>> -    u8 checksum, *raw_table;
>> -
>> -    /* validate checksum: sum of entire table =3D=3D 0 */
>> -    checksum =3D 0;
>> -    raw_table =3D (u8 *)table;
>> -    for ( i =3D 0; i < table->length; i++ )
>> -        checksum +=3D raw_table[i];
>> -    if ( checksum )
>> -    {
>> -        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum)=
;
>> -        return -ENODEV;
>> -    }
>> =20
>>      while ( table->length > (length + sizeof(*ivrs_block)) )
>>      {
>> @@ -1300,6 +1289,15 @@ get_supported_ivhd_type(struct acpi_tabl
>>  {
>>      size_t length =3D sizeof(struct acpi_table_ivrs);
>>      const struct acpi_ivrs_header *ivrs_block, *blk =3D NULL;
>> +    uint8_t checksum;
>> +
>> +    /* Validate checksum: Sum of entire table =3D=3D 0. */
>> +    checksum =3D acpi_tb_checksum(ACPI_CAST_PTR(uint8_t, table), table-=
>length);
>> +    if ( checksum )
>> +    {
>> +        AMD_IOMMU_DEBUG("IVRS Error: Invalid Checksum %#x\n", checksum)=
;
>=20
> I know you're just moving code, but this really needs to be a visible
> error.=C2=A0 It's "I'm turning off the IOMMU because the ACPI table is ba=
d",
> which is about as serious as errors come.

I'll wait for us settling on patch 1 in this regard, and then follow
the same model here.

Jan


